import 'package:crowdfunding_platform/controller/api/api_controllers/mycampagin_api_controller.dart';
import 'package:crowdfunding_platform/model/campagin_models/campagin_model.dart';
import 'package:crowdfunding_platform/model/filter_item.dart';
import 'package:crowdfunding_platform/model/my_campagins_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class MyCampaginsController extends GetxController {
  final String creatorId;

  MyCampaginsController(this.creatorId);

  final RxList<FilterItem> filters = <FilterItem>[].obs;
  final RxInt selectedFilterIndex = 0.obs;
  final RxString selectedFilterId = 'all'.obs;
  final RxList<CampaignModel> filteredCampaigns = <CampaignModel>[].obs;

  final List<CampaignModel> _allCampaigns = <CampaignModel>[];
  static int  campaignsLenght = 0 ;
  final RxBool isLoading = false.obs;
  final MycampaginApiController _myCampaginsController =
      MycampaginApiController();

  Future<void>? _ongoingFetch;

  @override
  void onInit() {
    super.onInit();
    if (creatorId.isEmpty) {
      _clearAllData();
      return;
    }

    getMyCampaginData(creatorId);
  }

  Future<void> refreshCampaigns() {
    return getMyCampaginData(creatorId);
  }

  void selectFilter(int index, FilterItem item) {
    selectedFilterIndex.value = index;
    selectedFilterId.value = item.id;
    applyFilter(item.id);
  }

  Future<void> getMyCampaginData(String creatorId) async {
    if (creatorId.isEmpty) {
      _clearAllData();
      return;
    }

    if (_ongoingFetch != null) {
      return _ongoingFetch!;
    }

    final fetch = _fetchCampaigns(creatorId);
    _ongoingFetch = fetch;

    await fetch;

    if (identical(_ongoingFetch, fetch)) {
      _ongoingFetch = null;
    }
  }

  Future<void> _fetchCampaigns(String creatorId) async {
    isLoading.value = true;
    try {
      final campaigns = await _myCampaginsController.getCampaignsByCreator(
        creatorId,
      );
      campaignsLenght = campaigns.length;

      _allCampaigns
        ..clear()
        ..addAll(campaigns);

      _buildFiltersFromCampaigns();
      applyFilter(selectedFilterId.value);
    } catch (e) {
      _clearAllData();
      Get.log('getMyCampaginData error: $e');
    } finally {
      isLoading.value = false;
    }
  }

  void applyFilter(String filterId) {
    final normalized = filterId.trim().toLowerCase();

    if (normalized == 'all') {
      filteredCampaigns.assignAll(_allCampaigns);
      return;
    }

    filteredCampaigns.assignAll(
      _allCampaigns.where((c) => c.status.trim().toLowerCase() == normalized),
    );
  }

  void _buildFiltersFromCampaigns() {
    final Map<String, int> counts = {
      'completed': 0,
      'active': 0,
      'stopped': 0,
      'pending': 0,
      'draft': 0,
      'paused': 0,
      'deleted': 0,
    };

    for (final c in _allCampaigns) {
      final key = c.status.trim().toLowerCase();
      if (counts.containsKey(key)) {
        counts[key] = counts[key]! + 1;
      }
    }

    filters.assignAll([
      FilterItem(id: 'all', title: 'كل الحملات', count: _allCampaigns.length),
      FilterItem(
        id: 'completed',
        title: 'completed'.tr,
        count: counts['completed']!,
      ),
      FilterItem(id: 'active', title: 'Active'.tr, count: counts['active']!),
      FilterItem(id: 'stopped', title: 'stopped'.tr, count: counts['stopped']!),
      FilterItem(id: 'pending', title: 'pending'.tr, count: counts['pending']!),
      FilterItem(id: 'draft', title: 'draft'.tr, count: counts['draft']!),
      FilterItem(id: 'paused', title: 'paused'.tr, count: counts['paused']!),
    ]);

    final selectedId = selectedFilterId.value;
    final selectedIndex = filters.indexWhere((f) => f.id == selectedId);

    if (selectedIndex == -1) {
      selectedFilterIndex.value = 0;
      selectedFilterId.value = 'all';
    } else {
      selectedFilterIndex.value = selectedIndex;
    }
  }

  void _clearAllData() {
    _allCampaigns.clear();
    filteredCampaigns.clear();
    filters.clear();
    selectedFilterIndex.value = 0;
    selectedFilterId.value = 'all';
  }
void deleteCampaignDialog( String campaignId) {
  Get.defaultDialog(
    title: '',
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.warning_rounded,
          color: Colors.red,
          size: 60,
        ),
        SizedBox(height: 16),
        Text(
          'title_delete_campaign'.tr,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        Text(
          'msg_delete_campaign'.tr,
          textAlign: TextAlign.center,
        ),
      ],
    ),
    textCancel: 'btn_cancel'.tr,
    textConfirm: 'btn_delete'.tr,
    confirmTextColor: Colors.white,
    buttonColor: Colors.red,
    onConfirm: () async {
    String message = await _myCampaginsController.deleteCampagin(campaignId);// close dialog first

      Get.back(); 
      Get.snackbar("", message);
    },
  );
}

}

extension CampaignStatusLabelAr on CampaignStatus {
  String get labelAr {
    switch (this) {
      case CampaignStatus.completed:
        return 'completed'.tr;
      case CampaignStatus.active:
        return 'active'.tr;
      case CampaignStatus.stopped:
        return 'stopped'.tr;
      case CampaignStatus.deleted:
        return 'deleted'.tr;
      case CampaignStatus.draft:
        return 'draft'.tr;
      case CampaignStatus.paused:
        return 'paused'.tr;
      case CampaignStatus.pending:
        return 'pending'.tr;
    }
  }
}

