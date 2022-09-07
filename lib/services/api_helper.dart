import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:http/http.dart';
import 'package:weather_app_demo/constant/app_error.dart';
import '../constant/api_constant.dart';
import '../utils/loader.dart';

class ApiHelper {
  void _errorHandler(Response response) {
    debugPrint(
      '\n╔══════════════════════════ Response ══════════════════════════\n'
      '╟ REQUEST ║ ${response.request?.method.toUpperCase()}\n'
      '╟ url: ${response.request?.url}\n'
      '╟ Headers: ${response.request?.headers}\n'
      '╟ Body: ${response.bodyBytes.map((event) => event.toString())}\n'
      '╟ Status Code: ${response.statusCode}\n'
      '╟ Data: ${response.body.toString()}'
      '\n╚══════════════════════════ Response ══════════════════════════\n',
      wrapWidth: 1024,
    );

    if (response.statusCode == 200) {
      return;
    }
  }

  Future<Response?> postApiCall(
      String urlEndPoint, Map<String, String> requestMap) async {
    Response? response;
    try {
      response = await post(
        Uri.parse(API_BASE_URL + urlEndPoint),
        body: requestMap,
      );
      // To remove the loader.
      Get.back();
      _errorHandler(response);
    } on SocketException {
      // To remove the loader.
      Get.back();
      Get.snackbar(cNetworkError, cNetworkErrorDetails);
    }
    return response;
  }

  Future<Response?> getApiCall(String url) async {
    Response? response;
    Loader().showLoadingWidget();
    try {
      response = await get(
        Uri.parse(url),
      );
      Get.back();
      _errorHandler(response);
    } on SocketException {
      //Get.back();
      Get.snackbar(cNetworkError, cNetworkErrorDetails);
    }
    return response;
  }
}
