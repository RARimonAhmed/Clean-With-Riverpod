// To parse this JSON data, do
//
//     final parseResponse = parseResponseFromMap(jsonString);

// class ParseResponse<T> {
//   ParseResponse({
//     this.status,
//     this.message,
//     this.data,
//     this.success = false,
//   });
//   final bool success;
//   final String? status;
//   final String? message;
//   final T? data;
//
//   factory ParseResponse.fromMap(dynamic json,
//       {required T Function(dynamic) modifier}) {
//     return ParseResponse<T>(
//       success: json['status'] == 'success',
//       status: json['status'],
//       message: json['message'],
//       data: modifier(json),
//     );
//   }
// }


// To parse this JSON data, do
//
//     final parseResponse = parseResponseFromJson(jsonString);

import 'dart:convert';

ParseResponse parseResponseFromJson(String str) => ParseResponse.fromJson(json.decode(str));

String parseResponseToJson(ParseResponse data) => json.encode(data.toJson());

class ParseResponse {
  String messageBn;
  String messageEn;
  Data data;
  int code;

  ParseResponse({
    required this.messageBn,
    required this.messageEn,
    required this.data,
    required this.code,
  });

  factory ParseResponse.fromJson(Map<String, dynamic> json) => ParseResponse(
    messageBn: json["message_bn"],
    messageEn: json["message_en"],
    data: Data.fromJson(json["data"]),
    code: json["code"],
  );

  Map<String, dynamic> toJson() => {
    "message_bn": messageBn,
    "message_en": messageEn,
    "data": data.toJson(),
    "code": code,
  };
}

class Data {
  DeviceInfo deviceInfo;

  Data({
    required this.deviceInfo,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    deviceInfo: DeviceInfo.fromJson(json["device_info"]),
  );

  Map<String, dynamic> toJson() => {
    "device_info": deviceInfo.toJson(),
  };
}

class DeviceInfo {
  int id;
  String userId;
  String accessToken;
  String deviceUuid;
  String deviceDensity;
  String deviceWidth;
  String deviceHeight;
  String deviceToken;
  String deviceType;
  String appVersionName;
  String appVersionCode;
  String permissions;
  String deviceImei;
  String deviceManufacturer;
  String deviceBrand;
  String deviceProduct;
  String deviceModel;
  String deviceOsVersion;
  String deviceSdkVersion;
  String packageName;
  DateTime doyaUpdateDate;
  DateTime createdAt;
  DateTime updatedAt;

  DeviceInfo({
    required this.id,
    required this.userId,
    required this.accessToken,
    required this.deviceUuid,
    required this.deviceDensity,
    required this.deviceWidth,
    required this.deviceHeight,
    required this.deviceToken,
    required this.deviceType,
    required this.appVersionName,
    required this.appVersionCode,
    required this.permissions,
    required this.deviceImei,
    required this.deviceManufacturer,
    required this.deviceBrand,
    required this.deviceProduct,
    required this.deviceModel,
    required this.deviceOsVersion,
    required this.deviceSdkVersion,
    required this.packageName,
    required this.doyaUpdateDate,
    required this.createdAt,
    required this.updatedAt,
  });

  factory DeviceInfo.fromJson(Map<String, dynamic> json) => DeviceInfo(
    id: json["id"],
    userId: json["user_id"],
    accessToken: json["access_token"],
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
    packageName: json["package_name"],
    doyaUpdateDate: DateTime.parse(json["doya_update_date"]),
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "access_token": accessToken,
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
    "package_name": packageName,
    "doya_update_date": doyaUpdateDate.toIso8601String(),
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
