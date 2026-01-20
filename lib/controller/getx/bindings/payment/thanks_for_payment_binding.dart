import 'package:get/get.dart';

import '../../controllers/payment/thanks_for_payment_controller.dart';

class ThanksForPaymentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ThanksForPaymentController());
  }
}
