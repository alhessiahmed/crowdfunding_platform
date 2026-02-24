import 'package:crowdfunding_platform/controller/core/constants/images_manager.dart';

class DonationSummary {
  final String title;
  final num amount;
  final String currency;
  final String campaignImage;
  final int numberStars;
  final DateTime? donationDate;

  const DonationSummary({
    required this.title,
    required this.amount,
    required this.currency,
    required this.campaignImage,
    required this.numberStars,
    this.donationDate,
  });

  factory DonationSummary.fromJson(Map<String, dynamic> json) {
    return DonationSummary(
      // بما أن الـ API لا يرسل العنوان حالياً، نستخدم الـ ID أو نص افتراضي
      title:
          "تبرع لحملة رقم ${json['campaignId']?.toString().substring(0, 5) ?? '---'}",
      // تحويل المبلغ من Minor (قروش) إلى القيمة الحقيقية
      amount: (json['amountInMinor'] ?? 0) / 100,
      currency: json['currency'] ?? "USD",
      campaignImage: ImagesManager.campaignReview, // صورة افتراضية
      numberStars: json['stars'] ?? 0,
      donationDate: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'])
          : DateTime.now(),
    );
  }
}
