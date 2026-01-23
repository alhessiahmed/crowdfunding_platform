import 'package:crowdfunding_platform/controller/shared_pref/shared_pref_controller.dart';
import 'package:crowdfunding_platform/view/screens/intro/launch_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'controller/core/routes/get_pages.dart';
import 'controller/core/routes/routes_manager.dart';
import 'controller/core/theme/theme_manager.dart';
import 'controller/getx/controllers/theme_controller.dart';
import 'controller/localization/app_translations.dart';
// import 'controller/shared_pref/shared_pref_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(ThemeController());
  await Get.putAsync<SharedPrefController> (()async => await SharedPrefController().initPreferences());
  // await DbController().initDatabase();
   //await SharedPrefController().initPreferences();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      builder: (context, child) {
        return GetMaterialApp(
          textDirection: TextDirection.rtl,
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light(),
          darkTheme: AppTheme.dark(),
          themeMode: ThemeController.to.themeMode,
          // themeMode: ThemeMode.dark,
           initialRoute: RoutesManager.launchScreen,
          //initialRoute: RoutesManager.thanksForPaymentScreen,
          getPages: getPages,
          unknownRoute: GetPage(
            name: RoutesManager.launchScreen,
            page: () => const LaunchScreen(),
          ),
          translations: AppTranslations(),
          locale: Locale('ar'),
          // locale: Locale(SharedPrefController().lang),
          fallbackLocale: const Locale('ar'),
        );
      },
    );
  }
}
