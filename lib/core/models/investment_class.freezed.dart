// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'investment_class.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

InvestmentClass _$InvestmentClassFromJson(Map<String, dynamic> json) {
  return _InvestmentClass.fromJson(json);
}

/// @nodoc
mixin _$InvestmentClass {
  String? get logo => throw _privateConstructorUsedError;
  int get classId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  InvestmentClassOption get options => throw _privateConstructorUsedError;

  /// Serializes this InvestmentClass to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of InvestmentClass
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InvestmentClassCopyWith<InvestmentClass> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvestmentClassCopyWith<$Res> {
  factory $InvestmentClassCopyWith(
    InvestmentClass value,
    $Res Function(InvestmentClass) then,
  ) = _$InvestmentClassCopyWithImpl<$Res, InvestmentClass>;
  @useResult
  $Res call({
    String? logo,
    int classId,
    String name,
    String description,
    InvestmentClassOption options,
  });

  $InvestmentClassOptionCopyWith<$Res> get options;
}

/// @nodoc
class _$InvestmentClassCopyWithImpl<$Res, $Val extends InvestmentClass>
    implements $InvestmentClassCopyWith<$Res> {
  _$InvestmentClassCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InvestmentClass
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? logo = freezed,
    Object? classId = null,
    Object? name = null,
    Object? description = null,
    Object? options = null,
  }) {
    return _then(
      _value.copyWith(
            logo:
                freezed == logo
                    ? _value.logo
                    : logo // ignore: cast_nullable_to_non_nullable
                        as String?,
            classId:
                null == classId
                    ? _value.classId
                    : classId // ignore: cast_nullable_to_non_nullable
                        as int,
            name:
                null == name
                    ? _value.name
                    : name // ignore: cast_nullable_to_non_nullable
                        as String,
            description:
                null == description
                    ? _value.description
                    : description // ignore: cast_nullable_to_non_nullable
                        as String,
            options:
                null == options
                    ? _value.options
                    : options // ignore: cast_nullable_to_non_nullable
                        as InvestmentClassOption,
          )
          as $Val,
    );
  }

  /// Create a copy of InvestmentClass
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InvestmentClassOptionCopyWith<$Res> get options {
    return $InvestmentClassOptionCopyWith<$Res>(_value.options, (value) {
      return _then(_value.copyWith(options: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$InvestmentClassImplCopyWith<$Res>
    implements $InvestmentClassCopyWith<$Res> {
  factory _$$InvestmentClassImplCopyWith(
    _$InvestmentClassImpl value,
    $Res Function(_$InvestmentClassImpl) then,
  ) = __$$InvestmentClassImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? logo,
    int classId,
    String name,
    String description,
    InvestmentClassOption options,
  });

  @override
  $InvestmentClassOptionCopyWith<$Res> get options;
}

/// @nodoc
class __$$InvestmentClassImplCopyWithImpl<$Res>
    extends _$InvestmentClassCopyWithImpl<$Res, _$InvestmentClassImpl>
    implements _$$InvestmentClassImplCopyWith<$Res> {
  __$$InvestmentClassImplCopyWithImpl(
    _$InvestmentClassImpl _value,
    $Res Function(_$InvestmentClassImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of InvestmentClass
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? logo = freezed,
    Object? classId = null,
    Object? name = null,
    Object? description = null,
    Object? options = null,
  }) {
    return _then(
      _$InvestmentClassImpl(
        logo:
            freezed == logo
                ? _value.logo
                : logo // ignore: cast_nullable_to_non_nullable
                    as String?,
        classId:
            null == classId
                ? _value.classId
                : classId // ignore: cast_nullable_to_non_nullable
                    as int,
        name:
            null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                    as String,
        description:
            null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                    as String,
        options:
            null == options
                ? _value.options
                : options // ignore: cast_nullable_to_non_nullable
                    as InvestmentClassOption,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$InvestmentClassImpl implements _InvestmentClass {
  const _$InvestmentClassImpl({
    this.logo,
    required this.classId,
    required this.name,
    required this.description,
    required this.options,
  });

  factory _$InvestmentClassImpl.fromJson(Map<String, dynamic> json) =>
      _$$InvestmentClassImplFromJson(json);

  @override
  final String? logo;
  @override
  final int classId;
  @override
  final String name;
  @override
  final String description;
  @override
  final InvestmentClassOption options;

  @override
  String toString() {
    return 'InvestmentClass(logo: $logo, classId: $classId, name: $name, description: $description, options: $options)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvestmentClassImpl &&
            (identical(other.logo, logo) || other.logo == logo) &&
            (identical(other.classId, classId) || other.classId == classId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.options, options) || other.options == options));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, logo, classId, name, description, options);

  /// Create a copy of InvestmentClass
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InvestmentClassImplCopyWith<_$InvestmentClassImpl> get copyWith =>
      __$$InvestmentClassImplCopyWithImpl<_$InvestmentClassImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$InvestmentClassImplToJson(this);
  }
}

abstract class _InvestmentClass implements InvestmentClass {
  const factory _InvestmentClass({
    final String? logo,
    required final int classId,
    required final String name,
    required final String description,
    required final InvestmentClassOption options,
  }) = _$InvestmentClassImpl;

  factory _InvestmentClass.fromJson(Map<String, dynamic> json) =
      _$InvestmentClassImpl.fromJson;

  @override
  String? get logo;
  @override
  int get classId;
  @override
  String get name;
  @override
  String get description;
  @override
  InvestmentClassOption get options;

  /// Create a copy of InvestmentClass
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InvestmentClassImplCopyWith<_$InvestmentClassImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
