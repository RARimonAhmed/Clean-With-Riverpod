import 'package:flutter_clean_architecture_with_riverpod/features/save_device_info/data/datasources/save_device_info_remote_source.dart';
import 'package:flutter_clean_architecture_with_riverpod/features/save_device_info/data/repositories/save_device_info_repository_impl.dart';
import 'package:flutter_clean_architecture_with_riverpod/features/save_device_info/domain/repositories/save_device_info_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../shared/data/remote/network_services.dart';
import '../../../../shared/domain/providers/dio_network_service_provider.dart';

final deviceInfoDataSourceProvider =
Provider.family<DeviceInfoDataSource, NetworkService>(
      (_, networkService) => DeviceInfoRemoteDataSource(networkService),
);

final deviceInfoRepositoryProvider = Provider<DeviceInfoRepository>(
      (ref) {
    final NetworkService networkService = ref.watch(netwokServiceProvider);
    final DeviceInfoDataSource deviceInfoDataSource =
    ref.watch(deviceInfoDataSourceProvider(networkService));
    return DeviceInfoRepositoryImpl(deviceInfoDataSource);
  },
);
