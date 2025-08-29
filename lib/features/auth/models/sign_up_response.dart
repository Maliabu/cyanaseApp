import 'package:cyanaseapp/core/models/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_response.freezed.dart';
part 'sign_up_response.g.dart';

@freezed
class SignUpResponse with _$SignUpResponse {
@JsonSerializable(fieldRename: FieldRename.snake)
  const factory SignUpResponse({
    required String message,
    required bool success,
     String? verificationcode,
     User? user,
     String? type
  }) = _SignUpResponse;

  factory SignUpResponse.fromJson(Map<String, dynamic> json) => _$SignUpResponseFromJson(json);
}