import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture_with_riverpod/shared/domain/models/save_device_info/save_device_info_model.dart';
import '../../../../shared/exceptions/http_exception.dart';
abstract class DeviceInfoLocalRepository {
  Future<Either<AppException, DeviceInfoModel>> fetchDeviceInfo();
  Future<bool> saveDeviceInfo({required DeviceInfoModel deviceInfoModel});
  Future<bool> deleteDeviceInfo();
  Future<bool> hasDeviceInfo();
}
