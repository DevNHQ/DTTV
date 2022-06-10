import 'package:dttv/src/core/authentication_binding.dart';
import 'package:dttv/src/pages/home/home_binding.dart';
import 'package:dttv/src/pages/home/home_page.dart';
import 'package:dttv/src/pages/splash/splash_page.dart';
import 'package:dttv/src/routes/app_routes.dart';
import 'package:get/get_navigation/get_navigation.dart';

class AppPages {
  static const duration = 350;
  static const Transition transition = Transition.topLevel;
  static var pages = [
    GetPage(
      name: AppRoutes.home,
      page: () => const HomePage(),
      binding: HomeBinding(),
      transition: transition,
      transitionDuration: const Duration(milliseconds: duration),
    ),
    GetPage(
      name: AppRoutes.splash,
      page: () => SplashPage(),
      binding: AuthenticationBinding(),
      transition: transition,
      transitionDuration: const Duration(milliseconds: duration),
    ),
  ];
}
