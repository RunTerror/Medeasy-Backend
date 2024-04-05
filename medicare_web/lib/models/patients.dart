import 'package:freezed_annotation/freezed_annotation.dart';

part 'patients.freezed.dart';
part 'patients.g.dart';

//ignore_for_file: invalid_annotation_target
@freezed
class Patient with _$Patient {
  const factory Patient(
      {required String id,
      required String name,
      required String dob,
      required String phone,
      required String gender,
      required String bloodPressure,
      required String bodyTemperature,
      @JsonKey(includeIfNull: false) String? email,
      @JsonKey(includeIfNull: false) String? symptoms,
      @JsonKey(includeIfNull: false) List<String>? healthRecords,
      @JsonKey(includeIfNull: false) String? diagnosisAnalysis}) = _Patient;

  factory Patient.fromJson(Map<String, dynamic> json) =>
      _$PatientFromJson(json);
}
