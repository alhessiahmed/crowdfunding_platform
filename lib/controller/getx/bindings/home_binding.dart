import 'package:crowdfunding_platform/controller/getx/controllers/home_controller.dart';
import 'package:get/instance_manager.dart';

class HomeBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}