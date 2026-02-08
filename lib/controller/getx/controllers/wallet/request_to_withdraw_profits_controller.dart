import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RequestToWithdrawProfitsController extends GetxController {
  final int totalStares = 5000;
  final int mony = 50000;

  final List<int> stars = [500, 250, 100, 50];
  late final RxInt selectedIndex;
  final TextEditingController customStarsController = TextEditingController();

  void selectStarIndex(int index) {
    if (index < 0 || index >= stars.length) return;
    selectedIndex.value = index;
  }

  int get selectedStars => stars[selectedIndex.value];

  @override
  void onInit() {
    selectedIndex = (stars.length - 1).obs;
    super.onInit();
  }

  @override
  void onClose() {
    customStarsController.dispose();
    super.onClose();
  }
}
