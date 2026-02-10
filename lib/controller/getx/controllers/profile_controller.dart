import 'package:crowdfunding_platform/controller/core/constants/colors_manager.dart';
import 'package:crowdfunding_platform/controller/core/routes/routes_manager.dart';
import 'package:crowdfunding_platform/controller/shared_pref/shared_pref_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController { 

  void deleteAccount(){ 
     Get.defaultDialog(
    title: 'تأكيد الحذف',
    middleText: 'هل أنت متأكد أنك تريد حذف حسابك؟ لا يمكن التراجع عن هذا الإجراء.',
    textConfirm: 'حذف',
    textCancel: 'إلغاء',

    confirmTextColor: Colors.white,
    buttonColor: ColorsManager.danger2,

    onConfirm: () async {
      Get.back(); // close dialog

      await SharedPrefController().clearToken();

      Get.offAllNamed(RoutesManager.welcomeScreen);
    },

    onCancel: () {},
  );
  }
}