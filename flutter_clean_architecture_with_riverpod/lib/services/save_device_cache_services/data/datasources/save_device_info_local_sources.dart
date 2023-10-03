import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture_with_riverpod/shared/domain/models/save_device_info/save_device_info_model.dart';
import '../../../../shared/data/local/storage_services.dart';
import '../../../../shared/exceptions/http_exception.dart';
import '../../../../shared/globals.dart';

abstract class DeviceInfoLocalDataSource {
  String get storageKey;

  Future<Either<AppException, DeviceInfoModel>> fetchDeviceInfo();
  Future<bool> saveDeviceInfoLocally({required DeviceInfoModel deviceInfoModel});
  Future<bool> deleteDeviceInfo();
  Future<bool> hasSaveDeviceInfo();
}

class LocalDataSourceDeviceInfo extends DeviceInfoLocalDataSource {
  LocalDataSourceDeviceInfo(this.stroageService);

  final StroageService stroageService;

  @override
  String get storageKey => USER_LOCAL_STORAGE_KEY;

  @override
  Future<Either<AppException, DeviceInfoModel>> fetchDeviceInfo() async {
    final data = await stroageService.get(storageKey);
    if (data == null) {
      return Left(
        AppException(
          identifier: 'LocalDataSourceDeviceInfo',
          statusCode: 404,
          message: 'User not found',
        ),
      );
    }
    final deviceInfoJson = jsonDecode(data.toString());

    return Right(DeviceInfoModel.fromJson(deviceInfoJson));
  }

  @override
  Future<bool> saveDeviceInfoLocally({required DeviceInfoModel deviceInfoModel}) async {
    return await stroageService.set(storageKey, jsonEncode(deviceInfoModel.toJson()));
  }

  @override
  Future<bool> deleteDeviceInfo() async {
    return await stroageService.remove(storageKey);
  }

  @override
  Future<bool> hasSaveDeviceInfo() async {
    return await stroageService.has(storageKey);
  }
}
