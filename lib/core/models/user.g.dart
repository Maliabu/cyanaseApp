// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      token: json['token'] as String,
      username: json['username'] as String,
      userId: (json['user_id'] as num).toInt(),
      isSuperuser: json['is_superuser'] as bool,
      email: json['email'] as String,
      lastLogin: json['last_login'] == null
          ? null
          : DateTime.parse(json['last_login'] as String),
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      isStaff: json['is_staff'] as bool,
      isActive: json['is_active'] as bool,
      dateJoined: DateTime.parse(json['date_joined'] as String),
      message: json['message'] as String?,
      success: json['success'] as bool,
      profile: Profile.fromJson(json['profile'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'token': instance.token,
      'username': instance.username,
      'user_id': instance.userId,
      'is_superuser': instance.isSuperuser,
      'email': instance.email,
      'last_login': instance.lastLogin?.toIso8601String(),
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'is_staff': instance.isStaff,
      'is_active': instance.isActive,
      'date_joined': instance.dateJoined.toIso8601String(),
      'message': instance.message,
      'success': instance.success,
      'profile': instance.profile,
    };
