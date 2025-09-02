// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'submission_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SubmissionResponse _$SubmissionResponseFromJson(Map<String, dynamic> json) {
  return _SubmissionResponse.fromJson(json);
}

/// @nodoc
mixin _$SubmissionResponse {
  String get id => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SubmissionResponseCopyWith<SubmissionResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubmissionResponseCopyWith<$Res> {
  factory $SubmissionResponseCopyWith(
          SubmissionResponse value, $Res Function(SubmissionResponse) then) =
      _$SubmissionResponseCopyWithImpl<$Res, SubmissionResponse>;
  @useResult
  $Res call({String id, String status, String? message});
}

/// @nodoc
class _$SubmissionResponseCopyWithImpl<$Res, $Val extends SubmissionResponse>
    implements $SubmissionResponseCopyWith<$Res> {
  _$SubmissionResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? status = null,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SubmissionResponseImplCopyWith<$Res>
    implements $SubmissionResponseCopyWith<$Res> {
  factory _$$SubmissionResponseImplCopyWith(_$SubmissionResponseImpl value,
          $Res Function(_$SubmissionResponseImpl) then) =
      __$$SubmissionResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String status, String? message});
}

/// @nodoc
class __$$SubmissionResponseImplCopyWithImpl<$Res>
    extends _$SubmissionResponseCopyWithImpl<$Res, _$SubmissionResponseImpl>
    implements _$$SubmissionResponseImplCopyWith<$Res> {
  __$$SubmissionResponseImplCopyWithImpl(_$SubmissionResponseImpl _value,
      $Res Function(_$SubmissionResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? status = null,
    Object? message = freezed,
  }) {
    return _then(_$SubmissionResponseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SubmissionResponseImpl implements _SubmissionResponse {
  const _$SubmissionResponseImpl(
      {required this.id, required this.status, this.message});

  factory _$SubmissionResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubmissionResponseImplFromJson(json);

  @override
  final String id;
  @override
  final String status;
  @override
  final String? message;

  @override
  String toString() {
    return 'SubmissionResponse(id: $id, status: $status, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubmissionResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, status, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SubmissionResponseImplCopyWith<_$SubmissionResponseImpl> get copyWith =>
      __$$SubmissionResponseImplCopyWithImpl<_$SubmissionResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SubmissionResponseImplToJson(
      this,
    );
  }
}

abstract class _SubmissionResponse implements SubmissionResponse {
  const factory _SubmissionResponse(
      {required final String id,
      required final String status,
      final String? message}) = _$SubmissionResponseImpl;

  factory _SubmissionResponse.fromJson(Map<String, dynamic> json) =
      _$SubmissionResponseImpl.fromJson;

  @override
  String get id;
  @override
  String get status;
  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$SubmissionResponseImplCopyWith<_$SubmissionResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
