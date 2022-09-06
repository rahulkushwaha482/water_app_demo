import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app_demo/constant/app_theme.dart';
import 'package:weather_app_demo/module/home/controller/home_controller.dart';
import 'package:weather_app_demo/utils/date_time_converter.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              // Below is the code for Linear Gradient.
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.green, Colors.blue],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 20.0, left: 20),
                    child: Text(
                      'Current Weather',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap:(){

                        },
                        child: Row(
                          children: [
                            Text(controller.adddress.toString()??"",
                            ),
                            const Icon(Icons.arrow_drop_down_sharp),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 8.0, top: 10.0),
                                child: Text(
                                  controller.firstIndexValueOfWeatherResponse.value.temp!.day.toString()??"",
                                  style: const TextStyle(
                                    fontSize: 20,
                                    color: AppTheme.kWhite,
                                  ),
                                ),
                              ),
                              const Positioned(
                                  right: 1,
                                  top: 3,
                                  child: Icon(
                                    Icons.circle,
                                    size: 12,
                                    color: AppTheme.kWhite,
                                  ))
                            ],
                          ),
                          Column(
                            children: const [
                              Icon(
                                Icons.sunny,
                                color: AppTheme.kWhite,
                              ),
                              Text(
                                'Sunny',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: AppTheme.kWhite,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      Container(
                        height: 60,
                        width: 80,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  DateTimeConverter()
                                      .convertTime(controller.firstIndexValueOfWeatherResponse.value.dt??1111)
                                      .toString()??"",
                                  style: const TextStyle(
                                    fontSize: 18,
                                    color: AppTheme.kDarkBlue,
                                  ),
                                ),
                                Container(
                                  height: 30,
                                  width: 30,
                                  decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(15)),
                                      color: Colors.lightBlueAccent),
                                  child: const Icon(
                                    Icons.calendar_today_rounded,
                                    color: AppTheme.kDarkBlue,
                                    size: 20,
                                  ),
                                )
                              ],
                            ),
                            Text(
                              DateTimeConverter()
                                  .dateTimeConvert(controller.firstIndexValueOfWeatherResponse.value.dt??45677)
                                  .toString()??"",
                              style: const TextStyle(
                                fontSize: 16,
                                color: AppTheme.kBlack,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
