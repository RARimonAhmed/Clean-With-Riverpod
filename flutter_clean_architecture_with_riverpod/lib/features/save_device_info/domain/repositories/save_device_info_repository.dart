import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture_with_riverpod/shared/domain/models/save_device_info/save_device_info_model.dart';

import '../../../../shared/exceptions/http_exception.dart';

abstract class DeviceInfoRepository {
  Future<Either<AppException, DeviceInfoModel>> saveDeviceInfo({required DeviceInfoModel deviceInfoModel});
}
