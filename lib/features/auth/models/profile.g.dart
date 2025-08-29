// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProfileImpl _$$ProfileImplFromJson(Map<String, dynamic> json) =>
    _$ProfileImpl(
      gender: json['gender'] as String,
      birthDate: json['birth_date'] as String,
      country: json['country'] as String,
      phoneNumber: json['phone_no'] as String,
    );

Map<String, dynamic> _$$ProfileImplToJson(_$ProfileImpl instance) =>
    <String, dynamic>{
      'gender': instance.gender,
      'birth_date': instance.birthDate,
      'country': instance.country,
      'phone_no': instance.phoneNumber,
    };
