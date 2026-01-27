import 'package:get/get.dart';

import '../../controllers/payment/add_payment_method_controller.dart';

class AddPaymentMethodBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddPaymentMethodController());
  }
}
