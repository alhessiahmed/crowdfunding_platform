import 'package:crowdfunding_platform/model/filter_item.dart';
import 'package:crowdfunding_platform/model/my_campagins_model.dart';
import 'package:get/state_manager.dart';

class MyCampaginsController extends GetxController {
  List<FilterItem> filtersMock = [];
  RxInt selectedFilterIndex = 0.obs;
  List<MyCampaignsModel> myCampaignsMock = [];
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getMyCampaginData();
  }

  void selectFilter(int index) {
    selectedFilterIndex.value = index;
  }

  getMyCampaginData() {
    //api request
    filtersMock = [
      FilterItem(id: 'all', title: 'كل الحملات', count: 12),
      FilterItem(id: 'education', title: 'مكتملة', count: 4),
      FilterItem(id: 'health', title: 'نشطة', count: 1),
      FilterItem(id: 'relief', title: 'مسودة', count: 5),
    ];

    myCampaignsMock = [
      MyCampaignsModel(
        id: 1,
        title: 'قطرة حياة: مياه نظيفة لأطفال غزة',
        image: 'assets/images/campaign.png',
        progress: 100,
        status: CampaignStatus.completed,
      ),
      MyCampaignsModel(
        id: 2,
        title: 'قطرة حياة: مياه نظيفة لأطفال غزة',
        image: 'assets/images/campaign.png',
        progress: 50,
        status: CampaignStatus.active,
      ),
      MyCampaignsModel(
        id: 3,
        title: 'قطرة حياة: مياه نظيفة لأطفال غزة',
        image: 'assets/images/campaign.png',
        progress: 50,
        status: CampaignStatus.paused,
      ),
      MyCampaignsModel(
        id: 4,
        title: 'قطرة حياة: مياه نظيفة لأطفال غزة',
        image: 'assets/images/campaign.png',
        progress: 0,
        status: CampaignStatus.draft,
      ),
    ];
  }
}
