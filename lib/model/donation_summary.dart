class DonationSummary {
  const DonationSummary({
    required this.title,
    required this.amount,
    required this.currency,
    required this.campaignImage, required this.numberStars,
  });
  final int numberStars;
  final String title; // "قطرة حياة: مياه نظيفة..."
  final num amount; // 50
  final String currency; // "شيكل"
  final String campaignImage; // image url or asset
}
