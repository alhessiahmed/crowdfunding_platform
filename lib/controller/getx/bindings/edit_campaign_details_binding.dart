import 'package:crowdfunding_platform/controller/getx/controllers/campgin_update_and_control_controllers/edit_campaign_details_controller.dart';
import 'package:get/get.dart';

class EditCampaignDetailsBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(EditCampaignDetailsController());
  }
}
