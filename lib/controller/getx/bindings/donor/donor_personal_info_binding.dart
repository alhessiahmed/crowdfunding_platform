import 'package:get/instance_manager.dart';

import '../../controllers/donor/donor_personal_info_controller.dart';

class DonorPersonalInfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DonorPersonalInfoController());
  }
}
