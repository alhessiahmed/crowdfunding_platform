import 'package:get/get.dart';

import '../../../../model/payment_method.dart';

class PaymentController extends GetxController {
  final Rx<PaymentType> selectedPaymentType = PaymentType.visa.obs;

  void selectPaymentMethod(PaymentType type) {
    selectedPaymentType.value = type;
  }
}
