// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patients.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PatientImpl _$$PatientImplFromJson(Map<String, dynamic> json) =>
    _$PatientImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      dob: json['dob'] as String,
      phone: json['phone'] as String,
      gender: json['gender'] as String,
      bloodPressure: json['bloodPressure'] as String,
      bodyTemperature: json['bodyTemperature'] as String,
      email: json['email'] as String?,
      symptoms: json['symptoms'] as String?,
      healthRecords: (json['healthRecords'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      diagnosisAnalysis: json['diagnosisAnalysis'] as String?,
    );

Map<String, dynamic> _$$PatientImplToJson(_$PatientImpl instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'name': instance.name,
    'dob': instance.dob,
    'phone': instance.phone,
    'gender': instance.gender,
    'bloodPressure': instance.bloodPressure,
    'bodyTemperature': instance.bodyTemperature,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('email', instance.email);
  writeNotNull('symptoms', instance.symptoms);
  writeNotNull('healthRecords', instance.healthRecords);
  writeNotNull('diagnosisAnalysis', instance.diagnosisAnalysis);
  return val;
}
