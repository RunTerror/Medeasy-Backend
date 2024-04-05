// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'patients.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Patient _$PatientFromJson(Map<String, dynamic> json) {
  return _Patient.fromJson(json);
}

/// @nodoc
mixin _$Patient {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get dob => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String get gender => throw _privateConstructorUsedError;
  String get bloodPressure => throw _privateConstructorUsedError;
  String get bodyTemperature => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  String? get symptoms => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  List<String>? get healthRecords => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  String? get diagnosisAnalysis => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PatientCopyWith<Patient> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PatientCopyWith<$Res> {
  factory $PatientCopyWith(Patient value, $Res Function(Patient) then) =
      _$PatientCopyWithImpl<$Res, Patient>;
  @useResult
  $Res call(
      {String id,
      String name,
      String dob,
      String phone,
      String gender,
      String bloodPressure,
      String bodyTemperature,
      @JsonKey(includeIfNull: false) String? email,
      @JsonKey(includeIfNull: false) String? symptoms,
      @JsonKey(includeIfNull: false) List<String>? healthRecords,
      @JsonKey(includeIfNull: false) String? diagnosisAnalysis});
}

/// @nodoc
class _$PatientCopyWithImpl<$Res, $Val extends Patient>
    implements $PatientCopyWith<$Res> {
  _$PatientCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? dob = null,
    Object? phone = null,
    Object? gender = null,
    Object? bloodPressure = null,
    Object? bodyTemperature = null,
    Object? email = freezed,
    Object? symptoms = freezed,
    Object? healthRecords = freezed,
    Object? diagnosisAnalysis = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      dob: null == dob
          ? _value.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      bloodPressure: null == bloodPressure
          ? _value.bloodPressure
          : bloodPressure // ignore: cast_nullable_to_non_nullable
              as String,
      bodyTemperature: null == bodyTemperature
          ? _value.bodyTemperature
          : bodyTemperature // ignore: cast_nullable_to_non_nullable
              as String,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      symptoms: freezed == symptoms
          ? _value.symptoms
          : symptoms // ignore: cast_nullable_to_non_nullable
              as String?,
      healthRecords: freezed == healthRecords
          ? _value.healthRecords
          : healthRecords // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      diagnosisAnalysis: freezed == diagnosisAnalysis
          ? _value.diagnosisAnalysis
          : diagnosisAnalysis // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PatientImplCopyWith<$Res> implements $PatientCopyWith<$Res> {
  factory _$$PatientImplCopyWith(
          _$PatientImpl value, $Res Function(_$PatientImpl) then) =
      __$$PatientImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String dob,
      String phone,
      String gender,
      String bloodPressure,
      String bodyTemperature,
      @JsonKey(includeIfNull: false) String? email,
      @JsonKey(includeIfNull: false) String? symptoms,
      @JsonKey(includeIfNull: false) List<String>? healthRecords,
      @JsonKey(includeIfNull: false) String? diagnosisAnalysis});
}

/// @nodoc
class __$$PatientImplCopyWithImpl<$Res>
    extends _$PatientCopyWithImpl<$Res, _$PatientImpl>
    implements _$$PatientImplCopyWith<$Res> {
  __$$PatientImplCopyWithImpl(
      _$PatientImpl _value, $Res Function(_$PatientImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? dob = null,
    Object? phone = null,
    Object? gender = null,
    Object? bloodPressure = null,
    Object? bodyTemperature = null,
    Object? email = freezed,
    Object? symptoms = freezed,
    Object? healthRecords = freezed,
    Object? diagnosisAnalysis = freezed,
  }) {
    return _then(_$PatientImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      dob: null == dob
          ? _value.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      bloodPressure: null == bloodPressure
          ? _value.bloodPressure
          : bloodPressure // ignore: cast_nullable_to_non_nullable
              as String,
      bodyTemperature: null == bodyTemperature
          ? _value.bodyTemperature
          : bodyTemperature // ignore: cast_nullable_to_non_nullable
              as String,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      symptoms: freezed == symptoms
          ? _value.symptoms
          : symptoms // ignore: cast_nullable_to_non_nullable
              as String?,
      healthRecords: freezed == healthRecords
          ? _value._healthRecords
          : healthRecords // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      diagnosisAnalysis: freezed == diagnosisAnalysis
          ? _value.diagnosisAnalysis
          : diagnosisAnalysis // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PatientImpl implements _Patient {
  const _$PatientImpl(
      {required this.id,
      required this.name,
      required this.dob,
      required this.phone,
      required this.gender,
      required this.bloodPressure,
      required this.bodyTemperature,
      @JsonKey(includeIfNull: false) this.email,
      @JsonKey(includeIfNull: false) this.symptoms,
      @JsonKey(includeIfNull: false) final List<String>? healthRecords,
      @JsonKey(includeIfNull: false) this.diagnosisAnalysis})
      : _healthRecords = healthRecords;

  factory _$PatientImpl.fromJson(Map<String, dynamic> json) =>
      _$$PatientImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String dob;
  @override
  final String phone;
  @override
  final String gender;
  @override
  final String bloodPressure;
  @override
  final String bodyTemperature;
  @override
  @JsonKey(includeIfNull: false)
  final String? email;
  @override
  @JsonKey(includeIfNull: false)
  final String? symptoms;
  final List<String>? _healthRecords;
  @override
  @JsonKey(includeIfNull: false)
  List<String>? get healthRecords {
    final value = _healthRecords;
    if (value == null) return null;
    if (_healthRecords is EqualUnmodifiableListView) return _healthRecords;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(includeIfNull: false)
  final String? diagnosisAnalysis;

  @override
  String toString() {
    return 'Patient(id: $id, name: $name, dob: $dob, phone: $phone, gender: $gender, bloodPressure: $bloodPressure, bodyTemperature: $bodyTemperature, email: $email, symptoms: $symptoms, healthRecords: $healthRecords, diagnosisAnalysis: $diagnosisAnalysis)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PatientImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.dob, dob) || other.dob == dob) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.bloodPressure, bloodPressure) ||
                other.bloodPressure == bloodPressure) &&
            (identical(other.bodyTemperature, bodyTemperature) ||
                other.bodyTemperature == bodyTemperature) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.symptoms, symptoms) ||
                other.symptoms == symptoms) &&
            const DeepCollectionEquality()
                .equals(other._healthRecords, _healthRecords) &&
            (identical(other.diagnosisAnalysis, diagnosisAnalysis) ||
                other.diagnosisAnalysis == diagnosisAnalysis));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      dob,
      phone,
      gender,
      bloodPressure,
      bodyTemperature,
      email,
      symptoms,
      const DeepCollectionEquality().hash(_healthRecords),
      diagnosisAnalysis);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PatientImplCopyWith<_$PatientImpl> get copyWith =>
      __$$PatientImplCopyWithImpl<_$PatientImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PatientImplToJson(
      this,
    );
  }
}

abstract class _Patient implements Patient {
  const factory _Patient(
          {required final String id,
          required final String name,
          required final String dob,
          required final String phone,
          required final String gender,
          required final String bloodPressure,
          required final String bodyTemperature,
          @JsonKey(includeIfNull: false) final String? email,
          @JsonKey(includeIfNull: false) final String? symptoms,
          @JsonKey(includeIfNull: false) final List<String>? healthRecords,
          @JsonKey(includeIfNull: false) final String? diagnosisAnalysis}) =
      _$PatientImpl;

  factory _Patient.fromJson(Map<String, dynamic> json) = _$PatientImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get dob;
  @override
  String get phone;
  @override
  String get gender;
  @override
  String get bloodPressure;
  @override
  String get bodyTemperature;
  @override
  @JsonKey(includeIfNull: false)
  String? get email;
  @override
  @JsonKey(includeIfNull: false)
  String? get symptoms;
  @override
  @JsonKey(includeIfNull: false)
  List<String>? get healthRecords;
  @override
  @JsonKey(includeIfNull: false)
  String? get diagnosisAnalysis;
  @override
  @JsonKey(ignore: true)
  _$$PatientImplCopyWith<_$PatientImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
