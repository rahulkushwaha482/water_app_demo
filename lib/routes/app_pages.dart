import 'package:get/get.dart';
import 'package:weather_app_demo/module/splash/binding/splash_binding.dart';
import 'package:weather_app_demo/module/splash/view/splash_view.dart';
import '../module/home/binding/home_binding.dart';
import '../module/home/view/home_view.dart';
import '../module/serach_cities/binding/search_city_binding.dart';
import '../module/serach_cities/view/search_city_view.dart';
part 'app_routes.dart';

class AppPages{

  AppPages._();
  static const INITIAL = Routes.SPLASH;
  static final routes = [

    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),

    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),

    GetPage(
      name: _Paths.SEARCH_CITY,
      page: () => SeachCityView(),
      binding: SearchBinding(),
    ),

  ];

}