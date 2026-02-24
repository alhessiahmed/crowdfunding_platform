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
    File? avatar,
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
      print('patchDonorMultipart url: $url');
      print('patchDonorMultipart fields: ${request.fields}');
      print(
        'patchDonorMultipart hasAuth: ${SharedPrefController().token != null}',
      );

      Future<void> attachFileIfExists(String fieldName, File? file) async {
        if (file == null) return;
        if (!await file.exists()) {
          print(
            'patchDonorMultipart skipped missing file for $fieldName: ${file.path}',
          );
          return;
        }
        request.files.add(
          await http.MultipartFile.fromPath(fieldName, file.path),
        );
      }

      await attachFileIfExists('avatar', avatar);
      await attachFileIfExists('idFront', idFront);
      await attachFileIfExists('idBack', idBack);
      await attachFileIfExists('selfieWithId', selfieWithId);

      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);
      print('patchDonorMultipart statusCode: ${response.statusCode}');
      print('patchDonorMultipart body: ${response.body}');

      Map<String, dynamic> json = <String, dynamic>{};
      if (response.body.isNotEmpty) {
        try {
          final decoded = jsonDecode(response.body);
          if (decoded is Map<String, dynamic>) {
            json = decoded;
          }
        } catch (_) {
          // Keep json empty and use raw body as fallback message below.
        }
      }

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
        message: (json['message']?.toString().isNotEmpty ?? false)
            ? json['message'].toString()
            : (response.body.isNotEmpty ? response.body : 'Request failed'),
        object: json,
      );
    } catch (e) {
      print('patchDonorMultipart exception: $e');
      return failedResponse<Map<String, dynamic>>();
    }
  }
}
