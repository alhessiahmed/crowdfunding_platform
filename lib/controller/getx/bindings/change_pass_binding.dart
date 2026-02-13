import 'package:crowdfunding_platform/controller/getx/controllers/change_pass_controller.dart';
import 'package:get/instance_manager.dart';

class ChangePassBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(ChangePassController());
  }
}