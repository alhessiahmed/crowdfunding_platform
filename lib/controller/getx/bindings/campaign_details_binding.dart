import 'package:crowdfunding_platform/controller/getx/controllers/campagin_details_controller.dart';
import 'package:crowdfunding_platform/model/campagin_models/campagin_model.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';

class CampaignDetailsBinding extends Bindings{
  CampaignDetailsBinding();
  @override
  void dependencies() {
     final args = Get.arguments ;
     final String campaignId = args is CampaignModel 
     ? args.id 
     : (args is Map<String, dynamic> && args['campaign'] is CampaignModel)
                ? (args['campaign'] as CampaignModel).id
                : '';
    Get.put(CampaignDetailsController(campaignId: campaignId));
  }
}