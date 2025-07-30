// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fund_manager.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FundManagerImpl _$$FundManagerImplFromJson(Map<String, dynamic> json) =>
    _$FundManagerImpl(
      userId: (json['userId'] as num).toInt(),
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      profile: Profile.fromJson(json['profile'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$FundManagerImplToJson(_$FundManagerImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'profile': instance.profile,
    };
