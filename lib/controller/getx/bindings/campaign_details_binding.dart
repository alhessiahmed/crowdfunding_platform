import 'package:crowdfunding_platform/controller/getx/controllers/campagin_details_controller.dart';
import 'package:get/instance_manager.dart';

class CampaignDetailsBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(CampaignDetailsController());
  }
}