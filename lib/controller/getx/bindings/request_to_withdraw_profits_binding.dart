import 'package:crowdfunding_platform/controller/getx/controllers/wallet/request_to_withdraw_profits_controller.dart';
import 'package:get/instance_manager.dart';

class RequestToWithdrawProfitsBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(RequestToWithdrawProfitsController());
  }
}
