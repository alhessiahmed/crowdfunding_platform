import 'package:crowdfunding_platform/controller/core/constants/images_manager.dart';
import 'package:crowdfunding_platform/model/notification_model.dart';
// import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationsController extends GetxController {
  String get notificationImage => Get.isDarkMode
      ? ImagesManager.notificationDark
      : ImagesManager.notificationLight;
  var notifications = <NotificationModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    // لغايات التجربة، يمكنك استدعاء بيانات وهمية
    //_loadMockNotifications();
  }

  // الدالة التي تحول التاريخ لنص مترجم حسب الحاجة
  String formatNotificationTime(DateTime dateTime) {
    final duration = DateTime.now().difference(dateTime);
    bool isAr = Get.locale?.languageCode == 'ar';

    if (duration.inHours < 24) {
      return isAr ? "منذ ${duration.inHours} ساعة" : "${duration.inHours}h ago";
    } else {
      return isAr
          ? "2 صباحاً"
          : "2 AM"; // أو أي تنسيق ثابت للساعات كما في الصورة
    }
  }

  // void _loadMockNotifications() {
  //   notifications.assignAll([
  //     NotificationModel(
  //       title: "تحقق أثر جديد لتبرعك",
  //       body: "تبرعك ساعد في توفير مياه نظيفة لعائلة كاملة لمدة أسبوع.",
  //       time: DateTime.now().subtract(const Duration(hours: 2)),
  //       icon: Icons.star_rounded,
  //       isNew: true,
  //     ),
  //     NotificationModel(
  //       title: "تحديث على حسابك",
  //       body: "تم تغيير إعدادات الأمان بنجاح.",
  //       time: DateTime.now().subtract(const Duration(hours: 5)),
  //       icon: Icons.lock_outline,
  //       isNew: true,
  //     ),
  //     NotificationModel(
  //       title: "شكراً لمساهمتك 💙",
  //       body: "كل نجمة منك تصنع فرقاً حقيقياً.",
  //       time: DateTime.now().subtract(const Duration(days: 1)),
  //       icon: Icons.favorite_border,
  //       isNew: false,
  //     ),
  //   ]);
  // }
}
