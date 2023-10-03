import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../../shared/exceptions/http_exception.dart';
part 'save_device_info_state.freezed.dart';

@freezed
abstract class DeviceInfoState with _$DeviceInfoState {
  const factory DeviceInfoState.initial() = Initial;
  const factory DeviceInfoState.loading() = Loading;
  const factory DeviceInfoState.failure(AppException exception) = Failure;
  const factory DeviceInfoState.success() = Success;
}
