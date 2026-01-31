import 'package:flutter/material.dart';

class NotificationModel {
  final String title;
  final String body;
  final DateTime time;
  final IconData icon;
  final String type; // أضفنا هاد: "impact" أو "security" أو "contribution"
  final bool isNew;

  NotificationModel({
    required this.title,
    required this.body,
    required this.time,
    required this.icon,
    required this.type, // مطلوب الآن عند تعريف أي إشعار
    this.isNew = false,
  });
}
