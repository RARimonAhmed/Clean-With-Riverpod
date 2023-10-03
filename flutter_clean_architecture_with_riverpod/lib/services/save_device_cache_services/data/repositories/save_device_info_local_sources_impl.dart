import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture_with_riverpod/features/save_device_info/data/datasources/save_device_info_remote_source.dart';
import 'package:flutter_clean_architecture_with_riverpod/services/save_device_cache_services/domain/repositories/save_device_info_local_repository.dart';
import 'package:flutter_clean_architecture_with_riverpod/shared/domain/models/save_device_info/save_device_info_model.dart';
import '../../../../shared/domain/models/user/user_model.dart';
import '../../../../shared/exceptions/http_exception.dart';
import '../datasources/save_device_info_local_sources.dart';

class DeviceInfoLocalRepoImpl extends DeviceInfoLocalRepository {
  DeviceInfoLocalRepoImpl(this.dataSource);

  DeviceInfoLocalDataSource dataSource;

  @override
  Future<bool> deleteDeviceInfo() {
    return dataSource.deleteDeviceInfo();
  }

  @override
  Future<Either<AppException, DeviceInfoModel>> fetchDeviceInfo() {
    return dataSource.fetchDeviceInfo();
  }

  @override
  Future<bool> hasDeviceInfo() {
    return dataSource.hasSaveDeviceInfo();
  }

  @override
  Future<bool> saveDeviceInfo({required DeviceInfoModel deviceInfoModel}) {
    return dataSource.saveDeviceInfoLocally(deviceInfoModel: deviceInfoModel);
  }
}
