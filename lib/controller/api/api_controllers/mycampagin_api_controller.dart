import 'dart:convert';
import 'dart:developer';

import 'package:crowdfunding_platform/controller/api/api_settings.dart';
import 'package:crowdfunding_platform/model/campagin_models/campagin_model.dart';
import 'package:http/http.dart' as http;

class MycampaginApiController {
  Future<List<CampaignModel>> getCampaignsByCreator(String creatorId) async {
    try {
      final uri = Uri.parse(ApiSettings.creatorCampaigns(creatorId));
      final response = await http.get(
        uri,
        headers: {'accept': 'application/json' , 
        'Authorization': 'Bearer ${ApiSettings.token}'},
      
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final List<dynamic> data = jsonDecode(response.body) as List<dynamic>;
        final List<CampaignModel> campaigns = data
            .map((e) => CampaignModel.fromJson(e as Map<String, dynamic>))
            .toList();
        log('my campagins////////${data.toList()}');
        return campaigns;
      }  else {
  log('STATUS: ${response.statusCode}');
  log('BODY: ${response.body}');
        throw Exception('Server error: ${response.statusCode}');
      }
    } catch (e) {
      rethrow;
    }
  }
}
