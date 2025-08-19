import 'package:cyanaseapp/core/models/fund_manager.dart';
import 'package:cyanaseapp/core/models/investment_class.dart';
import 'package:cyanaseapp/core/models/investment_class_option.dart';
import 'package:cyanaseapp/features/invest/models/submission_response.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'invest_form_state.freezed.dart';
part 'invest_form_state.g.dart';

@freezed
class InvestFormState with _$InvestFormState {
  const factory InvestFormState({
    @Default(1) int step,
    FundManager? selectedFundManager,
    InvestmentClass? selectedInvestmentClass,
    InvestmentClassOption? selectedInvestmentClassOption,
    @Default('online') String paymentMeans,
    @Default('mm') String paymentMethod,
    @Default('') String depositAmount,
    @JsonKey(includeFromJson: false, includeToJson: false)
    AsyncValue<SubmissionResponse?>? submission,
  }) = _InvestFormState;

  factory InvestFormState.initial() =>
      InvestFormState(submission: const AsyncData(null));
  factory InvestFormState.fromJson(Map<String, dynamic> json) =>
      _$InvestFormStateFromJson(json);
}
