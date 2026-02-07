import 'package:crowdfunding_platform/controller/getx/controllers/auth/creator_onboarding_controller.dart';
import 'package:crowdfunding_platform/controller/getx/controllers/campaign_create/campaign_step_one_controller.dart';

import 'package:get/get.dart';

class CampaignStepOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CampaignStepOneController());
    Get.put(CreatorOnboardingController());
  }
}
