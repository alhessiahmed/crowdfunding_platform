import 'package:crowdfunding_platform/controller/getx/controllers/discover_controller.dart';
import 'package:crowdfunding_platform/controller/getx/controllers/my_campagins_controller.dart';
import 'package:crowdfunding_platform/controller/getx/controllers/profile_controller.dart';
import 'package:crowdfunding_platform/controller/shared_pref/shared_pref_controller.dart';
import 'package:get/instance_manager.dart';

class MainBinding implements Bindings {
  @override
  void dependencies() {
    final userId = SharedPrefController().user?['id'];
    Get.put(DiscoverController(), permanent: true);
    Get.lazyPut(() => MyCampaginsController(userId is String ? userId : ''));
    if(SharedPrefController().userType == UserRole.CAMPAIGN_CREATOR.name && Get.isRegistered<MyCampaginsController>())  {
      Get.find<MyCampaginsController>().refreshCampaigns();
//  MyCampaginsController(SharedPrefController().user!['id']).getMyCampaginData(SharedPrefController().user!['id']);
}
    Get.lazyPut(() => ProfileController());
  }
}
