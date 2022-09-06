import 'package:get/get.dart';
import 'package:weather_app_demo/routes/app_pages.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Future.delayed(Duration(milliseconds: 1500)).then(
      (value) {
        Get.offNamed(Routes.HOME);
      },
    );
  }
}
