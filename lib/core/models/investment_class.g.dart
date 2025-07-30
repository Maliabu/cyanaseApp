// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'investment_class.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InvestmentClassImpl _$$InvestmentClassImplFromJson(
  Map<String, dynamic> json,
) => _$InvestmentClassImpl(
  classId: (json['classId'] as num).toInt(),
  name: json['name'] as String,
  description: json['description'] as String,
  options: InvestmentClassOption.fromJson(
    json['options'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$$InvestmentClassImplToJson(
  _$InvestmentClassImpl instance,
) => <String, dynamic>{
  'classId': instance.classId,
  'name': instance.name,
  'description': instance.description,
  'options': instance.options,
};
