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
      phoneno: json['phoneno'] as String,
      profileId: (json['profile_id'] as num).toInt(),
      language: json['language'] as String?,
      timeZone: json['time_zone'] as String?,
      address: json['address'] as String?,
      profilePicture: json['profile_picture'] as String?,
      verificationCode: json['verification_code'] as String,
      isVerified: json['is_verified'] as bool,
      isDeletable: json['is_deletable'] as bool?,
      isDisabled: json['is_disabled'] as bool,
      created: DateTime.parse(json['created'] as String),
      passcode: (json['passcode'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ProfileImplToJson(_$ProfileImpl instance) =>
    <String, dynamic>{
      'gender': instance.gender,
      'birth_date': instance.birthDate,
      'country': instance.country,
      'phoneno': instance.phoneno,
      'profile_id': instance.profileId,
      'language': instance.language,
      'time_zone': instance.timeZone,
      'address': instance.address,
      'profile_picture': instance.profilePicture,
      'verification_code': instance.verificationCode,
      'is_verified': instance.isVerified,
      'is_deletable': instance.isDeletable,
      'is_disabled': instance.isDisabled,
      'created': instance.created.toIso8601String(),
      'passcode': instance.passcode,
    };
