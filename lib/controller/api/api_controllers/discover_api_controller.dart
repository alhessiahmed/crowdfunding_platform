import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:crowdfunding_platform/controller/api/api_helper.dart';
import 'package:crowdfunding_platform/controller/api/api_settings.dart';
import 'package:crowdfunding_platform/controller/getx/controllers/discover_controller.dart';
import 'package:crowdfunding_platform/model/campagin_models/campagin_model.dart';
import 'package:http/http.dart' as http;

class CampaginApiController with ApiHelper {
  Map<String, String> get _headers => {
        HttpHeaders.acceptHeader: 'application/json',
        if (ApiSettings.token != null && ApiSettings.token!.isNotEmpty)
          HttpHeaders.authorizationHeader: 'Bearer ${ApiSettings.token}',
      };

  Future<List<CampaignModel>> getDiscoverCampaigns({
    required int page,
    required int limit,
  }) async {
    try {
      final uri = Uri.parse('${ApiSettings.campaign}?page=$page&limit=$limit');
      final response = await http.get(
        uri,
        headers: _headers,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final decoded = jsonDecode(response.body);
        final List data = decoded is List ? decoded : (decoded['data'] as List? ?? []);
        final campagins = data
            .whereType<Map<String, dynamic>>()
            .map(CampaignModel.fromJson)
            .toList();
        log('discover campagins////////${data.toList()}');
        return campagins;
      } else {
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
      headers: _headers,
    );

    if (response.statusCode == 200) {
      final decoded = jsonDecode(response.body);
      final List data = decoded is List ? decoded : (decoded['data'] as List? ?? []);
      return data
          .whereType<Map<String, dynamic>>()
          .map(CampaignModel.fromJson)
          .toList();
    } else {
      throw Exception('Failed to load campaigns');
    }
  }
}
//ENVIROMENT
