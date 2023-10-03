import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_with_riverpod/configs/save_device_info_config.dart';
import 'package:flutter_clean_architecture_with_riverpod/routes/app_route.gr.dart';
import 'package:flutter_clean_architecture_with_riverpod/shared/domain/models/save_device_info/save_device_info_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../routes/app_route.dart';
import '../../../save_device_info/presentation/providers/save_device_info_provider.dart';
import '../../../save_device_info/presentation/providers/state/save_device_info_state.dart';

@RoutePage()
class SplashScreen extends ConsumerStatefulWidget {
  static const String routeName = '/splashScreen';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  final AppRouter appRouter = AppRouter();
  DeviceDetails details = DeviceDetails();
  DeviceInfoModel? deviceInfoModel;
  @override
  void initState() {
    super.initState();
    deviceInformation();
    Future.delayed(const Duration(seconds: 10), () async {
      // final isUserLoggedIn = await ref.read(userLoginCheckProvider.future);
      const route = HomeRoute();
      // ignore: use_build_context_synchronously
      AutoRouter.of(context).pushAndPopUntil(
        route,
        predicate: (_) => false,
      );
    });
  }

  deviceInformation() async {
    deviceInfoModel =  await details.getDeviceInformation("It will set");
    saveDeviceInformation(deviceInfoModel!);
  }

  saveDeviceInformation(DeviceInfoModel deviceInfoModel){
    ref.read(deviceInfoStateNotifierProvider.notifier).saveDeviceInfo(deviceInfoModel);
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(deviceInfoStateNotifierProvider);
    ref.listen(
      deviceInfoStateNotifierProvider.select((value) => value),
      ((previous, next) {
        //show Snackbar on failure
        if (next is Failure) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(next.exception.message.toString())));
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(next.exception.statusCode.toString())));
        } else if (next is Success) {
          // AutoRouter.of(context)
          //     .pushAndPopUntil(const DashboardRoute(), predicate: (_) => false);
          print("Successfully device Info called");
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Successfully device Info called")));
        }
      }),
    );
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            state.maybeMap(
              loading: (_) => const Center(child: CircularProgressIndicator()),
              failure: (_) => Text("Failed"),
              success: (_) => Text("Device brand is ${ref.watch(deviceInfoStateNotifierProvider.notifier.select((value) => deviceInfoModel!.deviceBrand))}"),
              orElse: () => Text("Waiting"),
            ),
            const Text(
              'Splash Screen',
              style: TextStyle(
                color: Colors.cyan,
                fontWeight: FontWeight.w600,
                fontSize: 18.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
