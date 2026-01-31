

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
