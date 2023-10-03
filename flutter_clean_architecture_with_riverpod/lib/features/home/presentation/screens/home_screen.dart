import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../routes/app_route.dart';

@RoutePage()
class HomeScreen extends ConsumerStatefulWidget {
  static const String routeName = '/homeScreen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final AppRouter appRouter = AppRouter();
  @override
  void initState() {
    super.initState();
    // Future.delayed(const Duration(seconds: 2), () async {
    //   // final isUserLoggedIn = await ref.read(userLoginCheckProvider.future);
    //   // final route = isUserLoggedIn
    //   //     ? const DashboardRoute()
    //   //     : LoginRoute() as PageRouteInfo;
    //   // ignore: use_build_context_synchronously
    //   AutoRouter.of(context).pushAndPopUntil(
    //     route,
    //     predicate: (_) => false,
    //   );
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: const Center(
        child: Text(
          'Home Screen',
          style: TextStyle(
            color: Colors.blueGrey,
            fontWeight: FontWeight.w600,
            fontSize: 18.0,
          ),
        ),
      ),
    );
  }
}
