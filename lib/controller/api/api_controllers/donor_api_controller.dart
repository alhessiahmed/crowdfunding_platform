import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../../../model/api_response.dart';
import '../../shared_pref/shared_pref_controller.dart';
import '../api_helper.dart';
import '../api_settings.dart';

class DonorApiController with ApiHelper {
  /// Generic POST to donor base endpoint with JSON body.
  Future<ApiResponse<Map<String, dynamic>>> postDonorJson({
    required String path,
    Map<String, dynamic>? body,
    Map<String, String>? headers,
  }) async {
    try {
      final url = Uri.parse('${ApiSettings.donor}/$path');
      final response = await http.post(
        url,
        headers: {
          ...acceptHeader,
          'Content-Type': 'application/json',
          if (headers != null) ...headers,
        },
        body: body == null ? null : jsonEncode(body),
      );

      final Map<String, dynamic> json = response.body.isNotEmpty
          ? jsonDecode(response.body) as Map<String, dynamic>
          : <String, dynamic>{};

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return ApiResponse<Map<String, dynamic>>(
          success: true,
          statusCode: response.statusCode,
          message: json['message'] ?? 'Success',
          object: json,
        );
      }

      return ApiResponse<Map<String, dynamic>>(
        success: false,
        statusCode: response.statusCode,
        message: json['message'] ?? 'Request failed',
        object: json,
      );
    } catch (e) {
      return failedResponse<Map<String, dynamic>>();
    }
  }

  /// Generic multipart PATCH to donor base endpoint (e.g. donor verification).
  Future<ApiResponse<Map<String, dynamic>>> patchDonorMultipart({
    required String id,
    String? firstName,
    String? lastName,
    String? email,
    DateTime? dateOfBirth,
    String? phoneNumber,
    String? country,
    String? notes,
    List<String>? areasOfInterest,
    List<String>? preferredCampaignTypes,
    String? geographicScope,
    String? targetAudience,
    num? preferredCampaignSize,
    String? preferredCampaignVisibility,
    String? fullNameOnId,
    String? idNumber,
    File? idFront,
    File? idBack,
    File? selfieWithId,
    Map<String, String>? headers,
  }) async {
    try {
      final url = Uri.parse('${ApiSettings.donor}/$id');
      final request = http.MultipartRequest('PATCH', url);

      final Map<String, String> fields = {};
      if (firstName != null) fields['firstName'] = firstName;
      if (lastName != null) fields['lastName'] = lastName;
      if (email != null) fields['email'] = email;
      if (dateOfBirth != null) {
        fields['dateOfBirth'] = dateOfBirth.toIso8601String().split('T').first;
      }
      if (phoneNumber != null) fields['phoneNumber'] = phoneNumber;
      if (country != null) fields['country'] = country;
      if (notes != null) fields['notes'] = notes;
      if (areasOfInterest != null) {
        fields['areasOfInterest'] = jsonEncode(areasOfInterest);
      }
      if (preferredCampaignTypes != null) {
        fields['preferredCampaignTypes'] = jsonEncode(preferredCampaignTypes);
      }
      if (geographicScope != null) fields['geographicScope'] = geographicScope;
      if (targetAudience != null) fields['targetAudience'] = targetAudience;
      if (preferredCampaignSize != null) {
        fields['preferredCampaignSize'] = preferredCampaignSize.toString();
      }
      if (preferredCampaignVisibility != null) {
        fields['preferredCampaignVisibility'] = preferredCampaignVisibility;
      }
      if (fullNameOnId != null) fields['fullNameOnId'] = fullNameOnId;
      if (idNumber != null) fields['idNumber'] = idNumber;

      request.fields.addAll(fields);
      request.headers.addAll({
        ...acceptHeader,
        if (SharedPrefController().token != null)
          HttpHeaders.authorizationHeader:
              'Bearer ${SharedPrefController().token}',
        if (headers != null) ...headers,
      });

      if (idFront != null) {
        request.files.add(
          await http.MultipartFile.fromPath('idFront', idFront.path),
        );
      }
      if (idBack != null) {
        request.files.add(
          await http.MultipartFile.fromPath('idBack', idBack.path),
        );
      }
      if (selfieWithId != null) {
        request.files.add(
          await http.MultipartFile.fromPath('selfieWithId', selfieWithId.path),
        );
      }

      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);
      final Map<String, dynamic> json = response.body.isNotEmpty
          ? jsonDecode(response.body) as Map<String, dynamic>
          : <String, dynamic>{};

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return ApiResponse<Map<String, dynamic>>(
          success: true,
          statusCode: response.statusCode,
          message: json['message'] ?? 'Success',
          object: json,
        );
      }

      return ApiResponse<Map<String, dynamic>>(
        success: false,
        statusCode: response.statusCode,
        message: json['message'] ?? 'Request failed',
        object: json,
      );
    } catch (e) {
      return failedResponse<Map<String, dynamic>>();
    }
  }
}
