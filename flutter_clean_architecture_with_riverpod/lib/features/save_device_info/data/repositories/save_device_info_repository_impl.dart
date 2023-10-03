import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture_with_riverpod/features/save_device_info/data/datasources/save_device_info_remote_source.dart';
import 'package:flutter_clean_architecture_with_riverpod/features/save_device_info/domain/repositories/save_device_info_repository.dart';
import 'package:flutter_clean_architecture_with_riverpod/shared/domain/models/save_device_info/save_device_info_model.dart';

import '../../../../shared/exceptions/http_exception.dart';

class DeviceInfoRepositoryImpl extends DeviceInfoRepository {
  final DeviceInfoDataSource deviceInfoDataSource;

  DeviceInfoRepositoryImpl(this.deviceInfoDataSource);

  @override
  Future<Either<AppException, DeviceInfoModel>> saveDeviceInfo({required DeviceInfoModel deviceInfoModel}) {
    return deviceInfoDataSource.saveDeviceInfo(deviceInfoModel: deviceInfoModel);
  }
}
