import 'dart:convert';

import 'package:crowdfunding_platform/controller/api/api_controllers/discover_api_controller.dart';
import 'package:crowdfunding_platform/controller/api/api_settings.dart';
import 'package:crowdfunding_platform/model/campagin_models/campagin_model.dart';
import 'package:crowdfunding_platform/model/filter_item.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:http/http.dart' as http;
class DiscoverController extends GetxController {
  final CampaginApiController _api = CampaginApiController();

  int _page = 1;
  final int limit = 15;
int selectedFilterIndex =0 ;
  bool isLoading = false;
  bool hasMore = true;
dynamic categoryCounts  ;
CampaignCategory selectedCategory = CampaignCategory.ALL;
List<FilterItem> filters = [];

  List<CampaignModel> campaigns = [];

  @override
  void onInit() {
    super.onInit();
    getCampaigns();
  }
void selectCategory(int index) {
  selectedFilterIndex = index;
  selectedCategory = CampaignCategory.values[index];

  getCampaigns(refresh: true);
  update();
}


Future<void> getCampaigns({bool refresh = false}) async {
  if (isLoading) return;
  if (!hasMore && !refresh) return;

  isLoading = true;
  update();

  if (refresh) {
    _page = 1;
    hasMore = true;
    campaigns.clear();
  }

  try {
    late List<CampaignModel> result;

    if (selectedCategory == CampaignCategory.ALL) {
      result = await _api.getDiscoverCampaigns(
        page: _page,
        limit: limit,
      );
    } else {
      // based category
      result = await _api.getCampaignsByCategory(
        category: selectedCategory,
        page: _page,
        limit: limit,
      );
    }

    if (result.length < limit) {
      hasMore = false;
    }

    campaigns.addAll(result);
    
    _page++;
  } catch (e) {
    Get.snackbar('Error', 'Failed to load campaigns');
  }

updateFiltersCount();
  isLoading = false;
  update();
}

Map<CampaignCategory, int> calculateCategoryCounts(
  List<CampaignModel> campaigns,
) {
  final Map<CampaignCategory, int> counts = {};

  for (final category in CampaignCategory.values) {
    counts[category] = 0;
  }

  for (final campaign in campaigns) {
    final category =
        campaignCategoryFromString(campaign.category);

    counts[category] = (counts[category] ?? 0) + 1;
  }

  return counts;
}
void updateFiltersCount() {
  final counts = calculateCategoryCounts(campaigns);

  filters = CampaignCategory.values.map((category) {
    return FilterItem(
      id: category.index.toString(),
      title: category.labelAr,
      count: category == CampaignCategory.ALL
          ? campaigns.length 
          : counts[category] ?? 0,
    );
  }).toList();

  update();
}


}





//////////////////////////////////////////////////////
//               CampaignCategory
/////////////////////////////////////////////////////
enum CampaignCategory {
   ALL,
  WATER,
  HEALTH,
  ENVIROMENT,
  FOOD,
  EDUCATION,
  SHELTER,
  ANIMALS,
}
extension CampaignCategoryX on CampaignCategory {
  String get apiValue => name;
}

extension CampaignCategoryLabel on CampaignCategory {
  String get labelAr {
    switch (this) {
      case CampaignCategory.ALL:
        return 'الكل';
      case CampaignCategory.WATER:
        return 'مياه';
      case CampaignCategory.HEALTH:
        return 'صحة';
      case CampaignCategory.ENVIROMENT:
        return 'بيئة';
      case CampaignCategory.FOOD:
        return 'غذاء';
      case CampaignCategory.EDUCATION:
        return 'تعليم';
      case CampaignCategory.SHELTER:
        return 'مأوى';
      case CampaignCategory.ANIMALS:
        return 'حيوانات';
    }
  }
}

CampaignCategory campaignCategoryFromString(String value) {
  return CampaignCategory.values.firstWhere(
    (e) => e.name == value,
    orElse: () => CampaignCategory.WATER,
  );
}
