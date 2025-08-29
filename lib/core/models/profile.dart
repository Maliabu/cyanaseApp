import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile.freezed.dart';
part 'profile.g.dart';

@freezed
class Profile with _$Profile {
@JsonSerializable(fieldRename: FieldRename.snake)
  const factory Profile({
    // for responses, we only need an annotation.
    required String gender,
    required String birthDate,
    required String country,
    required String phoneno,
    required int profileId,
    String? language,
    String? timeZone,
    String? address,
    String? profilePicture,
    required String verificationCode,
    required bool isVerified,
    bool? isDeletable,
    required bool isDisabled,
    required DateTime created,
    int? passcode,
  }) = _Profile;

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);
}