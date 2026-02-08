import 'package:get/get.dart';

import '../controllers/donar_home/donar_home_controller.dart';

class DonarHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DonarHomeController());
  }
}
