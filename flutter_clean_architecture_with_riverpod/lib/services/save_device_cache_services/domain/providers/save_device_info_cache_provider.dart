import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../shared/data/local/storage_services.dart';
import '../../../../shared/domain/providers/sharedpreferences_storage_service_provider.dart';
import '../../data/datasources/save_device_info_local_sources.dart';
import '../../data/repositories/save_device_info_local_sources_impl.dart';
import '../repositories/save_device_info_local_repository.dart';
final deviceInfoDatasourceProvider = Provider.family<DeviceInfoLocalDataSource, StroageService>(
      (_, networkService) => LocalDataSourceDeviceInfo(networkService),
);

final deviceInfoLocalRepositoryProvider = Provider<DeviceInfoLocalRepository>((ref) {
  final storageService = ref.watch(storageServiceProvider);

  final datasource = ref.watch(deviceInfoDatasourceProvider(storageService));

  final respository = DeviceInfoLocalRepoImpl(datasource);

  return respository;
});
