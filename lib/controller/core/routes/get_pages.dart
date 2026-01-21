import 'package:crowdfunding_platform/controller/getx/bindings/auth/forgot_password_binding.dart';
import 'package:crowdfunding_platform/controller/getx/bindings/auth/user_type_selection_binding.dart';
import 'package:crowdfunding_platform/controller/getx/bindings/auth/verification_binding.dart';
import 'package:crowdfunding_platform/controller/getx/bindings/campaign_details_binding.dart';
import 'package:crowdfunding_platform/controller/getx/bindings/control_campaign_binding.dart';
import 'package:crowdfunding_platform/controller/getx/bindings/home_binding.dart';
import 'package:crowdfunding_platform/view/screens/auth/forgot_password_screen.dart';
import 'package:crowdfunding_platform/view/screens/auth/reset_password_success_screen.dart';
import 'package:crowdfunding_platform/view/screens/auth/setup_success_screen.dart';
import 'package:crowdfunding_platform/view/screens/auth/verification_screen.dart';
import 'package:crowdfunding_platform/view/screens/campaign_details_screen.dart';
import 'package:crowdfunding_platform/view/screens/home_screen.dart';
import 'package:crowdfunding_platform/view/screens/intro/welcome_screen.dart';
import 'package:crowdfunding_platform/view/screens/main_screen.dart';
import 'package:crowdfunding_platform/view/screens/update_campaign/control_campaign_screen.dart';
import 'package:get/get.dart';

import '../../../view/screens/auth/forgot_password_screen.dart';
import '../../../view/screens/auth/onboarding_shell_screen.dart';
import '../../../view/screens/auth/reset_password_screen.dart';
import '../../../view/screens/auth/reset_password_success_screen.dart';
import '../../../view/screens/auth/setup_success_screen.dart';
import '../../../view/screens/auth/sign_in_screen.dart';
import '../../../view/screens/auth/sign_up_screen.dart';
import '../../../view/screens/auth/user_type_selection_screen.dart';
import '../../../view/screens/auth/user_welcome_screen.dart';
import '../../../view/screens/auth/verification_screen.dart';
import '../../../view/screens/intro/launch_screen.dart';
import '../../../view/screens/intro/onboarding_screen.dart';
import '../../../view/screens/intro/welcome_screen.dart';
import '../../../view/screens/payment/confirm_payment_screen.dart';
import '../../../view/screens/payment/credit_card_payment_screen.dart';
import '../../../view/screens/payment/payment_method_screens.dart';
import '../../../view/screens/payment/thanks_for_payment_screen.dart';
import '../../getx/bindings/auth/creator_onboarding_binding.dart';
import '../../getx/bindings/auth/forgot_password_binding.dart';
import '../../getx/bindings/auth/reset_password_binding.dart';
import '../../getx/bindings/auth/sign_in_binding.dart';
import '../../getx/bindings/auth/sign_up_binding.dart';
import '../../getx/bindings/auth/user_type_selection_binding.dart';
import '../../getx/bindings/auth/verification_binding.dart';
import '../../getx/bindings/payment/confirm_payment_binding.dart';
import '../../getx/bindings/payment/payment_method_binding.dart';
import '../../getx/bindings/payment/thanks_for_payment_binding.dart';
import 'routes_manager.dart';

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
    binding: HomeBinding(),
  ),
  GetPage(
    name: RoutesManager.homeScreen,
    page: () => const HomeScreen(),
    bindings: [
      HomeBinding(),
      // CategoryBinding(),
    ],
  ),
  GetPage(
    name: RoutesManager.campaignDetailsScreen,
    page: () => const CampaignDetailsScreen(),
    binding: CampaignDetailsBinding(),
  ),
  GetPage(
    name: RoutesManager.controlCampaignScreen,
    page: () => const ControlCampaignScreen(),
    binding: ControlCampaignBinding(),
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

  // GetPage(
  //   name: AppRoutes.createAccount,
  //   page: () => const CreateAccountScreen(),
  // ),
  // GetPage(
  //   name: RoutesManager.homeScreen,
  //   page: () => const HomeScreen(),
  //   bindings: [
  //     HomeBinding(),
  //     CategoryBinding(),
  //   ],
  // ),
  // GetPage(
  //   name: RoutesManager.subCategoryScreen,
  //   page: () => const SubCategoriesScreen(),
  //   binding: SubCategoryBinding(),
  // ),
];
