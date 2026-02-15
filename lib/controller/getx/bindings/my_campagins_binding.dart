import 'package:crowdfunding_platform/controller/getx/controllers/my_campagins_controller.dart';
import 'package:crowdfunding_platform/controller/shared_pref/shared_pref_controller.dart';
import 'package:get/get.dart';

class MyCampaginsBinding extends Bindings {
  @override
  void dependencies() {
    final userId = SharedPrefController().user?['id'];
    Get.lazyPut(() => MyCampaginsController(userId is String ? userId : ''));
  }
}
