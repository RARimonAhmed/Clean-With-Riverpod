import 'package:flutter_clean_architecture_with_riverpod/services/save_device_cache_services/domain/providers/save_device_info_cache_provider.dart';
import 'package:flutter_clean_architecture_with_riverpod/shared/domain/models/save_device_info/save_device_info_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final currentDeviceInfoProvider = FutureProvider<DeviceInfoModel?>((ref) async {
  final repository = ref.watch(deviceInfoLocalRepositoryProvider);
  final eitherType = (await repository.fetchDeviceInfo());

  return eitherType.fold((l) => null, (r) => r);
});
