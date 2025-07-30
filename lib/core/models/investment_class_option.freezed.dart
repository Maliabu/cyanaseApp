// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'investment_class_option.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

InvestmentClassOption _$InvestmentClassOptionFromJson(
  Map<String, dynamic> json,
) {
  return _InvestmentClassOption.fromJson(json);
}

/// @nodoc
mixin _$InvestmentClassOption {
  String get name => throw _privateConstructorUsedError;
  String get classType => throw _privateConstructorUsedError;
  FundManager? get fundManager => throw _privateConstructorUsedError;
  String get handler => throw _privateConstructorUsedError;
  int get minimum => throw _privateConstructorUsedError;
  String get funcManagerCountry => throw _privateConstructorUsedError;
  int get interest => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  double get units => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  DateTime get created => throw _privateConstructorUsedError;

  /// Serializes this InvestmentClassOption to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of InvestmentClassOption
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InvestmentClassOptionCopyWith<InvestmentClassOption> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvestmentClassOptionCopyWith<$Res> {
  factory $InvestmentClassOptionCopyWith(
    InvestmentClassOption value,
    $Res Function(InvestmentClassOption) then,
  ) = _$InvestmentClassOptionCopyWithImpl<$Res, InvestmentClassOption>;
  @useResult
  $Res call({
    String name,
    String classType,
    FundManager? fundManager,
    String handler,
    int minimum,
    String funcManagerCountry,
    int interest,
    String status,
    double units,
    String description,
    DateTime created,
  });

  $FundManagerCopyWith<$Res>? get fundManager;
}

/// @nodoc
class _$InvestmentClassOptionCopyWithImpl<
  $Res,
  $Val extends InvestmentClassOption
>
    implements $InvestmentClassOptionCopyWith<$Res> {
  _$InvestmentClassOptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InvestmentClassOption
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? classType = null,
    Object? fundManager = freezed,
    Object? handler = null,
    Object? minimum = null,
    Object? funcManagerCountry = null,
    Object? interest = null,
    Object? status = null,
    Object? units = null,
    Object? description = null,
    Object? created = null,
  }) {
    return _then(
      _value.copyWith(
            name:
                null == name
                    ? _value.name
                    : name // ignore: cast_nullable_to_non_nullable
                        as String,
            classType:
                null == classType
                    ? _value.classType
                    : classType // ignore: cast_nullable_to_non_nullable
                        as String,
            fundManager:
                freezed == fundManager
                    ? _value.fundManager
                    : fundManager // ignore: cast_nullable_to_non_nullable
                        as FundManager?,
            handler:
                null == handler
                    ? _value.handler
                    : handler // ignore: cast_nullable_to_non_nullable
                        as String,
            minimum:
                null == minimum
                    ? _value.minimum
                    : minimum // ignore: cast_nullable_to_non_nullable
                        as int,
            funcManagerCountry:
                null == funcManagerCountry
                    ? _value.funcManagerCountry
                    : funcManagerCountry // ignore: cast_nullable_to_non_nullable
                        as String,
            interest:
                null == interest
                    ? _value.interest
                    : interest // ignore: cast_nullable_to_non_nullable
                        as int,
            status:
                null == status
                    ? _value.status
                    : status // ignore: cast_nullable_to_non_nullable
                        as String,
            units:
                null == units
                    ? _value.units
                    : units // ignore: cast_nullable_to_non_nullable
                        as double,
            description:
                null == description
                    ? _value.description
                    : description // ignore: cast_nullable_to_non_nullable
                        as String,
            created:
                null == created
                    ? _value.created
                    : created // ignore: cast_nullable_to_non_nullable
                        as DateTime,
          )
          as $Val,
    );
  }

  /// Create a copy of InvestmentClassOption
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FundManagerCopyWith<$Res>? get fundManager {
    if (_value.fundManager == null) {
      return null;
    }

    return $FundManagerCopyWith<$Res>(_value.fundManager!, (value) {
      return _then(_value.copyWith(fundManager: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$InvestmentClassOptionImplCopyWith<$Res>
    implements $InvestmentClassOptionCopyWith<$Res> {
  factory _$$InvestmentClassOptionImplCopyWith(
    _$InvestmentClassOptionImpl value,
    $Res Function(_$InvestmentClassOptionImpl) then,
  ) = __$$InvestmentClassOptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String name,
    String classType,
    FundManager? fundManager,
    String handler,
    int minimum,
    String funcManagerCountry,
    int interest,
    String status,
    double units,
    String description,
    DateTime created,
  });

  @override
  $FundManagerCopyWith<$Res>? get fundManager;
}

/// @nodoc
class __$$InvestmentClassOptionImplCopyWithImpl<$Res>
    extends
        _$InvestmentClassOptionCopyWithImpl<$Res, _$InvestmentClassOptionImpl>
    implements _$$InvestmentClassOptionImplCopyWith<$Res> {
  __$$InvestmentClassOptionImplCopyWithImpl(
    _$InvestmentClassOptionImpl _value,
    $Res Function(_$InvestmentClassOptionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of InvestmentClassOption
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? classType = null,
    Object? fundManager = freezed,
    Object? handler = null,
    Object? minimum = null,
    Object? funcManagerCountry = null,
    Object? interest = null,
    Object? status = null,
    Object? units = null,
    Object? description = null,
    Object? created = null,
  }) {
    return _then(
      _$InvestmentClassOptionImpl(
        name:
            null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                    as String,
        classType:
            null == classType
                ? _value.classType
                : classType // ignore: cast_nullable_to_non_nullable
                    as String,
        fundManager:
            freezed == fundManager
                ? _value.fundManager
                : fundManager // ignore: cast_nullable_to_non_nullable
                    as FundManager?,
        handler:
            null == handler
                ? _value.handler
                : handler // ignore: cast_nullable_to_non_nullable
                    as String,
        minimum:
            null == minimum
                ? _value.minimum
                : minimum // ignore: cast_nullable_to_non_nullable
                    as int,
        funcManagerCountry:
            null == funcManagerCountry
                ? _value.funcManagerCountry
                : funcManagerCountry // ignore: cast_nullable_to_non_nullable
                    as String,
        interest:
            null == interest
                ? _value.interest
                : interest // ignore: cast_nullable_to_non_nullable
                    as int,
        status:
            null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                    as String,
        units:
            null == units
                ? _value.units
                : units // ignore: cast_nullable_to_non_nullable
                    as double,
        description:
            null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                    as String,
        created:
            null == created
                ? _value.created
                : created // ignore: cast_nullable_to_non_nullable
                    as DateTime,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$InvestmentClassOptionImpl implements _InvestmentClassOption {
  const _$InvestmentClassOptionImpl({
    required this.name,
    required this.classType,
    this.fundManager,
    required this.handler,
    required this.minimum,
    required this.funcManagerCountry,
    required this.interest,
    required this.status,
    required this.units,
    required this.description,
    required this.created,
  });

  factory _$InvestmentClassOptionImpl.fromJson(Map<String, dynamic> json) =>
      _$$InvestmentClassOptionImplFromJson(json);

  @override
  final String name;
  @override
  final String classType;
  @override
  final FundManager? fundManager;
  @override
  final String handler;
  @override
  final int minimum;
  @override
  final String funcManagerCountry;
  @override
  final int interest;
  @override
  final String status;
  @override
  final double units;
  @override
  final String description;
  @override
  final DateTime created;

  @override
  String toString() {
    return 'InvestmentClassOption(name: $name, classType: $classType, fundManager: $fundManager, handler: $handler, minimum: $minimum, funcManagerCountry: $funcManagerCountry, interest: $interest, status: $status, units: $units, description: $description, created: $created)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvestmentClassOptionImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.classType, classType) ||
                other.classType == classType) &&
            (identical(other.fundManager, fundManager) ||
                other.fundManager == fundManager) &&
            (identical(other.handler, handler) || other.handler == handler) &&
            (identical(other.minimum, minimum) || other.minimum == minimum) &&
            (identical(other.funcManagerCountry, funcManagerCountry) ||
                other.funcManagerCountry == funcManagerCountry) &&
            (identical(other.interest, interest) ||
                other.interest == interest) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.units, units) || other.units == units) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.created, created) || other.created == created));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    name,
    classType,
    fundManager,
    handler,
    minimum,
    funcManagerCountry,
    interest,
    status,
    units,
    description,
    created,
  );

  /// Create a copy of InvestmentClassOption
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InvestmentClassOptionImplCopyWith<_$InvestmentClassOptionImpl>
  get copyWith =>
      __$$InvestmentClassOptionImplCopyWithImpl<_$InvestmentClassOptionImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$InvestmentClassOptionImplToJson(this);
  }
}

abstract class _InvestmentClassOption implements InvestmentClassOption {
  const factory _InvestmentClassOption({
    required final String name,
    required final String classType,
    final FundManager? fundManager,
    required final String handler,
    required final int minimum,
    required final String funcManagerCountry,
    required final int interest,
    required final String status,
    required final double units,
    required final String description,
    required final DateTime created,
  }) = _$InvestmentClassOptionImpl;

  factory _InvestmentClassOption.fromJson(Map<String, dynamic> json) =
      _$InvestmentClassOptionImpl.fromJson;

  @override
  String get name;
  @override
  String get classType;
  @override
  FundManager? get fundManager;
  @override
  String get handler;
  @override
  int get minimum;
  @override
  String get funcManagerCountry;
  @override
  int get interest;
  @override
  String get status;
  @override
  double get units;
  @override
  String get description;
  @override
  DateTime get created;

  /// Create a copy of InvestmentClassOption
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InvestmentClassOptionImplCopyWith<_$InvestmentClassOptionImpl>
  get copyWith => throw _privateConstructorUsedError;
}
