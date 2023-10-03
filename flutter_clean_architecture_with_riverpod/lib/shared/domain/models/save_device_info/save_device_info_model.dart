import 'package:equatable/equatable.dart';

class DeviceInfoModel extends Equatable {
  String userId;
  final String deviceUuid;
  final String deviceDensity;
  final String deviceWidth;
  final String deviceHeight;
  final String deviceToken;
  final String deviceType;
  final String appVersionName;
  final String appVersionCode;
  dynamic permissions;
  dynamic deviceImei;
  final String deviceManufacturer;
  final String deviceBrand;
  final String deviceProduct;
  final String deviceModel;
  final String deviceOsVersion;
  final String deviceSdkVersion;
  final String packageName;
  String? doyaUpdateDate;
  final String notificationStatus;

  DeviceInfoModel({
    this.userId = '',
    this.deviceUuid = '',
    this.deviceDensity = '',
    this.deviceWidth = '',
    this.deviceHeight = '',
    this.deviceToken = '',
    this.deviceType = '',
    this.appVersionName = '',
    this.appVersionCode = '',
    this.permissions,
    this.deviceImei,
    this.deviceManufacturer = '',
    this.deviceBrand = '',
    this.deviceProduct = '',
    this.deviceModel = '',
    this.deviceOsVersion = '',
    this.deviceSdkVersion = '',
    this.packageName = '',
    this.doyaUpdateDate,
    this.notificationStatus = '',
  });

  factory DeviceInfoModel.fromJson(Map<String, dynamic> json) =>
      DeviceInfoModel(
        userId: json["user_id"],
        deviceUuid: json["device_uuid"],
        deviceDensity: json["device_density"],
        deviceWidth: json["device_width"],
        deviceHeight: json["device_height"],
        deviceToken: json["device_token"],
        deviceType: json["device_type"],
        appVersionName: json["app_version_name"],
        appVersionCode: json["app_version_code"],
        permissions: json["permissions"],
        deviceImei: json["device_imei"],
        deviceManufacturer: json["device_manufacturer"],
        deviceBrand: json["device_brand"],
        deviceProduct: json["device_product"],
        deviceModel: json["device_model"],
        deviceOsVersion: json["device_os_version"],
        deviceSdkVersion: json["device_sdk_version"],
        packageName: json["package_name"].toString(),
        doyaUpdateDate: json["doya_update_date"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "device_uuid": deviceUuid,
        "device_density": deviceDensity,
        "device_width": deviceWidth,
        "device_height": deviceHeight,
        "device_token": deviceToken,
        "device_type": deviceType,
        "app_version_name": appVersionName,
        "app_version_code": appVersionCode,
        "permissions": permissions,
        "device_imei": deviceImei,
        "device_manufacturer": deviceManufacturer,
        "device_brand": deviceBrand,
        "device_product": deviceProduct,
        "device_model": deviceModel,
        "device_os_version": deviceOsVersion,
        "device_sdk_version": deviceSdkVersion,
        "package_name": packageName.toString(),
        "doya_update_date": doyaUpdateDate,
      };
  @override
  List<Object?> get props => [
        userId,
        deviceUuid,
        deviceDensity,
        deviceWidth,
        deviceHeight,
        deviceToken,
        deviceType,
        appVersionName,
        appVersionCode,
        permissions,
        deviceImei,
        deviceManufacturer,
        deviceBrand,
        deviceProduct,
        deviceModel,
        deviceOsVersion,
        deviceSdkVersion,
        packageName,
        doyaUpdateDate,
        notificationStatus
      ];

  DeviceInfoModel copyWith(
      String? userId,
      String? deviceUuid,
      String? deviceDensity,
      String? deviceWidth,
      String? deviceHeight,
      String? deviceToken,
      String? deviceType,
      String? appVersionName,
      String? appVersionCode,
      dynamic permissions,
      dynamic deviceImei,
      String? deviceManufacturer,
      String? deviceBrand,
      String? deviceProduct,
      String? deviceModel,
      String? deviceOsVersion,
      String? deviceSdkVersion,
      String? packageName,
      String? doyaUpdateDate) {
    return DeviceInfoModel(
        userId: userId ?? this.userId,
        deviceUuid: deviceUuid ?? this.deviceUuid,
        deviceDensity: deviceDensity ?? this.deviceUuid,
        deviceWidth: deviceWidth ?? this.deviceWidth,
        deviceHeight: deviceHeight ?? this.deviceHeight,
        deviceToken: deviceToken ?? this.deviceToken,
        deviceType: deviceType ?? this.deviceType,
        appVersionName: appVersionName ?? this.appVersionName,
        appVersionCode: appVersionCode ?? this.appVersionCode,
        permissions: permissions ?? this.permissions,
        deviceImei: deviceImei ?? this.deviceImei,
        deviceManufacturer: deviceManufacturer ?? this.deviceManufacturer,
        deviceBrand: deviceBrand ?? this.deviceBrand,
        deviceProduct: deviceProduct ?? this.deviceProduct,
        deviceModel: deviceModel ?? this.deviceModel,
        deviceOsVersion: deviceOsVersion ?? this.deviceOsVersion,
        deviceSdkVersion: deviceSdkVersion ?? this.deviceSdkVersion,
        packageName: packageName ?? this.packageName.toString(),
        doyaUpdateDate: doyaUpdateDate ?? this.doyaUpdateDate.toString());
  }
}
