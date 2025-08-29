import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile.freezed.dart';
part 'profile.g.dart';

@freezed
class Profile with _$Profile {
  const factory Profile({
    // @JsonKey(name: 'name') converts our camelCase to django/api snake_case
    // so no issues with keyErrors when submitting the model
    @JsonKey(name: 'gender') required String gender,
    @JsonKey(name: 'birth_date') required String birthDate,
    @JsonKey(name: 'country') required String country,
    @JsonKey(name: 'phone_no') required String phoneNumber,
  }) = _Profile;

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);
}