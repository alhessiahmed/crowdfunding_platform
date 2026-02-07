import 'package:crowdfunding_platform/controller/getx/controllers/wallet/summer_of_withdraw_controller.dart';
import 'package:get/instance_manager.dart';

class SummerOfWithdrawBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(SummerOfWithdrawController());
  }
}
