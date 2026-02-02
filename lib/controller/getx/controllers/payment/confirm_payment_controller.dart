import 'package:get/get.dart';

class ConfirmPaymentController extends GetxController {
  final int numberStars = 50;
  final String maskedCardNumber = '**** 4456';
  final num donationAmount = 500;
  final num serviceFees = 10;

  num get totalAmount => donationAmount + serviceFees;
}
