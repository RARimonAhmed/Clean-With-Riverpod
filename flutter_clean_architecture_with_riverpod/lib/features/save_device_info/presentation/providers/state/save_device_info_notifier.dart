import 'package:flutter_clean_architecture_with_riverpod/features/save_device_info/data/repositories/save_device_info_repository_impl.dart';
import 'package:flutter_clean_architecture_with_riverpod/features/save_device_info/domain/repositories/save_device_info_repository.dart';
import 'package:flutter_clean_architecture_with_riverpod/features/save_device_info/presentation/providers/state/save_device_info_state.dart';
import 'package:flutter_clean_architecture_with_riverpod/shared/domain/models/save_device_info/save_device_info_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../services/save_device_cache_services/domain/repositories/save_device_info_local_repository.dart';
import '../../../../../shared/exceptions/http_exception.dart';

class DeviceInfoNotifier extends StateNotifier<DeviceInfoState> {
  final DeviceInfoRepository deviceInfoRepository;
  final DeviceInfoLocalRepository deviceInfoLocalRepository;

  DeviceInfoNotifier({
    required this.deviceInfoRepository,
    required this.deviceInfoLocalRepository,
  }) : super(const DeviceInfoState.initial());

  Future<void> saveDeviceInfo(DeviceInfoModel deviceInfoModel) async {
    state = const DeviceInfoState.loading();

    if(deviceInfoRepository is DeviceInfoRepositoryImpl){
      print("Alamin debugging : AuthenticationRepositoryImpl");
    }else{
      print("Alamin debugging : Not AuthenticationRepositoryImpl");
    }

    final response = await deviceInfoRepository.saveDeviceInfo(
      deviceInfoModel: DeviceInfoModel(userId: deviceInfoModel.userId,deviceUuid: deviceInfoModel.deviceUuid,deviceDensity: deviceInfoModel.deviceDensity,deviceWidth: deviceInfoModel.deviceWidth,deviceHeight: deviceInfoModel.deviceHeight,deviceToken: deviceInfoModel.deviceToken,deviceType: deviceInfoModel.deviceType,appVersionName: deviceInfoModel.appVersionName,appVersionCode: deviceInfoModel.appVersionCode,permissions: deviceInfoModel.permissions,deviceImei: deviceInfoModel.deviceImei,deviceManufacturer: deviceInfoModel.deviceManufacturer,deviceBrand: deviceInfoModel.deviceBrand,deviceProduct: deviceInfoModel.deviceProduct,deviceModel: deviceInfoModel.deviceModel,deviceOsVersion: deviceInfoModel.deviceOsVersion,deviceSdkVersion: deviceInfoModel.deviceSdkVersion,packageName: deviceInfoModel.packageName,doyaUpdateDate: deviceInfoModel.doyaUpdateDate,notificationStatus: deviceInfoModel.notificationStatus),
    );

    state = await response.fold(
          (failure) => DeviceInfoState.failure(failure),
          (deviceInfo) async {
        final hasSavedDeviceInfo = await deviceInfoLocalRepository.saveDeviceInfo(deviceInfoModel: deviceInfo);
        if (hasSavedDeviceInfo) {
          return const DeviceInfoState.success();
        }
        return DeviceInfoState.failure(CacheFailureException());
      },
    );
  }
}
