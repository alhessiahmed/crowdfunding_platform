import 'package:crowdfunding_platform/controller/getx/controllers/verification_controller.dart';
import 'package:get/get.dart';

class StatusDonorVerificationBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<StatusDonorVerificationController>(() => StatusDonorVerificationController());
    // TODO: implement dependencies
  }
}