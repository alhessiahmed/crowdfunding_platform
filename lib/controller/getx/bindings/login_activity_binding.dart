import 'package:get/get.dart';

import '../controllers/login_activity/login_activity_controller.dart';

class LoginActivityBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginActivityController());
  }
}
