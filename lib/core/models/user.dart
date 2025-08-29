import 'package:cyanaseapp/core/models/profile.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User{
@JsonSerializable(fieldRename: FieldRename.snake)
  const factory User({
    required String token,
    required String username,
    required int userId,
    required bool isSuperuser,
    required String email,
    DateTime? lastLogin,
    required String firstName,
    required String lastName,
    required bool isStaff,
    required bool isActive,
    required DateTime dateJoined,
    String? message,
    required bool success,
    required Profile profile
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}