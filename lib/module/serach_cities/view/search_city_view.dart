import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:weather_app_demo/constant/app_theme.dart';
import 'package:weather_app_demo/module/serach_cities/controller/search_city_controller.dart';

class SeachCityView extends GetView<SearchCityController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                controller.onBackClick();
              },
              child: Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 25,
                    ),
                  ),
                  Text(
                    'Change City',
                    style: TextStyle(fontSize: 20, color: AppTheme.kBlack),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: controller.cityNameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: AppTheme.kDarkBlue, //this has no effect
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  hintText: "Enter City Name",
                ),
                onChanged: (value) {
                  controller.searchCity(value);
                },
              ),
            ),
            Obx(
              () => SizedBox(
                height: 500,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: controller
                          .searchCityResponse.value.data!.record!.length ??
                      1,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        controller.getCityName(controller
                            .searchCityResponse.value.data!.record![index].name
                            .toString());
                        Get.back();
                      },
                      child: SizedBox(
                        height: 50,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Text(
                                controller.searchCityResponse.value.data!
                                        .record![index].name
                                        .toString() ??
                                    "df",
                                style: const TextStyle(fontSize: 18),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Text(
                                controller.searchCityResponse.value.data!
                                        .record![index].country
                                        .toString() ??
                                    "sdf",
                                style: const TextStyle(fontSize: 10),
                              ),
                            ),
                            const Divider(
                              thickness: 1,
                              color: AppTheme.kDarkBlue,
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
