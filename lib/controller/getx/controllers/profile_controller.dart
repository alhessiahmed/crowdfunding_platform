import 'dart:convert';

import 'package:crowdfunding_platform/controller/api/api_settings.dart';
import 'package:crowdfunding_platform/controller/core/constants/colors_manager.dart';
import 'package:crowdfunding_platform/controller/core/routes/routes_manager.dart';
import 'package:crowdfunding_platform/controller/shared_pref/shared_pref_controller.dart';
import 'package:crowdfunding_platform/model/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ProfileController extends GetxController {
  final Rxn<User> currentUser = Rxn<User>();
  final RxBool isLoadingUser = false.obs;
  final RxBool isDeleting = false.obs;

  @override
  void onInit() {
    super.onInit();
    _loadUserFromCache();
    //getUserData();
  }

  String get fullName {
    final user = currentUser.value;
    if (user == null) return '';
    return '${user.firstName} ${user.lastName}'.trim();
  }

  

  void _loadUserFromCache() {
    final cached = SharedPrefController().user;
    if (cached == null) return;

    try {
      currentUser.value = User.fromJson(Map<String, dynamic>.from(cached));
    } catch (e) {
      Get.log('load cached user failed: $e');
    }
  }

  // Future<void> getUserData([String? id]) async {
  //   final userId =
  //       id ?? currentUser.value?.id ?? (SharedPrefController().user?['id'] as String?);

  //   if (userId == null || userId.trim().isEmpty) return;

  //   final token = ApiSettings.token;
  //   if (token == null || token.isEmpty) return;

  //   isLoadingUser.value = true;

  //   try {
  //     final uri = Uri.parse(ApiSettings.user(userId));
  //     final response = await http.get(
  //       uri,
  //       headers: {
  //         'accept': 'application/json',
  //         'Authorization': 'Bearer $token',
  //       },
  //     );

  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       final body = jsonDecode(response.body);
  //       if (body is Map<String, dynamic>) {
  //         currentUser.value = User.fromJson(body);
  //         await SharedPrefController().saveUser(body);
  //       }
  //       return;
  //     }

  //     Get.log('getUserData failed: ${response.statusCode} ${response.body}');
  //   } catch (e) {
  //     Get.log('getUserData error: $e');
  //   } finally {
  //     isLoadingUser.value = false;
  //   }
  // }

  void deleteAccount(String? id) {
    final userId = id ?? currentUser.value?.id ?? (SharedPrefController().user?['id'] as String?);

    if (userId == null || userId.trim().isEmpty) {
      Get.snackbar('Error', 'Invalid user id');
      return;
    }

    Get.defaultDialog(
      title: 'تأكيد الحذف',
      middleText: 'هل أنت متأكد أنك تريد حذف حسابك؟ لا يمكن التراجع عن هذا الإجراء.',
      textConfirm: 'حذف',
      textCancel: 'إلغاء',
      confirmTextColor: Colors.white,
      buttonColor: ColorsManager.danger2,
      contentPadding: EdgeInsets.all(50.r),
      onConfirm: () async {
        if (isDeleting.value) return;

        Get.back();
        isDeleting.value = true;

        try {
          final token = ApiSettings.token;
          if (token == null || token.isEmpty) {
            Get.snackbar('Error', 'Missing auth token');
            return;
          }

          final uri = Uri.parse(ApiSettings.user(userId));
          final response = await http.delete(
            uri,
            headers: {
              'accept': 'application/json',
              'Authorization': 'Bearer $token',
            },
          );

          if (response.statusCode == 200 ||
              response.statusCode == 201 ||
              response.statusCode == 204) {
            await SharedPrefController().clearAuth();
            await SharedPrefController().clearUserType();
            Get.offAllNamed(RoutesManager.welcomeScreen);
            return;
          }

          Get.snackbar(
            'Delete failed',
            'Server responded with ${response.statusCode}',
          );
        } catch (e) {
          Get.snackbar('Delete failed', 'Please try again');
          Get.log('deleteAccount error: $e');
        } finally {
          isDeleting.value = false;
        }
      },
      onCancel: () {},
    );
  }
}

