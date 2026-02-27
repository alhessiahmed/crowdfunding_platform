import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:crowdfunding_platform/controller/shared_pref/shared_pref_controller.dart';
import 'package:crowdfunding_platform/model/user.dart';
import 'package:http/http.dart' as http;
import '../../../model/api_response.dart';
import '../../../model/auth_result.dart';
import '../api_helper.dart';
import '../api_settings.dart';

class AuthApiController with ApiHelper {
  Future<ApiResponse<AuthResult>> registerDonor({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required DateTime dateOfBirth,
  }) async {
    try {
      final url = Uri.parse(ApiSettings.registerDonor);

      final response = await http.post(
        url,
        headers: {...acceptHeader, 'Content-Type': 'application/json'},
        body: jsonEncode({
          "firstName": firstName,
          "lastName": lastName,
          "email": email,
          "password": password,
          "dateOfBirth": dateOfBirth.toIso8601String().split('T').first,
        }),
      );

      final Map<String, dynamic> json = jsonDecode(response.body);

      if (response.statusCode == 201 || response.statusCode == 200) {
        final authResult = AuthResult.fromJson(json);

        return ApiResponse<AuthResult>(
          success: true,
          statusCode: response.statusCode,
          message: 'Registration successful',
          object: authResult,
        );
      }
      return ApiResponse<AuthResult>(
        success: false,
        statusCode: response.statusCode,
        message: json['message'] ?? 'Registration failed',
      );
    } catch (e) {
      return ApiResponse<AuthResult>(
        success: false,
        statusCode: 500,
        message: 'Something went wrong',
      );
    }
  }

  Future<ApiResponse<AuthResult>> registerCreator({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String dateOfBirth,
    required String type,
    required String country,
  }) async {
    try {
      final url = Uri.parse(ApiSettings.registerCreator);

      final response = await http.post(
        url,
        headers: {...acceptHeader, 'Content-Type': 'application/json'},
        body: jsonEncode({
          'firstName': firstName,
          'lastName': lastName,
          'email': email,
          'password': password,
          'dateOfBirth': dateOfBirth,
          'type': type,
          'country': country,
        }),
      );
      print('registerCreator statusCode: ${response.statusCode}');
      print('registerCreator responseBody: ${response.body}');

      final Map<String, dynamic> json = jsonDecode(response.body);

      if (response.statusCode == 201 || response.statusCode == 200) {
        return ApiResponse<AuthResult>(
          success: true,
          statusCode: response.statusCode,
          message: json['message'] ?? 'Registration successful',
          object: AuthResult.fromJson(json),
        );
      }

      return ApiResponse<AuthResult>(
        success: false,
        statusCode: response.statusCode,
        message: json['message'] ?? 'Registration failed',
      );
    } catch (e) {
      print('registerCreator exception: $e');
      return failedResponse<AuthResult>();
    }
  }

  Future<ApiResponse<AuthResult>> registerInstitution({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String dateOfBirth,
    required String type,
    required String institutionName,
    required String institutionRegistrationNumber,
    required String institutionDateOfEstablishment,
    required String registrationCertificate,
    required String representativeIdPhoto,
    required String authorizationLetter,
    required String commissionerImage,
  }) async {
    try {
      final url = Uri.parse(ApiSettings.registerCreator);
      final request = http.MultipartRequest('POST', url);

      request.headers.addAll({...acceptHeader});
      request.fields.addAll({
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'password': password,
        'dateOfBirth': dateOfBirth,
        'type': type,
        'institutionName': institutionName,
        'institutionRegistrationNumber': institutionRegistrationNumber,
        'institutionDateOfEstablishment': institutionDateOfEstablishment,
      });

      request.files.add(
        await http.MultipartFile.fromPath(
          'registrationCertificate',
          registrationCertificate,
        ),
      );
      request.files.add(
        await http.MultipartFile.fromPath(
          'representativeIdPhoto',
          representativeIdPhoto,
        ),
      );
      request.files.add(
        await http.MultipartFile.fromPath(
          'authorizationLetter',
          authorizationLetter,
        ),
      );
      request.files.add(
        await http.MultipartFile.fromPath(
          'commissionerImage',
          commissionerImage,
        ),
      );

      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      print('registerInstitution statusCode: ${response.statusCode}');
      print('registerInstitution responseBody: ${response.body}');

      final Map<String, dynamic> json = response.body.isNotEmpty
          ? jsonDecode(response.body) as Map<String, dynamic>
          : <String, dynamic>{};

      if (response.statusCode == 201 || response.statusCode == 200) {
        return ApiResponse<AuthResult>(
          success: true,
          statusCode: response.statusCode,
          message: json['message'] ?? 'Registration successful',
          object: AuthResult.fromJson(json),
        );
      }

      return ApiResponse<AuthResult>(
        success: false,
        statusCode: response.statusCode,
        message: json['message'] ?? 'Registration failed',
      );
    } catch (e) {
      print('registerInstitution exception: $e');
      return failedResponse<AuthResult>();
    }
  }

  Future<ApiResponse<AuthResult>> login({
    required String email,
    required String password,
  }) async {
    try {
      final url = Uri.parse(ApiSettings.login);

      final response = await http.post(
        url,
        headers: {...acceptHeader, 'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'password': password}),
      );
      final json = jsonDecode(response.body);
      if (response.statusCode == 200) {
        final result = AuthResult.fromJson(json);
        return ApiResponse<AuthResult>(
          success: true,
          statusCode: response.statusCode,
          message: 'Login successful',
          object: result,
        );
      } else {
        return ApiResponse<AuthResult>(
          success: false,
          statusCode: response.statusCode,
          message: json['message'] ?? 'Login failed',
        );
      }
    } catch (e) {
      return failedResponse<AuthResult>();
    }
  }

 Future<void> getUserById(String id) async {

    final token = ApiSettings.token;
    if (token == null || token.isEmpty) return;
    try {
      final uri = Uri.parse(ApiSettings.user(id));
      final response = await http.get(
        uri,
        headers: {
          'accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final body = jsonDecode(response.body);
        if (body is! Map<String, dynamic>) return;

        final dynamic data = body['data'];
        final userData = data is Map<String, dynamic> ? data : body;
        await SharedPrefController().saveUser(userData);
        log('/////////user data//////////\n  $userData');
        return;
      }

    log('getUserData failed: ${response.statusCode} ${response.body}');
    } catch (e) {
  log('getUserData error: $e');
    } finally {
    //  isLoadingUser.value = false;
    }
  }

}
