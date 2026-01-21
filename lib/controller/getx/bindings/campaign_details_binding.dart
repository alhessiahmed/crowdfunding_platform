import 'package:crowdfunding_platform/controller/getx/controllers/campgin_update_and_control_controllers/campagin_details_controller.dart';
import 'package:get/instance_manager.dart';

class CampaignDetailsBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(CampaignDetailsController());
  }
}