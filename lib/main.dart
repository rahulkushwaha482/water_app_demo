import 'dart:async';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:weather_app_demo/constant/app_error.dart';
import 'package:weather_app_demo/constant/app_string.dart';
import 'package:weather_app_demo/constant/app_theme.dart';
import 'package:weather_app_demo/routes/app_pages.dart';
import 'package:weather_app_demo/services/api_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put<ApiHelper>(
    ApiHelper(),
  );
  // To fix CERTIFICATE_VERIFY_FAILED error.
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(statusBarColor: Colors.white),
  );
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );
  runZonedGuarded<Future<void>>(
    () async {
      runApp(
        GetMaterialApp(
          title: cAppTitle,
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
          debugShowCheckedModeBanner: false,
          builder: BotToastInit(),
          navigatorObservers: [BotToastNavigatorObserver()],
        ),
      );
    },
    (dynamic error, StackTrace stackTrace) {
      print('<<----------ERROR--------->> \n$error');
      print('<<----------STACK TRACE--------->> \n$stackTrace');
      Get.defaultDialog(
        title: cUnknownError,
        titleStyle: Get.textTheme.headline3,
        middleText: cUnknownErrorDetails,
        middleTextStyle: Get.textTheme.headline6,
        textConfirm: cGoBack.toUpperCase(),
        confirmTextColor: AppTheme.kWhite,
        radius: 5,
        buttonColor: AppTheme.kDarkBlue,
        onConfirm: () {
          Get.back();
          // One to close the pop up screen.
          // other one for back navigation from the error page.
          Get.back();
        },
      );
    },
  );
}
