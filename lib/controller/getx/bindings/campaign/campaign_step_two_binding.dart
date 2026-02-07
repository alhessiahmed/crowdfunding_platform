import 'package:crowdfunding_platform/controller/getx/controllers/campaign_create/campaign_step_two_controller.dart';
import 'package:get/get.dart';

class CampaignStepTwoBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CampaignStepTwoController());
  }
}
