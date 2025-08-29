import 'package:cyanaseapp/features/auth/models/profile.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'fund_manager.freezed.dart';
part 'fund_manager.g.dart';

@freezed
class FundManager with _$FundManager {
  const factory FundManager({
    required int userId,
    required String firstName,
    required String lastName,
    required Profile profile,
  }) = _FundManager;

  factory FundManager.fromJson(Map<String, dynamic> json) =>
      _$FundManagerFromJson(json);

}
