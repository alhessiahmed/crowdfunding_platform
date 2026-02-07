import 'package:crowdfunding_platform/model/sign_up_draft.dart';
import 'package:get/get.dart';

import '../../../api/api_controllers/auth_api_controller.dart';
import '../../../core/routes/routes_manager.dart';
import '../../../shared_pref/shared_pref_controller.dart';

enum UserType { donor, creator }

class UserTypeSelectionController extends GetxController {
  final selectedType = UserType.donor.obs;
  final _authApi = AuthApiController();
  final isRegistering = false.obs;

  void select(UserType type) {
    print('Selected type: $type');
    selectedType.value = type;
  }

  void submit({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required DateTime dateOfBirth,
  }) async {
    print("ready to submit");
    if (selectedType.value == UserType.donor) {
      isRegistering.value = true;
      final response = await _authApi.registerDonor(
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password,
        dateOfBirth: dateOfBirth,
      );
      isRegistering.value = false;
      print("end of api call");

      if (!response.success || response.object == null) {
        Get.snackbar('Error', response.message);
        return;
      }
      final auth = response.object!;

      /// SAVE TOKEN
      await SharedPrefController().saveToken(auth.token);

      /// OPTIONAL: save user
      await SharedPrefController().saveUser(auth.user.toJson());
    }
    SignUpDraft draft = SignUpDraft(
      firstName: firstName,
      lastName: lastName,
      email: email,
      password: password,
      dateOfBirth: dateOfBirth,
      userType: selectedType.value,
    );
    Get.toNamed(RoutesManager.userWelcomeScreen, arguments: draft);
  }
}
