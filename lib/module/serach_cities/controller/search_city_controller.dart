import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:weather_app_demo/constant/api_constant.dart';
import 'package:weather_app_demo/model/search_city_response.dart';
import '../../../services/api_helper.dart';

class SearchCityController extends GetxController{

  late TextEditingController cityNameController;
  Rx<SearchCityModel> searchCityResponse = SearchCityModel().obs;
  final _apiHelper = Get.find<ApiHelper>();
  String cityname = '';

  @override
  void onInit() {
    super.onInit();
    cityNameController = TextEditingController();
  }

  void onBackClick(){
    Get.back();
  }

  void searchCity(String city){

    if(city.isEmpty){

    }else if(city.length>3){
      _getCityList(city);
    }
  }

  void _getCityList(String city){
    _apiHelper.getApiCall(SEARCH_CITY+city).then(
          (response) {
        if (response?.statusCode == 200) {
          final responseData = searchCityResponseFromJson(response!.body);
          searchCityResponse.value = responseData;
        }
      },
    );
  }

  void getCityName(String name){
     cityname = name;
  }

}