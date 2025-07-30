// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'investment_class_option.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InvestmentClassOptionImpl _$$InvestmentClassOptionImplFromJson(
  Map<String, dynamic> json,
) => _$InvestmentClassOptionImpl(
  name: json['name'] as String,
  classType: json['classType'] as String,
  fundManager:
      json['fundManager'] == null
          ? null
          : FundManager.fromJson(json['fundManager'] as Map<String, dynamic>),
  handler: json['handler'] as String,
  minimum: (json['minimum'] as num).toInt(),
  funcManagerCountry: json['funcManagerCountry'] as String,
  interest: (json['interest'] as num).toInt(),
  status: json['status'] as String,
  units: (json['units'] as num).toDouble(),
  description: json['description'] as String,
  created: DateTime.parse(json['created'] as String),
);

Map<String, dynamic> _$$InvestmentClassOptionImplToJson(
  _$InvestmentClassOptionImpl instance,
) => <String, dynamic>{
  'name': instance.name,
  'classType': instance.classType,
  'fundManager': instance.fundManager,
  'handler': instance.handler,
  'minimum': instance.minimum,
  'funcManagerCountry': instance.funcManagerCountry,
  'interest': instance.interest,
  'status': instance.status,
  'units': instance.units,
  'description': instance.description,
  'created': instance.created.toIso8601String(),
};
