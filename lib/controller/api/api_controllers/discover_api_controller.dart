import 'dart:convert';
import 'dart:developer';

import 'package:crowdfunding_platform/controller/api/api_helper.dart';
import 'package:crowdfunding_platform/controller/api/api_settings.dart';
import 'package:crowdfunding_platform/controller/getx/controllers/discover_controller.dart';
import 'package:crowdfunding_platform/model/api_response.dart';
import 'package:crowdfunding_platform/model/campagin_models/campagin_model.dart';
import 'package:http/http.dart' as http;

class CampaginApiController with ApiHelper {
  Future<List<CampaignModel>> getDiscoverCampaigns({
    required int page,
    required int limit,
  }) async {
    try {
      final uri = Uri.parse('${ApiSettings.campaign}?page=$page&limit=$limit');
      final response = await http.get(
        uri,
        headers: {'accept': 'application/json'},
      );

      if(response.statusCode == 200 || response.statusCode == 201){ 
        final List data = jsonDecode(response.body);
        final campagins =  data.map((e) => CampaignModel.fromJson(e)).toList();
        log(campagins.toString());
        return campagins;
      }else{ 
         throw Exception(
          'Server error: ${response.statusCode}',
        );
      }
    } catch (e) {
      rethrow;
    }
  }
   Future<List<CampaignModel>> getCampaignsByCategory({
    required CampaignCategory category,
    required int page,
    required int limit,
  }) async {
    final uri = Uri.parse(
      '${ApiSettings.campaign}/category/${category.apiValue}?page=$page&limit=$limit',
    );
log(uri.toString());
    final response = await http.get(
      uri,
      headers: {'accept': 'application/json'},
    );

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return data.map((e) => CampaignModel.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load campaigns');
    }
  }
}
//ENVIROMENT
