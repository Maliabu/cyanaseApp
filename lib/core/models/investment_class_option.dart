import 'package:cyanaseapp/core/models/fund_manager.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'investment_class_option.freezed.dart';
part 'investment_class_option.g.dart';

@freezed
class InvestmentClassOption with _$InvestmentClassOption {
  // factory constructor
  const factory InvestmentClassOption({
    required String name,
    required String classType,
    FundManager? fundManager,
    required String handler,
    required int minimum,
    required String funcManagerCountry,
    required int interest,
    required String status,
    required double units,
    required String description,
    required DateTime created,
  }) = _InvestmentClassOption;

  factory InvestmentClassOption.fromJson(Map<String, dynamic> json) =>
      _$InvestmentClassOptionFromJson(json);
}
