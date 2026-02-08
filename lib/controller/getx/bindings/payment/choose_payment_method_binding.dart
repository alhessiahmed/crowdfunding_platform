import 'package:get/get.dart';

import '../../controllers/payment/choose_payment_method_controller.dart';

class ChoosePaymentMethodBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChoosePaymentMethodController());
  }
}
