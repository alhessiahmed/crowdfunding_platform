
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:crowdfunding_platform/controller/api/api_controllers/discover_api_controller.dart';
import 'package:crowdfunding_platform/controller/api/api_settings.dart';
import 'package:crowdfunding_platform/model/campagin_models/campagin_model.dart';
import 'package:crowdfunding_platform/model/filter_item.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class DiscoverController extends GetxController {
  final CampaginApiController _api = CampaginApiController();

  int _page = 1;
  final int limit = 15;
int selectedFilterIndex =0 ;
  bool isLoading = false;
  bool hasNoInternet = false;
  bool isCountsLoading = false;
  bool hasMore = true;
dynamic categoryCounts  ;
CampaignCategory selectedCategory = CampaignCategory.ALL;
List<FilterItem> filters = [];
Map<CampaignCategory, int> _globalCategoryCounts = {};
  final RxSet<String> _favoriteLoadingIds = <String>{}.obs;

  List<CampaignModel> campaigns = [];
  RxList<String> favoriteIds  = <String>[].obs ;

  @override
  void onInit() {
    super.onInit();
    _buildInitialFilters();
    refreshGlobalCategoryCounts();
    getCampaigns();
  }
void selectCategory(int index , item ) {
  selectedFilterIndex = index;
  selectedCategory = CampaignCategory.values[index];

  getCampaigns(refresh: true);
  update();
}


Future<void> getCampaigns({bool refresh = false}) async {
  final hasInternet = await _api.hasInternetConnection();
  if (!hasInternet) {
    hasNoInternet = true;
    if (campaigns.isEmpty) {
      isLoading = false;
    }
    update();
    Get.snackbar('No Internet', 'Please check your connection and try again');
    return;
  }

  if (isLoading) return;
  if (!hasMore && !refresh) return;

  hasNoInternet = false;
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
  } on SocketException {
    hasNoInternet = true;
    Get.snackbar('No Internet', 'Please check your connection and try again');
  } catch (e) {
    hasNoInternet = false;
    Get.snackbar('Error', 'Failed to load campaigns');
  }

updateFiltersCount();
  isLoading = false;
  update();
}

   Future<void> toggleFavorite(String campaignId) async {
    if (_favoriteLoadingIds.contains(campaignId)) return;
    _favoriteLoadingIds.add(campaignId);

    final url = Uri.parse(ApiSettings.toggleLikeCampaign(campaignId));

    try {
      final response = await http.post(
        url,
        headers: {
          'accept': 'application/json',
          'Authorization': 'Bearer ${ApiSettings.token}',
        },
      );

      log(response.body.toString());

      if (response.statusCode == 200 || response.statusCode == 201) {
        final body = response.body.trim();
        bool? liked;

        if (body.isNotEmpty) {
          try {
            final dynamic decoded = jsonDecode(body);
            if (decoded is Map<String, dynamic> && decoded['liked'] is bool) {
              liked = decoded['liked'] as bool;
            }
          } catch (_) {
            // Ignore parse errors and fallback to local toggle.
          }
        }

        final currentIsFav = favoriteIds.contains(campaignId);
        final shouldLike = liked ?? !currentIsFav;

        if (shouldLike) {
          if (!currentIsFav) {
            favoriteIds.add(campaignId);
          }
        } else {
          favoriteIds.remove(campaignId);
        }
      }
    } catch (e) {
      log('toggleFavorite error: $e');
    } finally {
      _favoriteLoadingIds.remove(campaignId);
    }
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
        campaignCategoryFromString(campaign.category.name);

    counts[category] = (counts[category] ?? 0) + 1;
  }

  return counts;
}
Future<void> refreshGlobalCategoryCounts() async {
  final hasInternet = await _api.hasInternetConnection();
  if (!hasInternet) {
    hasNoInternet = true;
    update();
    return;
  }

  hasNoInternet = false;
  if (isCountsLoading) return;
  isCountsLoading = true;
  update();

  try {
    final Map<CampaignCategory, int> counts = {
      for (final category in CampaignCategory.values) category: 0,
    };

    for (final category in CampaignCategory.values) {
      if (category == CampaignCategory.ALL) continue;

      int page = 1;
      int totalForCategory = 0;

      while (true) {
        final result = await _api.getCampaignsByCategory(
          category: category,
          page: page,
          limit: limit,
        );

        totalForCategory += result.length;

        if (result.length < limit) break;
        page++;
      }

      counts[category] = totalForCategory;
    }

    counts[CampaignCategory.ALL] = counts.entries
        .where((entry) => entry.key != CampaignCategory.ALL)
        .fold<int>(0, (sum, entry) => sum + entry.value);

    _globalCategoryCounts = counts;
    updateFiltersCount();
  } catch (_) {
    // Keep existing counters if count refresh fails.
  } finally {
    isCountsLoading = false;
    update();
  }
}

void updateFiltersCount() {
  final hasGlobalCounts = _globalCategoryCounts.isNotEmpty;
  final counts = _globalCategoryCounts.isNotEmpty
      ? _globalCategoryCounts
      : calculateCategoryCounts(campaigns);

  filters = CampaignCategory.values.map((category) {
    final isAllLoading = category == CampaignCategory.ALL &&
        isCountsLoading &&
        !hasGlobalCounts;

    return FilterItem(
      id: category.index.toString(),
      title: category.labelAr,
      count: isAllLoading ? 0 : (counts[category] ?? 0),
      isLoading: isAllLoading,
    );
  }).toList();

  update();
}

void _buildInitialFilters() {
  filters = CampaignCategory.values.map((category) {
    return FilterItem(
      id: category.index.toString(),
      title: category.labelAr,
      count: 0,
      isLoading: category == CampaignCategory.ALL,
    );
  }).toList();
}


}





//////////////////////////////////////////////////////
//               CampaignCategory
/////////////////////////////////////////////////////

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
