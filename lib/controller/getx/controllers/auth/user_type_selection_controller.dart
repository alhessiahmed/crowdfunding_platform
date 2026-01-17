import 'package:get/get.dart';

import '../../../core/routes/routes_manager.dart';

enum UserType { donator, creator }

class UserTypeSelectionController extends GetxController {
  final selectedType = UserType.donator.obs;

  void select(UserType type) {
    print('Selected type: $type');
    selectedType.value = type;
  }

  void navigateToCreateAccount() {
    Get.toNamed(RoutesManager.userWelcomeScreen, arguments: selectedType.value);
  }
}
