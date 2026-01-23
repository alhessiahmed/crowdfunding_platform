import 'package:crowdfunding_platform/controller/getx/bindings/my_campagins_binding.dart';
import 'package:crowdfunding_platform/controller/getx/controllers/home_controller.dart';
import 'package:crowdfunding_platform/controller/getx/controllers/my_campagins_controller.dart';
import 'package:crowdfunding_platform/controller/getx/controllers/profile_controller.dart';
import 'package:get/instance_manager.dart';

class MainBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=>HomeController());
    Get.lazyPut(()=>MyCampaginsController());
    Get.lazyPut(()=>ProfileController());
  }
}