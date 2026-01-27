import 'package:flutter/material.dart';

class NotificationModel {
  final String title;
  final String body;
  final DateTime time;
  final IconData icon; //تصنيف الى خصوصية و اثر و مساهمة
  final bool isNew; // لتمييز الإشعارات "الجديدة" عن "الأمس"

  NotificationModel({
    required this.title,
    required this.body,
    required this.time,
    required this.icon,
    this.isNew = false,
  });
}
