// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verify_email_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

VerifyEmailResponse _$VerifyEmailResponseFromJson(Map<String, dynamic> json) {
  return _VerifyEmailResponse.fromJson(json);
}

/// @nodoc
mixin _$VerifyEmailResponse {
  bool get success => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  String? get ref => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;

  /// Serializes this VerifyEmailResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VerifyEmailResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VerifyEmailResponseCopyWith<VerifyEmailResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerifyEmailResponseCopyWith<$Res> {
  factory $VerifyEmailResponseCopyWith(
    VerifyEmailResponse value,
    $Res Function(VerifyEmailResponse) then,
  ) = _$VerifyEmailResponseCopyWithImpl<$Res, VerifyEmailResponse>;
  @useResult
  $Res call({bool success, String? message, String? ref, String? type});
}

/// @nodoc
class _$VerifyEmailResponseCopyWithImpl<$Res, $Val extends VerifyEmailResponse>
    implements $VerifyEmailResponseCopyWith<$Res> {
  _$VerifyEmailResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VerifyEmailResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = freezed,
    Object? ref = freezed,
    Object? type = freezed,
  }) {
    return _then(
      _value.copyWith(
            success:
                null == success
                    ? _value.success
                    : success // ignore: cast_nullable_to_non_nullable
                        as bool,
            message:
                freezed == message
                    ? _value.message
                    : message // ignore: cast_nullable_to_non_nullable
                        as String?,
            ref:
                freezed == ref
                    ? _value.ref
                    : ref // ignore: cast_nullable_to_non_nullable
                        as String?,
            type:
                freezed == type
                    ? _value.type
                    : type // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$VerifyEmailResponseImplCopyWith<$Res>
    implements $VerifyEmailResponseCopyWith<$Res> {
  factory _$$VerifyEmailResponseImplCopyWith(
    _$VerifyEmailResponseImpl value,
    $Res Function(_$VerifyEmailResponseImpl) then,
  ) = __$$VerifyEmailResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, String? message, String? ref, String? type});
}

/// @nodoc
class __$$VerifyEmailResponseImplCopyWithImpl<$Res>
    extends _$VerifyEmailResponseCopyWithImpl<$Res, _$VerifyEmailResponseImpl>
    implements _$$VerifyEmailResponseImplCopyWith<$Res> {
  __$$VerifyEmailResponseImplCopyWithImpl(
    _$VerifyEmailResponseImpl _value,
    $Res Function(_$VerifyEmailResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of VerifyEmailResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = freezed,
    Object? ref = freezed,
    Object? type = freezed,
  }) {
    return _then(
      _$VerifyEmailResponseImpl(
        success:
            null == success
                ? _value.success
                : success // ignore: cast_nullable_to_non_nullable
                    as bool,
        message:
            freezed == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                    as String?,
        ref:
            freezed == ref
                ? _value.ref
                : ref // ignore: cast_nullable_to_non_nullable
                    as String?,
        type:
            freezed == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$VerifyEmailResponseImpl implements _VerifyEmailResponse {
  const _$VerifyEmailResponseImpl({
    required this.success,
    this.message,
    this.ref,
    this.type,
  });

  factory _$VerifyEmailResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$VerifyEmailResponseImplFromJson(json);

  @override
  final bool success;
  @override
  final String? message;
  @override
  final String? ref;
  @override
  final String? type;

  @override
  String toString() {
    return 'VerifyEmailResponse(success: $success, message: $message, ref: $ref, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerifyEmailResponseImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.ref, ref) || other.ref == ref) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, message, ref, type);

  /// Create a copy of VerifyEmailResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VerifyEmailResponseImplCopyWith<_$VerifyEmailResponseImpl> get copyWith =>
      __$$VerifyEmailResponseImplCopyWithImpl<_$VerifyEmailResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$VerifyEmailResponseImplToJson(this);
  }
}

abstract class _VerifyEmailResponse implements VerifyEmailResponse {
  const factory _VerifyEmailResponse({
    required final bool success,
    final String? message,
    final String? ref,
    final String? type,
  }) = _$VerifyEmailResponseImpl;

  factory _VerifyEmailResponse.fromJson(Map<String, dynamic> json) =
      _$VerifyEmailResponseImpl.fromJson;

  @override
  bool get success;
  @override
  String? get message;
  @override
  String? get ref;
  @override
  String? get type;

  /// Create a copy of VerifyEmailResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VerifyEmailResponseImplCopyWith<_$VerifyEmailResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
