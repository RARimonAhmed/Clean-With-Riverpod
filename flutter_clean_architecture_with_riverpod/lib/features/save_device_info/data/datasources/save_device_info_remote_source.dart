import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture_with_riverpod/shared/domain/models/save_device_info/save_device_info_model.dart';

import '../../../../shared/data/remote/network_services.dart';
import '../../../../shared/exceptions/http_exception.dart';

abstract class DeviceInfoDataSource {
  Future<Either<AppException, DeviceInfoModel>> saveDeviceInfo({required DeviceInfoModel deviceInfoModel});
}

class DeviceInfoRemoteDataSource implements DeviceInfoDataSource {
  final NetworkService networkService;

  DeviceInfoRemoteDataSource(this.networkService);

  @override
  Future<Either<AppException, DeviceInfoModel>> saveDeviceInfo({required DeviceInfoModel deviceInfoModel}) async {
    try {
      final eitherType = await networkService.post(
        '/saveDeviceInfo',
        data: deviceInfoModel.toJson(),
      );
      return eitherType.fold(
            (exception) {
          return Left(exception);
        },
            (response) {
          final deviceInfo = DeviceInfoModel.fromJson(response.data['data']['device_info']);
          networkService.updateHeader(
            {'Authorization': deviceInfo.deviceToken},
          );

          print("Rimon debugging ${response.code}");
          print("Rimon debugging ${response.data}");

          return Right(deviceInfo);
        },
      );
    } catch (e) {
      return Left(
        AppException(
          message: 'Unknown error occurred',
          statusCode: 1,
          identifier: '${e.toString()}\nLoginUserRemoteDataSource.loginUser',
        ),
      );
    }
  }
}
