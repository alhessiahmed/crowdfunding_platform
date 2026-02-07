import '../controller/getx/controllers/auth/user_type_selection_controller.dart';

class SignUpDraft {
  String firstName;
  String lastName;
  String email;
  String password;
  DateTime dateOfBirth;

  UserType? userType;

  SignUpDraft({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.dateOfBirth,
    this.userType,
  });
}
