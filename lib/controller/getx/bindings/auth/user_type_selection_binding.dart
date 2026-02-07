// lib/bindings/selection_binding.dart
import 'package:get/get.dart';

import '../../controllers/auth/user_type_selection_controller.dart';

class UserTypeSelectionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserTypeSelectionController());
  }
}
