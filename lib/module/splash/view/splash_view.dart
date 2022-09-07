import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app_demo/module/splash/controller/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    controller.onInit();
    return const SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
              padding: EdgeInsets.all(40.0),
              child: Text(
                'Weather App',
                style: TextStyle(fontSize: 24, color: Colors.lightGreen),
              )),
        ),
      ),
    );
  }
}
