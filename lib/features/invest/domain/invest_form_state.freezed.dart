// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'invest_form_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

InvestFormState _$InvestFormStateFromJson(Map<String, dynamic> json) {
  return _InvestFormState.fromJson(json);
}

/// @nodoc
mixin _$InvestFormState {
  int get step => throw _privateConstructorUsedError;
  FundManager? get selectedFundManager => throw _privateConstructorUsedError;
  InvestmentClass? get selectedInvestmentClass =>
      throw _privateConstructorUsedError;
  InvestmentClassOption? get selectedInvestmentClassOption =>
      throw _privateConstructorUsedError;
  String get paymentMeans => throw _privateConstructorUsedError;
  String get paymentMethod => throw _privateConstructorUsedError;
  String get depositAmount => throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false, includeToJson: false)
  AsyncValue<SubmissionResponse?>? get submission =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InvestFormStateCopyWith<InvestFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvestFormStateCopyWith<$Res> {
  factory $InvestFormStateCopyWith(
          InvestFormState value, $Res Function(InvestFormState) then) =
      _$InvestFormStateCopyWithImpl<$Res, InvestFormState>;
  @useResult
  $Res call(
      {int step,
      FundManager? selectedFundManager,
      InvestmentClass? selectedInvestmentClass,
      InvestmentClassOption? selectedInvestmentClassOption,
      String paymentMeans,
      String paymentMethod,
      String depositAmount,
      @JsonKey(includeFromJson: false, includeToJson: false)
      AsyncValue<SubmissionResponse?>? submission});

  $FundManagerCopyWith<$Res>? get selectedFundManager;
  $InvestmentClassCopyWith<$Res>? get selectedInvestmentClass;
  $InvestmentClassOptionCopyWith<$Res>? get selectedInvestmentClassOption;
}

/// @nodoc
class _$InvestFormStateCopyWithImpl<$Res, $Val extends InvestFormState>
    implements $InvestFormStateCopyWith<$Res> {
  _$InvestFormStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? step = null,
    Object? selectedFundManager = freezed,
    Object? selectedInvestmentClass = freezed,
    Object? selectedInvestmentClassOption = freezed,
    Object? paymentMeans = null,
    Object? paymentMethod = null,
    Object? depositAmount = null,
    Object? submission = freezed,
  }) {
    return _then(_value.copyWith(
      step: null == step
          ? _value.step
          : step // ignore: cast_nullable_to_non_nullable
              as int,
      selectedFundManager: freezed == selectedFundManager
          ? _value.selectedFundManager
          : selectedFundManager // ignore: cast_nullable_to_non_nullable
              as FundManager?,
      selectedInvestmentClass: freezed == selectedInvestmentClass
          ? _value.selectedInvestmentClass
          : selectedInvestmentClass // ignore: cast_nullable_to_non_nullable
              as InvestmentClass?,
      selectedInvestmentClassOption: freezed == selectedInvestmentClassOption
          ? _value.selectedInvestmentClassOption
          : selectedInvestmentClassOption // ignore: cast_nullable_to_non_nullable
              as InvestmentClassOption?,
      paymentMeans: null == paymentMeans
          ? _value.paymentMeans
          : paymentMeans // ignore: cast_nullable_to_non_nullable
              as String,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      depositAmount: null == depositAmount
          ? _value.depositAmount
          : depositAmount // ignore: cast_nullable_to_non_nullable
              as String,
      submission: freezed == submission
          ? _value.submission
          : submission // ignore: cast_nullable_to_non_nullable
              as AsyncValue<SubmissionResponse?>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FundManagerCopyWith<$Res>? get selectedFundManager {
    if (_value.selectedFundManager == null) {
      return null;
    }

    return $FundManagerCopyWith<$Res>(_value.selectedFundManager!, (value) {
      return _then(_value.copyWith(selectedFundManager: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $InvestmentClassCopyWith<$Res>? get selectedInvestmentClass {
    if (_value.selectedInvestmentClass == null) {
      return null;
    }

    return $InvestmentClassCopyWith<$Res>(_value.selectedInvestmentClass!,
        (value) {
      return _then(_value.copyWith(selectedInvestmentClass: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $InvestmentClassOptionCopyWith<$Res>? get selectedInvestmentClassOption {
    if (_value.selectedInvestmentClassOption == null) {
      return null;
    }

    return $InvestmentClassOptionCopyWith<$Res>(
        _value.selectedInvestmentClassOption!, (value) {
      return _then(
          _value.copyWith(selectedInvestmentClassOption: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$InvestFormStateImplCopyWith<$Res>
    implements $InvestFormStateCopyWith<$Res> {
  factory _$$InvestFormStateImplCopyWith(_$InvestFormStateImpl value,
          $Res Function(_$InvestFormStateImpl) then) =
      __$$InvestFormStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int step,
      FundManager? selectedFundManager,
      InvestmentClass? selectedInvestmentClass,
      InvestmentClassOption? selectedInvestmentClassOption,
      String paymentMeans,
      String paymentMethod,
      String depositAmount,
      @JsonKey(includeFromJson: false, includeToJson: false)
      AsyncValue<SubmissionResponse?>? submission});

  @override
  $FundManagerCopyWith<$Res>? get selectedFundManager;
  @override
  $InvestmentClassCopyWith<$Res>? get selectedInvestmentClass;
  @override
  $InvestmentClassOptionCopyWith<$Res>? get selectedInvestmentClassOption;
}

/// @nodoc
class __$$InvestFormStateImplCopyWithImpl<$Res>
    extends _$InvestFormStateCopyWithImpl<$Res, _$InvestFormStateImpl>
    implements _$$InvestFormStateImplCopyWith<$Res> {
  __$$InvestFormStateImplCopyWithImpl(
      _$InvestFormStateImpl _value, $Res Function(_$InvestFormStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? step = null,
    Object? selectedFundManager = freezed,
    Object? selectedInvestmentClass = freezed,
    Object? selectedInvestmentClassOption = freezed,
    Object? paymentMeans = null,
    Object? paymentMethod = null,
    Object? depositAmount = null,
    Object? submission = freezed,
  }) {
    return _then(_$InvestFormStateImpl(
      step: null == step
          ? _value.step
          : step // ignore: cast_nullable_to_non_nullable
              as int,
      selectedFundManager: freezed == selectedFundManager
          ? _value.selectedFundManager
          : selectedFundManager // ignore: cast_nullable_to_non_nullable
              as FundManager?,
      selectedInvestmentClass: freezed == selectedInvestmentClass
          ? _value.selectedInvestmentClass
          : selectedInvestmentClass // ignore: cast_nullable_to_non_nullable
              as InvestmentClass?,
      selectedInvestmentClassOption: freezed == selectedInvestmentClassOption
          ? _value.selectedInvestmentClassOption
          : selectedInvestmentClassOption // ignore: cast_nullable_to_non_nullable
              as InvestmentClassOption?,
      paymentMeans: null == paymentMeans
          ? _value.paymentMeans
          : paymentMeans // ignore: cast_nullable_to_non_nullable
              as String,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      depositAmount: null == depositAmount
          ? _value.depositAmount
          : depositAmount // ignore: cast_nullable_to_non_nullable
              as String,
      submission: freezed == submission
          ? _value.submission
          : submission // ignore: cast_nullable_to_non_nullable
              as AsyncValue<SubmissionResponse?>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InvestFormStateImpl implements _InvestFormState {
  const _$InvestFormStateImpl(
      {this.step = 1,
      this.selectedFundManager,
      this.selectedInvestmentClass,
      this.selectedInvestmentClassOption,
      this.paymentMeans = 'online',
      this.paymentMethod = 'mm',
      this.depositAmount = '',
      @JsonKey(includeFromJson: false, includeToJson: false) this.submission});

  factory _$InvestFormStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$InvestFormStateImplFromJson(json);

  @override
  @JsonKey()
  final int step;
  @override
  final FundManager? selectedFundManager;
  @override
  final InvestmentClass? selectedInvestmentClass;
  @override
  final InvestmentClassOption? selectedInvestmentClassOption;
  @override
  @JsonKey()
  final String paymentMeans;
  @override
  @JsonKey()
  final String paymentMethod;
  @override
  @JsonKey()
  final String depositAmount;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final AsyncValue<SubmissionResponse?>? submission;

  @override
  String toString() {
    return 'InvestFormState(step: $step, selectedFundManager: $selectedFundManager, selectedInvestmentClass: $selectedInvestmentClass, selectedInvestmentClassOption: $selectedInvestmentClassOption, paymentMeans: $paymentMeans, paymentMethod: $paymentMethod, depositAmount: $depositAmount, submission: $submission)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvestFormStateImpl &&
            (identical(other.step, step) || other.step == step) &&
            (identical(other.selectedFundManager, selectedFundManager) ||
                other.selectedFundManager == selectedFundManager) &&
            (identical(
                    other.selectedInvestmentClass, selectedInvestmentClass) ||
                other.selectedInvestmentClass == selectedInvestmentClass) &&
            (identical(other.selectedInvestmentClassOption,
                    selectedInvestmentClassOption) ||
                other.selectedInvestmentClassOption ==
                    selectedInvestmentClassOption) &&
            (identical(other.paymentMeans, paymentMeans) ||
                other.paymentMeans == paymentMeans) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.depositAmount, depositAmount) ||
                other.depositAmount == depositAmount) &&
            (identical(other.submission, submission) ||
                other.submission == submission));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      step,
      selectedFundManager,
      selectedInvestmentClass,
      selectedInvestmentClassOption,
      paymentMeans,
      paymentMethod,
      depositAmount,
      submission);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InvestFormStateImplCopyWith<_$InvestFormStateImpl> get copyWith =>
      __$$InvestFormStateImplCopyWithImpl<_$InvestFormStateImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InvestFormStateImplToJson(
      this,
    );
  }
}

abstract class _InvestFormState implements InvestFormState {
  const factory _InvestFormState(
          {final int step,
          final FundManager? selectedFundManager,
          final InvestmentClass? selectedInvestmentClass,
          final InvestmentClassOption? selectedInvestmentClassOption,
          final String paymentMeans,
          final String paymentMethod,
          final String depositAmount,
          @JsonKey(includeFromJson: false, includeToJson: false)
          final AsyncValue<SubmissionResponse?>? submission}) =
      _$InvestFormStateImpl;

  factory _InvestFormState.fromJson(Map<String, dynamic> json) =
      _$InvestFormStateImpl.fromJson;

  @override
  int get step;
  @override
  FundManager? get selectedFundManager;
  @override
  InvestmentClass? get selectedInvestmentClass;
  @override
  InvestmentClassOption? get selectedInvestmentClassOption;
  @override
  String get paymentMeans;
  @override
  String get paymentMethod;
  @override
  String get depositAmount;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  AsyncValue<SubmissionResponse?>? get submission;
  @override
  @JsonKey(ignore: true)
  _$$InvestFormStateImplCopyWith<_$InvestFormStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
