import 'package:crowdfunding_platform/controller/getx/controllers/discover_controller.dart';
import 'package:crowdfunding_platform/controller/getx/controllers/my_campagins_controller.dart';
import 'package:crowdfunding_platform/controller/getx/controllers/profile_controller.dart';
import 'package:crowdfunding_platform/controller/shared_pref/shared_pref_controller.dart';
import 'package:get/instance_manager.dart';

class MainBinding implements Bindings {
  @override
  void dependencies() {
    final userId = SharedPrefController().user?['id'];
    Get.lazyPut(() => DiscoverController());
    Get.lazyPut(() => MyCampaginsController(userId is String ? userId : ''));
    Get.lazyPut(() => ProfileController());
  }
}
