import 'dart:convert';
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
    required DateTime dateOfBirth,
    required String type,
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
          'dateOfBirth': dateOfBirth.toIso8601String().split('T').first,
          'type': type,
        }),
      );
      print('registerCreator statusCode: ${response.statusCode}');
      print('registerCreator responseBody: ${response.body}');

      final Map<String, dynamic> json = jsonDecode(response.body);

      if (response.statusCode == 201 || response.statusCode == 200) {
        // TODO(creator-register): adjust parsing once backend response contract is confirmed.
        final authPayload = (json['data'] is Map<String, dynamic>)
            ? json['data'] as Map<String, dynamic>
            : json;

        return ApiResponse<AuthResult>(
          success: true,
          statusCode: response.statusCode,
          message: json['message'] ?? 'Registration successful',
          object: AuthResult.fromJson(authPayload),
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
}
