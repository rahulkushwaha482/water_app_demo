import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:weather_app_demo/constant/api_constant.dart';
import '../../../model/weather_response.dart';
import '../../../services/api_helper.dart';

class HomeController extends GetxController {
  final _apiHelper = Get.find<ApiHelper>();
  Rx<WeatherResponse> weatherResponse = WeatherResponse().obs;
  RxString adddress = ''.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    _getAccountDetails();
    Position position = await _determinePosition();
    _getAddressFromLatLong(position).then((fetchedAddress) {
      adddress.value = fetchedAddress;
    });
  }

  void _getAccountDetails() {
    _apiHelper.getApiCall(API_GET_WEATHER_DETAIL).then(
          (response) {
        if (response?.statusCode == 200) {
          final responseData = weatherResponseFromJson(response!.body);
          weatherResponse.value = responseData;
        }
      },
    );
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    Future<Position> position = Geolocator.getCurrentPosition();
    return await position;
  }

  Future<String> _getAddressFromLatLong(Position position) async {
    List<Placemark> placemarks =
    await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark place = placemarks[0];
    String address = place.locality.toString();
    print(address);
    return address;
  }
}