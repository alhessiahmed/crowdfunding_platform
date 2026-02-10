import 'package:crowdfunding_platform/controller/getx/bindings/add_update_to_campaign_binding.dart';
import 'package:crowdfunding_platform/controller/getx/bindings/change_pass_binding.dart';
import 'package:crowdfunding_platform/controller/getx/bindings/control_campaign_binding.dart';
import 'package:crowdfunding_platform/controller/getx/bindings/edit_campaign_details_binding.dart';
import 'package:crowdfunding_platform/controller/getx/bindings/donar_home_binding.dart';
import 'package:crowdfunding_platform/controller/getx/bindings/home_binding.dart';
import 'package:crowdfunding_platform/controller/getx/bindings/login_activity_binding.dart';
import 'package:crowdfunding_platform/controller/getx/bindings/notification/notification_setting_binding.dart';
import 'package:crowdfunding_platform/controller/getx/bindings/payment/add_payment_method_binding.dart';
import 'package:crowdfunding_platform/controller/getx/bindings/payment/choose_payment_method_binding.dart';
import 'package:crowdfunding_platform/controller/getx/bindings/request_to_withdraw_profits_binding.dart';
import 'package:crowdfunding_platform/controller/getx/bindings/summer_of_withdraw_binding.dart';
import 'package:crowdfunding_platform/controller/getx/bindings/wallet_binding.dart';
import 'package:crowdfunding_platform/view/screens/add_pymaent_method/add_payment_method_page.dart';
import 'package:crowdfunding_platform/view/screens/add_pymaent_method/choose_payment_method_page.dart';
import 'package:crowdfunding_platform/view/screens/change_pass/change_pass_screen.dart';
import 'package:crowdfunding_platform/view/screens/doner_home/donar_home_screen.dart';
import 'package:crowdfunding_platform/view/screens/intro/launch_screen.dart';
import 'package:crowdfunding_platform/view/screens/login_activity/login_activity_screen.dart';
import 'package:crowdfunding_platform/view/screens/notification/notification_setting_screen.dart';
import 'package:crowdfunding_platform/view/screens/update_campaign/add_update_to_campagin_screen.dart';
import 'package:crowdfunding_platform/view/screens/update_campaign/control_campaign_screen.dart';
import 'package:crowdfunding_platform/view/screens/update_campaign/edit_campaign_details_screen.dart';
import 'package:crowdfunding_platform/view/screens/wallet/Request_to_withdraw_profits_screen.dart';
import 'package:crowdfunding_platform/view/screens/wallet/summer_of_withdraw_screen.dart';
import 'package:crowdfunding_platform/view/screens/wallet/wallet_screen.dart';

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
    name: RoutesManager.loginActivityScreen,
    page: () => const LoginActivityScreen(),
    binding: LoginActivityBinding(),
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
    name: RoutesManager.homeScreen,
    page: () => const HomeScreen(),
    bindings: [
      DiscoverBinding(),
      HomeBinding(),
    ],
  ),
  GetPage(
    name: RoutesManager.donarHomeScreen,
    page: () => const DonarHomeScreen(),
    binding: DonarHomeBinding(),
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
    name: RoutesManager.choosePaymentMethodScreen,
    page: () => const ChoosePaymentMethodPage(),
    binding: ChoosePaymentMethodBinding(),
  ),
  GetPage(
    name: RoutesManager.addPaymentMethodScreen,
    page: () => const AddPaymentMethodPage(),
    binding: AddPaymentMethodBinding(),
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
    name: RoutesManager.controlCampaignScreen,
    page: () => const ControlCampaignScreen(),
    binding: ControlCampaignBinding(),
  ),
  GetPage(
    name: RoutesManager.addUpdateToCampaignScreen,
    page: () => const AddUpdateToCampaign(),
    binding: AddUpdateToCampaignBinding(),
  ),
  GetPage(
    name: RoutesManager.editCampaignDetailsScreen,
    page: () => const EditCampaignDetailsScreen(),
    binding: EditCampaignDetailsBinding(),
  ),
  GetPage(
    name: RoutesManager.walletScreen,
    page: () => const WalletScreen(),
    binding: WalletBinding(),
  ),
  GetPage(
    name: RoutesManager.requestToWithdrawProfitsScreen,
    page: () => const RequestToWithdrawProfitsScreen(),
    binding: RequestToWithdrawProfitsBinding(),
  ),
  GetPage(
    name: RoutesManager.summerOfWithdrawScreen,
    page: () => const SummerOfWithdrawScreen(),
    binding: SummerOfWithdrawBinding(),
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
   GetPage(
    name: RoutesManager.changePasswordScreen,
    page: () => const ChangePassScreen(),
    binding: ChangePassBinding(),
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
