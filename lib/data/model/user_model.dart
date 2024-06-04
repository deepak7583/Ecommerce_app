import 'package:t_store/utils/formatters/formatter.dart';

class UserModel {
  final String id;
  final String userName;
  final String email;
  String firstName;
  String lastName;
  String phoneNumber;
  String profilePicture;

  UserModel({
    required this.id,
    required this.userName,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.profilePicture,
  });

  ///
  String get fullName => '$firstName $lastName';

  ///
  String get formattedPhoneNo => TFormatter.formatPhoneNumber(phoneNumber);

  ///
  static List<String> nameParts(fullName) => fullName.split(" ");

  ///
  static String generateUserName(fullName) {
    List<String> nameParts = fullName.split(" ");
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";
    String camelCaseUserName = "$firstName$lastName";
    String userNameWithPrefix = "cwt_$camelCaseUserName";
    return userNameWithPrefix;
  }

  ///
  static UserModel empty() => UserModel(
        id: '',
        userName: '',
        email: '',
        firstName: '',
        lastName: '',
        phoneNumber: '',
        profilePicture: '',
      );

  ///
  Map<String, dynamic> toJson() {
    return {
      'FirstName': firstName,
      'LastName': lastName,
      'UserName': userName,
      'Email': email,
      'PhoneNumber': phoneNumber,
      'ProfilePicture': profilePicture,
    };
  }

  ///
  // factory UserModel.fromSnapshot(
  //   DocumentSnapshot<Map<String, dynamic>> document,
  // ) {
  //   if (document.data() != null) {
  //     final data = document.data()!;
  //     return UserModel(
  //       id: document.id,
  //       userName: data['UserName'] ?? '',
  //       email: data['Email'] ?? '',
  //       firstName: data['FirstName'] ?? '',
  //       lastName: data['LastName'] ?? '',
  //       phoneNumber: data['PhoneNumber'] ?? '',
  //       profilePicture: data['ProfilePicture'] ?? '',
  //     );
  //   }
  // }
}
