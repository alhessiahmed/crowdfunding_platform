import 'dart:convert';
import 'dart:developer';

import 'package:crowdfunding_platform/controller/api/api_settings.dart';
import 'package:crowdfunding_platform/model/campagin_models/campaign_update_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class CampaignDetailsController extends GetxController{ 
CampaignDetailsController( {required this.campaignId} );
String campaignId ;
  final List<int> stars = [500, 250, 100, 50];
  late final RxInt selectedIndex;
  final TextEditingController customStarsController = TextEditingController();
  final RxInt selectedTabIndex = 0.obs;
  final RxList<CampaignUpdateModel> campaignUpdates =
      <CampaignUpdateModel>[].obs;
  final RxBool isLoadingUpdates = false.obs;

  void onStelectedTap(int index) {
    if (index < 0 || index > 1) return;
    selectedTabIndex.value = index;
  }

  void selectStarIndex(int index) {
    if (index < 0 || index >= stars.length) return;
    selectedIndex.value = index;
  }

  int get selectedStars => stars[selectedIndex.value];

Future<void> getCampaignUpdates(String campaignId)async{ 
  try{
    isLoadingUpdates.value = true;
    final token = ApiSettings.token ;
    if(token == null || token.isEmpty) {
      campaignUpdates.clear();
      return;
    }
     final url = Uri.parse(ApiSettings.getUpdatesCampaign(campaignId)); 
 final response = await http.get(url , headers: { 
  'accept': 'application/json',
  'Authorization' : 'Bearer $token'
 });

 if(response.statusCode == 200 || response.statusCode == 201){ 
  final reaponseBody = jsonDecode(response.body);
  final rawList = reaponseBody is List
      ? reaponseBody
      : (reaponseBody is Map<String, dynamic> && reaponseBody['data'] is List)
          ? reaponseBody['data'] as List
          : <dynamic>[];

   final parsedUpdates = rawList
       .map((item) => CampaignUpdateModel.fromJson(item))
       .toList();
   parsedUpdates.sort((a, b) => b.createdAt.compareTo(a.createdAt));
   campaignUpdates.assignAll(parsedUpdates);
 }
  }catch(e){
log(e.toString());  
  } finally {
    isLoadingUpdates.value = false;
  }

}
  @override
  void onInit() {
    selectedIndex = (stars.length - 1).obs;
    super.onInit();
    getCampaignUpdates(campaignId);
  }

  @override
  void onClose() {
    customStarsController.dispose();
    super.onClose();
  }
}
