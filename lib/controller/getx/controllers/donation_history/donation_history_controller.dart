import 'package:crowdfunding_platform/controller/core/constants/images_manager.dart';
import 'package:crowdfunding_platform/model/donation_summary.dart';
import 'package:get/get.dart';

class DonationHistoryController extends GetxController {
  // قائمة التبرعات باستخدام المودل الخاص بك
  var donations = <DonationSummary>[].obs;
  String get streamlineImage => Get.isDarkMode
      ? ImagesManager.streamlineDark
      : ImagesManager.streamlineLight;

  @override
  void onInit() {
    super.onInit();
    // تجربة: فك التعليق عن السطر بالأسفل لتجربة الحالة المليانة
    //_loadMockData();
  }

  String formatTimeAgo(DateTime dateTime) {
    final duration = DateTime.now().difference(dateTime);

    if (duration.inDays >= 30) {
      return "منذ ${(duration.inDays / 30).floor()} شهر";
    } else if (duration.inDays >= 7) {
      return "منذ ${(duration.inDays / 7).floor()} أسبوع";
    } else if (duration.inDays >= 1) {
      return duration.inDays == 1 ? "أمس" : "منذ ${duration.inDays} يوم";
    } else if (duration.inHours >= 1) {
      return "منذ ${duration.inHours} ساعة";
    } else if (duration.inMinutes >= 1) {
      return "منذ ${duration.inMinutes} دقيقة";
    } else {
      return "الآن";
    }
  }

  // void _loadMockData() {
  //   donations.assignAll([
  //     DonationSummary(
  //       title: "قطرة حياة : مياه نظيفة لأطفال غزة",
  //       amount: 50,
  //       currency: "شيكل",
  //       campaignImage: ImagesManager.campaignReview,
  //       numberStars: 50,
  //       donationDate: DateTime(2025, 7, 16),
  //     ),
  //     // أضف المزيد هنا...
  //   ]);
  // }
}
