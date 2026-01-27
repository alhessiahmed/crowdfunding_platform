import 'package:crowdfunding_platform/controller/getx/controllers/my_campagins_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class MyCampaginsBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=> MyCampaginsController());
  }
}