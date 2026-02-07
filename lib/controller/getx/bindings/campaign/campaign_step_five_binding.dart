import 'package:crowdfunding_platform/controller/getx/controllers/campaign_create/campaign_step_five_controller.dart';
import 'package:get/get.dart';

class CampaignStepFiveBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CampaignStepFiveController());
  }
}
