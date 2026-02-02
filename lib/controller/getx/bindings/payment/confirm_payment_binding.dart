import 'package:get/get.dart';

import '../../controllers/payment/confirm_payment_controller.dart';

class ConfirmPaymentBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ConfirmPaymentController());
  }
}
