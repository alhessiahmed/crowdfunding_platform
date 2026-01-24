import 'package:crowdfunding_platform/controller/getx/controllers/campaign_create/campaign_step_four_controller.dart';
import 'package:get/get.dart';

class CampaignStepFourBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CampaignStepFourController());
  }
}
