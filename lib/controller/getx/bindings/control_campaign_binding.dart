import 'package:crowdfunding_platform/controller/getx/controllers/campgin_update_and_control_controllers/control_campaign_controller.dart';
import 'package:get/get.dart';

class ControlCampaignBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ControlCampaignController());
  }
}
