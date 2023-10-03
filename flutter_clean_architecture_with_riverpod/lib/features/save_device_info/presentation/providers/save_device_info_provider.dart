import 'package:flutter_clean_architecture_with_riverpod/features/save_device_info/domain/repositories/save_device_info_repository.dart';
import 'package:flutter_clean_architecture_with_riverpod/features/save_device_info/presentation/providers/state/save_device_info_notifier.dart';
import 'package:flutter_clean_architecture_with_riverpod/features/save_device_info/presentation/providers/state/save_device_info_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../services/save_device_cache_services/domain/providers/save_device_info_cache_provider.dart';
import '../../../../services/save_device_cache_services/domain/repositories/save_device_info_local_repository.dart';
import '../../domain/providers/save_device_info_provider.dart';

final deviceInfoStateNotifierProvider =
    StateNotifierProvider<DeviceInfoNotifier, DeviceInfoState>(
  (ref) {
    final DeviceInfoRepository deviceInfoRepository =
        ref.watch(deviceInfoRepositoryProvider);
    final DeviceInfoLocalRepository deviceInfoLocalRepository =
        ref.watch(deviceInfoLocalRepositoryProvider);
    return DeviceInfoNotifier(
        deviceInfoRepository: deviceInfoRepository,
        deviceInfoLocalRepository: deviceInfoLocalRepository);
  },
);
