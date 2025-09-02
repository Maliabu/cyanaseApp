import 'package:cyanaseapp/core/models/profile.dart';
import 'package:cyanaseapp/core/models/user.dart';
import 'package:isar/isar.dart';

part 'user_entity.g.dart';

@collection
class UserEntity {
  Id id = Isar.autoIncrement; // Internal Isar ID (auto-incremented)

  late int userId; // Backend user ID
  late String name;
  late String email;
  late String token;
    late bool isStaff;
    late bool isActive;
    late DateTime dateJoined;
    late bool isSuperuser;
    DateTime? lastLogin;
    late String firstName;
    late String lastName;
    
    // flatten profile
    late String gender;
    late String birthDate;
    late String country;
    late String phoneno;
    late int profileId;
    String? language;
    String? timeZone;
    String? address;
    String? profilePicture;
    late String verificationCode;
    late bool isVerified;
    bool? isDeletable;
    late bool isDisabled;
    late DateTime created;
    int? passcode;

  /// Converts from your app model (User → UserEntity)
  void fromFreezed(User user) {
    userId = user.userId;
    email = user.username;
    firstName = user.firstName;
    lastName = user.lastName;
    token = user.token;
    isStaff = user.isStaff;
    isActive = user.isActive;
    dateJoined = user.dateJoined;

    gender = user.profile.gender;
    birthDate = user.profile.birthDate;
    country = user.profile.country;
    phoneno = user.profile.phoneno;
    profileId = user.profile.profileId;
    language = user.profile.language;
    timeZone = user.profile.timeZone;
    address = user.profile.address;
    profilePicture = user.profile.profilePicture;
    verificationCode = user.profile.verificationCode;
    isVerified = user.profile.isVerified;
    isDeletable = user.profile.isDeletable;
    isDisabled = user.profile.isDisabled;
    created = user.profile.created;
    passcode = user.profile.passcode;
  }

  /// Converts back to app model (UserEntity → User)
  User toFreezed() {
    return User(
      userId: userId,
      token: token, 
      username: email, 
      isSuperuser: false, 
      firstName: firstName, 
      lastName:lastName, 
      isStaff: false, 
      isActive: false, 
      dateJoined: dateJoined, 
      email: email, 
      success: false, 
      profile: Profile(
        gender: gender, 
        birthDate: birthDate, 
        country: country, 
        phoneno: phoneno, 
        profileId: profileId, 
        verificationCode: verificationCode, 
        isVerified: isVerified, 
        isDisabled: isDisabled, 
        created: created),
    );
  }
}
