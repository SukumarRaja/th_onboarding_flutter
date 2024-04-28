import 'dart:async';
import 'dart:io';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/controllers/locallization.dart';
import 'app/controllers/main.dart';
import 'app/controllers/theme.dart';
import 'app/lanuages/language.dart';
import 'app/lanuages/translation.dart';
import 'app/routes/routes.dart';
import 'app/themes/dark_theme.dart';
import 'app/themes/light_theme.dart';
import 'app/ui/pages/onboarding.dart';

Future<void> main() async {
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  await LocalizationController.to.initializeAllLanguages();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: ThemeController(),
        builder: (themeController) {
          return GetBuilder(
              init: LocalizationController(),
              builder: (localizeController) {
                return GetBuilder(
                    init: MainController(),
                    builder: (mainController) {
                      return Obx(() => GetMaterialApp(
                          title: "app_name".tr,
                          debugShowCheckedModeBanner: false,
                          navigatorKey: Get.key,
                          scrollBehavior:
                              const MaterialScrollBehavior().copyWith(
                            dragDevices: {
                              PointerDeviceKind.mouse,
                              PointerDeviceKind.touch
                            },
                          ),
                          theme: themeController.darkTheme ? dark : light,
                          locale: localizeController.locale,
                          translations: Messages(
                              languages: localizeController.allLanguage),
                          fallbackLocale: Locale(languages[0].languageCode!,
                              languages[0].countryCode),
                          home:  Onboarding(),
                          // initialRoute: '/',
                          getPages: AppRoutes.routes,
                          defaultTransition: Transition.topLevel,
                          transitionDuration: const Duration(milliseconds: 500),
                          builder: (BuildContext context, widget) {
                            return MediaQuery(
                              data: MediaQuery.of(context).copyWith(
                                  textScaler: const TextScaler.linear(1)),
                              child:
                                  Material(child: Stack(children: [widget!])),
                            );
                          }));
                    });
              });
        });
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
