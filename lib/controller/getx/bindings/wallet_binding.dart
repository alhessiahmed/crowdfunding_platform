import 'package:crowdfunding_platform/controller/getx/controllers/wallet/wallet_controller.dart';
import 'package:get/instance_manager.dart';

class WalletBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(WalletController());
  }
}
