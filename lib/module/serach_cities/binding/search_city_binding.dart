

import 'package:get/get.dart';
import 'package:weather_app_demo/module/serach_cities/controller/search_city_controller.dart';

class SearchBinding extends Bindings{

  @override
  void dependencies(){
    Get.lazyPut<SearchCityController>(
          () => SearchCityController(),
    );
  }

}