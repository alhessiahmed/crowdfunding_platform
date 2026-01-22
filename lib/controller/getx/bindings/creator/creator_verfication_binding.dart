import 'package:get/instance_manager.dart';

import '../../controllers/creator/creator_verification_controller.dart';

class CreatorVerficationBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CreatorVerificationController());
  }
}
