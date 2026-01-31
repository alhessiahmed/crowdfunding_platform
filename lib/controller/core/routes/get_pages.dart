import 'package:crowdfunding_platform/controller/getx/bindings/auth/forgot_password_binding.dart';
import 'package:crowdfunding_platform/controller/getx/bindings/auth/user_type_selection_binding.dart';
import 'package:crowdfunding_platform/controller/getx/bindings/auth/verification_binding.dart';
import 'package:crowdfunding_platform/controller/getx/bindings/campaign/campaign_step_five_binding.dart';
import 'package:crowdfunding_platform/controller/getx/bindings/campaign/campaign_step_four_binding.dart';
import 'package:crowdfunding_platform/controller/getx/bindings/campaign/campaign_step_one_binding.dart';
import 'package:crowdfunding_platform/controller/getx/bindings/campaign/campaign_step_three_binding.dart';
import 'package:crowdfunding_platform/controller/getx/bindings/campaign/campaign_step_two_binding.dart';
import 'package:crowdfunding_platform/controller/getx/bindings/campaign_details_binding.dart';
import 'package:crowdfunding_platform/controller/getx/bindings/donation_history/donation_history_binding.dart';
import 'package:crowdfunding_platform/controller/getx/bindings/discover_binding.dart';
import 'package:crowdfunding_platform/controller/getx/bindings/main_binding.dart';
import 'package:crowdfunding_platform/controller/getx/bindings/my_campagins_binding.dart';
import 'package:crowdfunding_platform/controller/getx/bindings/notification/notification_setting_binding.dart';
import 'package:crowdfunding_platform/controller/getx/bindings/profile_binding.dart';
import 'package:crowdfunding_platform/controller/getx/bindings/creator/creator_verfication_binding.dart';
import 'package:crowdfunding_platform/controller/getx/bindings/notification/notification_binding.dart';
import 'package:crowdfunding_platform/view/screens/auth/forgot_password_screen.dart';
import 'package:crowdfunding_platform/view/screens/auth/reset_password_success_screen.dart';
import 'package:crowdfunding_platform/view/screens/auth/setup_success_screen.dart';
import 'package:crowdfunding_platform/view/screens/auth/verification_screen.dart';
import 'package:crowdfunding_platform/view/screens/campaign_create_screens/campaign_step_five_screen.dart';
import 'package:crowdfunding_platform/view/screens/campaign_create_screens/campaign_step_four_screen.dart';
import 'package:crowdfunding_platform/view/screens/campaign_create_screens/campaign_step_one_screen.dart';
import 'package:crowdfunding_platform/view/screens/campaign_create_screens/campaign_step_three_screen.dart';
import 'package:crowdfunding_platform/view/screens/campaign_create_screens/campaign_step_two_screen.dart';
import 'package:crowdfunding_platform/view/screens/campaign_details_screen.dart';
import 'package:crowdfunding_platform/view/screens/discover_screen.dart';
import 'package:crowdfunding_platform/view/screens/creator/creator_verfication_screen.dart';
import 'package:crowdfunding_platform/view/screens/creator/creator_verification_success_screen.dart';
import 'package:crowdfunding_platform/view/screens/donor/donor_personal_info_screen.dart';
import 'package:crowdfunding_platform/view/screens/donor/verification/donor_acc_verification_screen.dart';
import 'package:crowdfunding_platform/view/screens/donor/verification/donor_verification_shell_screen.dart';
import 'package:crowdfunding_platform/view/screens/donor/verification/donor_verification_success_screen.dart';
import 'package:crowdfunding_platform/view/screens/donation_history/donation_history_screen.dart';
import 'package:crowdfunding_platform/view/screens/home_screen.dart';
import 'package:crowdfunding_platform/view/screens/intro/welcome_screen.dart';
import 'package:crowdfunding_platform/view/screens/main_screen.dart';
import 'package:crowdfunding_platform/view/screens/my_campaigns.dart';
import 'package:crowdfunding_platform/view/screens/notification/notification_setting_screen.dart';
import 'package:crowdfunding_platform/view/screens/notification/notification_screen.dart';
import 'package:get/get.dart';
import '../../../view/screens/auth/onboarding_shell_screen.dart';
import '../../../view/screens/auth/reset_password_screen.dart';
import '../../../view/screens/auth/sign_in_screen.dart';
import '../../../view/screens/auth/sign_up_screen.dart';
import '../../../view/screens/auth/user_type_selection_screen.dart';
import '../../../view/screens/auth/user_welcome_screen.dart';
import '../../../view/screens/intro/launch_screen.dart';
import '../../../view/screens/intro/onboarding_screen.dart';
import '../../../view/screens/payment/confirm_payment_screen.dart';
import '../../../view/screens/payment/credit_card_payment_screen.dart';
import '../../../view/screens/payment/payment_method_screens.dart';
import '../../../view/screens/payment/thanks_for_payment_screen.dart';
import '../../getx/bindings/auth/creator_onboarding_binding.dart';
import '../../getx/bindings/auth/reset_password_binding.dart';
import '../../getx/bindings/auth/sign_in_binding.dart';
import '../../getx/bindings/auth/sign_up_binding.dart';
import '../../getx/bindings/donor/donor_personal_info_binding.dart';
import '../../getx/bindings/donor/donor_verification_binding.dart';
import '../../getx/bindings/payment/confirm_payment_binding.dart';
import '../../getx/bindings/payment/payment_method_binding.dart';
import '../../getx/bindings/payment/thanks_for_payment_binding.dart';
import 'routes_manager.dart';

import 'index.dart';

final List<GetPage<dynamic>> getPages = [
  GetPage(name: RoutesManager.launchScreen, page: () => const LaunchScreen()),
  GetPage(
    name: RoutesManager.onboardingScreen,
    page: () => const OnboardingScreen(),
  ),
  GetPage(name: RoutesManager.welcomeScreen, page: () => const WelcomeScreen()),
  GetPage(
    name: RoutesManager.signUpScreen,
    page: () => const SignUpScreen(),
    binding: SignUpBinding(),
  ),
  GetPage(
    name: RoutesManager.signInScreen,
    page: () => const SignInScreen(),
    binding: SignInBinding(),
  ),
  GetPage(
    name: RoutesManager.forgotPasswordScreen,
    page: () => const ForgotPasswordScreen(),
    binding: ForgotPasswordBinding(),
  ),
  GetPage(
    name: RoutesManager.verificationScreen,
    page: () => const VerificationScreen(),
    binding: VerificationBinding(),
  ),
  GetPage(
    name: RoutesManager.resetPasswordScreen,
    page: () => const ResetPasswordScreen(),
    binding: ResetPasswordBinding(),
  ),
  GetPage(
    name: RoutesManager.resetPasswordSuccessScreen,
    page: () => const ResetPasswordSuccessScreen(),
  ),
  GetPage(
    name: RoutesManager.userTypeSelectionScreen,
    page: () => UserTypeSelectionScreen(),
    binding: UserTypeSelectionBinding(),
  ),
  GetPage(
    name: RoutesManager.userWelcomeScreen,
    page: () => UserWelcomeScreen(),
  ),
  GetPage(
    name: RoutesManager.onboardingShellScreen,
    page: () => const OnboardingShellScreen(),
    binding: CreatorOnboardingBinding(),
  ),
  GetPage(
    name: RoutesManager.setupSuccessScreen,
    page: () => SetupSuccessScreen(),
  ),
  GetPage(
    name: RoutesManager.mainScreen,
    page: () => const MainScreen(),
    binding: MainBinding(),
  ),
  GetPage(
    name: RoutesManager.discoverScreen,
    page: () => const DiscoverScreen(),
    bindings: [
      DiscoverBinding(),
      // CategoryBinding(),
    ],
  ),
  GetPage(
    name: RoutesManager.campaignDetailsScreen,
    page: () => const CampaignDetailsScreen(),
    binding: CampaignDetailsBinding(),
  ),

  GetPage(
    name: RoutesManager.paymentScreen,
    page: () => const PaymentMethodScreens(),
    binding: PaymentBinding(),
  ),
  GetPage(
    name: RoutesManager.creditCardPaymentScreen,
    page: () => const CreditCardPaymentScreen(),
  ),
  GetPage(
    name: RoutesManager.confirmPaymentScreen,
    page: () => const ConfirmPaymentScreen(),
    binding: ConfirmPaymentBinding(),
  ),
  GetPage(
    name: RoutesManager.thanksForPaymentScreen,
    page: () => const ThanksForPaymentScreen(),
    binding: ThanksForPaymentBinding(),
  ),
  GetPage(
    name: RoutesManager.CampaignStepOneScreen,
    page: () => CampaignStepOneScreen(),
    binding: CampaignStepOneBinding(),
  ),
  GetPage(
    name: RoutesManager.CampaignStepTwoScreen,
    page: () => CampaignStepTwoScreen(),
    binding: CampaignStepTwoBinding(),
  ),
  GetPage(
    name: RoutesManager.CampaignStepFiveScreen,
    page: () => CampaignStepFiveScreen(),
    binding: CampaignStepFiveBinding(),
  ),
  GetPage(
    name: RoutesManager.CampaignStepThreeScreen,
    page: () => CampaignStepThreeScreen(),
    binding: CampaignStepThreeBinding(),
  ),
  GetPage(
    name: RoutesManager.CampaignStepFourScreen,
    page: () => CampaignStepFourScreen(),
    binding: CampaignStepFourBinding(),
  ),
  GetPage(
    name: RoutesManager.donationHistoryScreen,
    page: () => DonationHistoryScreen(),
    binding: DonationHistoryBinding(),
  ),
  GetPage(
    name: RoutesManager.notificationScreen,
    page: () => NotificationsScreen(),
    binding: NotificationBinding(),
  ),
  GetPage(
    name: RoutesManager.profileScreen,
    page: () => const ProfileScreen(),
    binding: ProfileBinding(),
  ),
  GetPage(
    name: RoutesManager.myCampaignsScreen,
    page: () => const MyCampaignsScreen(),
    binding: MyCampaginsBinding(),
  ),
  GetPage(
    name: RoutesManager.homeScreen,
    page: () => const HomeScreen(),
    binding: DiscoverBinding(),
  ),
  GetPage(
    name: RoutesManager.creatorVerificationScreen,
    page: () => const CreatorVerficationScreen(),
    binding: CreatorVerficationBinding(),
  ),
  GetPage(
    name: RoutesManager.creatorVerificationSuccessScreen,
    page: () => const CreatorVerificationSuccessScreen(),
  ),

  GetPage(
    name: RoutesManager.donorAccVerificationScreen,
    page: () => const DonorAccVerificationScreen(),
  ),
  GetPage(
    name: RoutesManager.donorVerificationShellScreen,
    page: () => const DonorVerificationShellScreen(),
    binding: DonorVerificationBinding(),
  ),
  GetPage(
    name: RoutesManager.donorVerificationSuccessScreen,
    page: () => const DonorVerificationSuccessScreen(),
  ),
  GetPage(
    name: RoutesManager.donorPersonalInfoScreen,
    page: () => const DonorPersonalInfoScreen(),
    binding: DonorPersonalInfoBinding(),
  ),
  GetPage(
    name: RoutesManager.notificationSettingsScreen,
    page: () => NotificationSettingsScreen(),
    binding: NotificationSettingBinding(),
  ),
  GetPage(
    name: RoutesManager.statusDonorverificationScreen,
    page: () => const StatusDonorVerificationScreen(),
    binding: StatusDonorVerificationBinding(),
  ),
  GetPage(
    name: RoutesManager.securityPrivacyScreen,
    page: () => const SecurityPrivacy(),
    binding: SecurityPrivactBinding(),
  ),
  // GetPage(
  //   name: RoutesManager.homeScreen,
  //   page: () => const HomeScreen(),
  //   bindings: [
  //     HomeBinding(),
  //     CategoryBinding(),
  //   ],
  // ),
];
