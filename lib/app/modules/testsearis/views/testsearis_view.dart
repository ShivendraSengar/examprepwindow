import 'package:carousel_slider/carousel_slider.dart';
import 'package:exam_prep_tool/app/modules/testsearis/views/practice_test_series.dart';
import 'package:exam_prep_tool/app/modules/testsearis/views/weekely_testSeries.dart';
import 'package:exam_prep_tool/app/routes/app_pages.dart';
import 'package:exam_prep_tool/app/themes/app_style.dart';
import 'package:exam_prep_tool/app/widgets/custom_colors.dart';
import 'package:exam_prep_tool/gen/assets.gen.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/testsearis_controller.dart';

//class TestsearisView extends GetView<TestsearisController> {
//  const TestsearisView({Key? key}) : super(key: key);
//  @override
//  Widget build(BuildContext context) {
//    return DefaultTabController(
//      length: 3,
//      child: Container(
//        height: double.infinity,
//        width: double.infinity,
//        decoration: BoxDecoration(gradient: lineargrdient),
//        child: SafeArea(
//          child: Scaffold(
//            appBar: buildAppbar(),
//            body: Center(
//              child: Container(
//                height: Get.height,
//                child: SingleChildScrollView(
//                  // Add SingleChildScrollView here
//                  child: Column(
//                    children: [
//                      5.heightBox,
//                      CarouselSlider(
//                        options: CarouselOptions(
//                          height: 250.0,
//                          autoPlay: false,
//                          aspectRatio: 16 / 9,
//                          enableInfiniteScroll: true,
//                          autoPlayAnimationDuration:
//                              Duration(milliseconds: 800),
//                        ),
//                        items: controller.imgList.map((imageUrl) {
//                          return Builder(
//                            builder: (BuildContext context) {
//                              return Container(
//                                width: MediaQuery.of(context).size.width,
//                                margin: EdgeInsets.symmetric(horizontal: 5.0),
//                                decoration: BoxDecoration(),
//                                child:
//                                    Image.network(imageUrl, fit: BoxFit.fill),
//                              );
//                            },
//                          );
//                        }).toList(),
//                      ),
//                      30.heightBox,
//                      Container(
//                        margin: const EdgeInsets.only(left: 10, right: 10),
//                        width: 600,
//                        height: 45,
//                        decoration: BoxDecoration(
//                          border: Border.all(width: 0, color: Colors.white),
//                          borderRadius: BorderRadius.circular(25.0),
//                          color: Vx.white,
//                        ),
//                        child: TabBar(
//                          indicatorPadding: const EdgeInsets.all(0),
//                          labelPadding: const EdgeInsets.all(0),
//                          padding: const EdgeInsets.all(00),
//                          indicatorWeight: 2.0,
//                          dividerHeight: 0,
//                          indicator: BoxDecoration(
//                            gradient: lineargrdient,
//                            borderRadius: BorderRadius.circular(25.0),
//                          ),
//                          labelColor: Colors.white,
//                          unselectedLabelColor: Colors.black,
//                          tabs: [
//                            Text("Practice text").p(8),
//                            Text("Weekely text").p(8),
//                            Text("Test Summary").p(8),
//                          ],
//                        ),
//                      ).p(8).centered(),
//                      Container(
//                        // Added Container for padding
//                        height: Get.height -
//                            250 -
//                            75 -
//                            45, // Adjust height based on the Carousel and TabBar height
//                        child: Expanded(
//                          child: TabBarView(children: [
//                            //buildButton("Weekely text", Vx.amber100),
//                            PracticeTestSeries(),
//                            WeeklyTest(),
//                            buildButton("Weekely text", Vx.amber100),
//                          ]),
//                        ),
//                      ),
//                    ],
//                  ),
//                ),
//              ),
//            ),
//          ),
//        ),
//      ),
//    );
//  }

//  buildButton(text, ColorTween) {
//    return Container(
//      alignment: Alignment.center,
//      width: 200,
//      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
//      height: 30,
//      color: ColorTween,
//      child: Text(text),
//    );
//  }

//  buildAppbar() {
//    return AppBar(
//      elevation: 0,
//      iconTheme: const IconThemeData(color: Colors.white),
//      title: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
//        Image.asset(
//          Assets.images.headerLogo.path,
//          height: 40,
//          // color: Colors.white,
//          width: 110,
//          fit: BoxFit.contain,
//        ),
//        "Exam Prep Tool"
//            .text
//            .size(20)
//            .textStyle(AppStyle.txtPoppinsSemiBold16White90002)
//            .color(Vx.white)
//            .make(),
//      ]),
//      flexibleSpace: Container(
//        decoration: BoxDecoration(gradient: lineargrdient),
//      ),
//      leading: IconButton(
//        icon: Icon(Icons.arrow_back),
//        onPressed: () {
//          Get.toNamed(Routes.HOME);
//          // // Get.back();
//          // Get.back();
//        },
//      ),
//    );
//  }
//}
class TestsearisView extends GetView<TestsearisController> {
  const TestsearisView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(gradient: lineargrdient),
        child: SafeArea(
          child: Scaffold(
            appBar: buildAppbar(),
            body: Center(
              child: Container(
                height: Get.height,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      5.heightBox,
                      CarouselSlider(
                        options: CarouselOptions(
                          height: 250.0,
                          autoPlay: false,
                          aspectRatio: 16 / 9,
                          enableInfiniteScroll: true,
                          autoPlayAnimationDuration:
                              Duration(milliseconds: 800),
                        ),
                        items: controller.imgList.map((imageUrl) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Container(
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.symmetric(horizontal: 5.0),
                                decoration: BoxDecoration(),
                                child:
                                    Image.network(imageUrl, fit: BoxFit.fill),
                              );
                            },
                          );
                        }).toList(),
                      ),
                      30.heightBox,
                      Container(
                          //margin: const EdgeInsets.only(left: 10, right: 10),
                          width: 600,
                          height: 45,
                          decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.grey),
                            borderRadius: BorderRadius.circular(25.0),
                            color: Vx.white,
                          ),
                          child: TabBar(
                            controller: controller.tabController,
                            indicatorPadding: const EdgeInsets.all(0),
                            labelPadding:
                                const EdgeInsets.symmetric(horizontal: 0),
                            padding: const EdgeInsets.symmetric(horizontal: 0),
                            indicatorWeight: 2.0,
                            dividerHeight: 0,
                            indicator: BoxDecoration(
                              gradient: lineargrdient,
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            labelColor: Colors.white,
                            unselectedLabelColor: Colors.black,
                            tabs: [
                              _buildTab("Practice text", 0).w(200),
                              _buildTab("Weekly text", 1).w(200),
                              _buildTab("Test Summary", 2).w(200),
                            ],
                          )).paddingSymmetric(vertical: 10).centered(),
                      10.heightBox,
                      Container(
                        height: Get.height - 250 - 75 - 45,
                        child: TabBarView(
                          controller: controller.tabController,
                          children: [
                            PracticeTestSeries(),
                            WeeklyTest(),
                            buildButton("Weekly text", Vx.amber100),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTab(String text, int index) {
    return Obx(() {
      final selected = controller.tabIndex.value == index;
      Color unselectedColor;
      if (index == 0) {
        unselectedColor = Colors.orange;
      } else if (index == 1) {
        unselectedColor = Color.fromARGB(255, 40, 8, 247);
      } else {
        unselectedColor = Colors.green;
      }

      return Tab(
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Text(
            text,
            style: TextStyle(
              color: selected ? Colors.white : unselectedColor,
            ),
          ),
        ),
      );
    });
  }

  buildButton(text, Color color) {
    return Container(
      alignment: Alignment.center,
      width: 200,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      height: 30,
      color: color,
      child: Text(text),
    ).paddingSymmetric(horizontal: 20);
  }

  buildAppbar() {
    return AppBar(
      elevation: 0,
      iconTheme: const IconThemeData(color: Colors.white),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            Assets.images.headerLogo.path,
            height: 40,
            width: 110,
            fit: BoxFit.contain,
          ),
          "Exam Prep Tool"
              .text
              .size(20)
              .textStyle(AppStyle.txtPoppinsSemiBold16White90002)
              .color(Vx.white)
              .make(),
        ],
      ),
      flexibleSpace: Container(
        decoration: BoxDecoration(gradient: lineargrdient),
      ),
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Get.toNamed(Routes.HOME);
        },
      ),
    );
  }
}
