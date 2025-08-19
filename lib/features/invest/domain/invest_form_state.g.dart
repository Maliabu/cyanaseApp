// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invest_form_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InvestFormStateImpl _$$InvestFormStateImplFromJson(
  Map<String, dynamic> json,
) => _$InvestFormStateImpl(
  step: (json['step'] as num?)?.toInt() ?? 1,
  selectedFundManager:
      json['selectedFundManager'] == null
          ? null
          : FundManager.fromJson(
            json['selectedFundManager'] as Map<String, dynamic>,
          ),
  selectedInvestmentClass:
      json['selectedInvestmentClass'] == null
          ? null
          : InvestmentClass.fromJson(
            json['selectedInvestmentClass'] as Map<String, dynamic>,
          ),
  selectedInvestmentClassOption:
      json['selectedInvestmentClassOption'] == null
          ? null
          : InvestmentClassOption.fromJson(
            json['selectedInvestmentClassOption'] as Map<String, dynamic>,
          ),
  paymentMeans: json['paymentMeans'] as String? ?? 'online',
  paymentMethod: json['paymentMethod'] as String? ?? 'mm',
  depositAmount: json['depositAmount'] as String? ?? '',
);

Map<String, dynamic> _$$InvestFormStateImplToJson(
  _$InvestFormStateImpl instance,
) => <String, dynamic>{
  'step': instance.step,
  'selectedFundManager': instance.selectedFundManager,
  'selectedInvestmentClass': instance.selectedInvestmentClass,
  'selectedInvestmentClassOption': instance.selectedInvestmentClassOption,
  'paymentMeans': instance.paymentMeans,
  'paymentMethod': instance.paymentMethod,
  'depositAmount': instance.depositAmount,
};
