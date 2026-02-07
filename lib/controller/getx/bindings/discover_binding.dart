import 'package:crowdfunding_platform/controller/getx/controllers/discover_controller.dart';
import 'package:get/instance_manager.dart';

class DiscoverBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(DiscoverController());
  }
}