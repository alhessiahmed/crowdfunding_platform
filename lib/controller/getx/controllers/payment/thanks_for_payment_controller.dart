import 'package:crowdfunding_platform/controller/core/routes/index.dart';

import '../../../../model/donation_summary.dart';
import '../../../core/constants/images_manager.dart';

class ThanksForPaymentController extends GetxController {
  final int numberStars = 50;
  final num donationAmount = 500;

  String get thanksStarImage =>
      Get.isDarkMode ? ImagesManager.starDark : ImagesManager.starLight;

  DonationSummary get summary => DonationSummary(
    numberStars: numberStars,
    amount: donationAmount,
    title: 'Campaign_title_sample'.tr,
    campaignImage: ImagesManager.placeHolder,
    currency: 'Shakel'.tr,
  );

  void onExploreCampaigns() {Get.toNamed(RoutesManager.discoverScreen);}

  void onCreateAccount() {
    Get.offAllNamed(RoutesManager.signUpScreen);
  }
}
