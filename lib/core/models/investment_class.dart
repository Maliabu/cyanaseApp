import 'package:cyanaseapp/core/models/investment_class_option.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'investment_class.freezed.dart';
part 'investment_class.g.dart';

@freezed
class InvestmentClass with _$InvestmentClass {
  const factory InvestmentClass({
    String? logo,
    required int classId,
    required String name,
    required String description,
    required InvestmentClassOption options,
  }) = _InvestmentClass;

  factory InvestmentClass.fromJson(Map<String, dynamic> json) =>
      _$InvestmentClassFromJson(json);
}
