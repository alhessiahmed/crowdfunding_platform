import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CampaignDetailsController extends GetxController{ 
  var selectedIndex = 0.obs; 
    final List<int> stars = [50, 100, 250, 500];
    TextEditingController? controller ;
    @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    controller =TextEditingController();
  }

}