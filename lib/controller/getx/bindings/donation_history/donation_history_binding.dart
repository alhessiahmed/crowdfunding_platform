import 'package:crowdfunding_platform/controller/getx/controllers/donation_history/donation_history_controller.dart';
import 'package:get/get.dart';

class DonationHistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DonationHistoryController());
  }
}
