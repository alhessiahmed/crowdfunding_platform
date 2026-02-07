import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CampaignDetailsController extends GetxController {
  var selectedIndex = 0.obs;
  final List<int> stars = [50, 100, 250, 500];
  TextEditingController? controller;

  @override
  void onInit() {
    super.onInit();
    controller = TextEditingController();
  }

  void selectStarIndex(int index) {
    selectedIndex.value = index;
  }

  @override
  void onClose() {
    controller?.dispose();
    controller = null;
    super.onClose();
  }
}
