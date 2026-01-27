import 'package:crowdfunding_platform/controller/getx/controllers/donor/donor_verification_controller.dart';
import 'package:get/instance_manager.dart';

class DonorVerificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DonorVerificationController());
  }
}
