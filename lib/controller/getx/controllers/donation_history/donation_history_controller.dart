import 'package:crowdfunding_platform/controller/core/constants/images_manager.dart';
import 'package:crowdfunding_platform/model/donation_summary.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class DonationHistoryController extends GetxController {
  // قائمة التبرعات باستخدام المودل الخاص بك
  var donations = <DonationSummary>[].obs;
  String get streamlineImage => Get.isDarkMode
      ? ImagesManager.streamlineDark
      : ImagesManager.streamlineLight;

  var isLoading = false.obs;
  var totalCount = 0.obs;

  @override
  void onInit() {
    super.onInit();
    fetchMyDonations();
  }

  Future<void> fetchMyDonations() async {
    isLoading.value = true;

    try {
      // 1. تجهيز الرابط (URL) بنفس النمط الذي استخدمته
      var uri = Uri.parse(
        'https://gsg-project-group-2-production.up.railway.app/api/v1/donation/me?page=1&limit=10',
      );

      // 2. إرسال طلب GET (بدون Multipart لأننا نجلب بيانات فقط)
      var response = await http.get(
        uri,
        headers: {
          'Accept': 'application/json',
          // 'Authorization': 'Bearer YOUR_TOKEN', // أضف التوكن إذا كان مطلوباً كما في شاشة الإنشاء
        },
      );

      // 3. التحقق من النتيجة
      if (response.statusCode == 200) {
        // فك تشفير الـ JSON
        var data = json.decode(response.body);
        // هون بتشوف الـ JSON كامل

        // تعبئة البيانات في القائمة
        totalCount.value = data['total'] ?? 0;
        List items = data['items'] ?? [];

        donations.assignAll(
          items.map((e) => DonationSummary.fromJson(e)).toList(),
        );
      } else {
        Get.snackbar(
          'خطأ',
          'فشل في جلب بيانات التبرعات: ${response.statusCode}',
        );
      }
    } catch (e) {
      Get.snackbar('خطأ', 'تأكد من اتصالك بالإنترنت');
    } finally {
      isLoading.value = false;
    }
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
