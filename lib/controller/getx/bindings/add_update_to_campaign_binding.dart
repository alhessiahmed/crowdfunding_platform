import 'package:crowdfunding_platform/controller/getx/controllers/campgin_update_and_control_controllers/add_update_to_campaign_controller.dart';
import 'package:get/get.dart';

class AddUpdateToCampaignBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(AddUpdateToCampaignController());
  }
}
