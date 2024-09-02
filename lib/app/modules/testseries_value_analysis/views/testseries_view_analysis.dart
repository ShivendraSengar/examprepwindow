// import 'package:encrypt/encrypt.dart';
import 'package:exam_prep_tool/app/data/modal/test_series/weekley_testSeries_modal.dart';
import 'package:exam_prep_tool/app/modules/testseries_value_analysis/controllers/testseries_view_analysis_controller.dart';
import 'package:exam_prep_tool/app/modules/testseries_value_analysis/views/testseries_solution_page.dart';
import 'package:exam_prep_tool/app/themes/app_style.dart';
import 'package:exam_prep_tool/app/widgets/custom_colors.dart';
import 'package:exam_prep_tool/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/material.dart';

class TestseriesViewAnlysispage
    extends GetView<TestseriesViewAnlysisController> {
 const  TestseriesViewAnlysispage({Key? key}) : super(key: key);
   

  @override
  Widget build(BuildContext context) {
    // Test ID ko retrieve karein (ya pass kiya hua argument use karein)
    var testId = controller.testSeriesId;  // Replace with actual test ID
    var marks = controller.controller1.marksMap[testId] ?? 0.0;

  // @override
  // Widget build(BuildContext context) {
    //  final Testseries testSeries = Get.arguments as Testseries;
    return MaterialApp(
      // color: Vx.white,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: HexColor('#0D2735'),
            title: Text(
              'Algorithm Weekly Test${controller.finalMarks} ',
              style: AppStyle.txtPoppinsSemiBold18White90002,
            ).centered(),
            bottom: TabBar(
              labelColor: Colors.white,
              labelStyle: AppStyle.txtPoppinsSemiBold18White90002,
              indicatorColor: Colors.yellow,
              tabs: const [
                Tab(text: 'Analysis'),
                Tab(text: 'Solution'),
                Tab(text: 'Leadership'),
              ],
            ),
          ),
          body: Padding(
            padding: EdgeInsets.all(28.0),
            child: TabBarView(
              children: [
                WidgetScreenOne(controller),
                TestSeriesSolution(),
                WidgetScreenThree(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget WidgetScreenOne(controller) {
  return LayoutBuilder(
    builder: (context, constraints) {
      bool isMobile = constraints.maxWidth < 600;

      if (isMobile) {
        return Column(
          children: [
            Container(
              height: 90,
              color: HexColor('#0D2735'),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        Assets.images.speedometer.path,
                        height: 25,
                        width: 25,
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          "Score",
                          style: AppStyle.txtPoppinsSemiBold14White90002,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "12",
                          style: AppStyle.txtPoppinsSemiBold14White90002,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ).p(8),
                  SizedBox(height: 14),
                  Container(
                    alignment: Alignment.bottomCenter,
                    color: HexColor("#003D5E"),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Average Score: ${1220}",
                            style: AppStyle.txtPoppinsMedium12White90002,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        VerticalDivider(
                          width: 16,
                          color: Colors.white,
                        ),
                        Expanded(
                          child: Text(
                            "Best Score: ${1220}",
                            style: AppStyle.txtPoppinsMedium12White90002,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ).p(8).color(HexColor("#003D5E")),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Container(alignment: Alignment.center,
              height: 90,
              color: HexColor('#0D2735'),
              child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,

                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(width: 20),
                      Image.asset(
                        Assets.images.rank.path,
                        height: 25,
                        width: 25,
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: Text(
                          "Rank",
                          style: AppStyle.txtPoppinsSemiBold14White90002,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Text(
                        "${controller.viewAnslist.length}/1200",
                        style: AppStyle.txtPoppinsSemiBold14White90002,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        );
      } else {
        return Container(
          width: 400,
          alignment: Alignment.topCenter,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 90,
                color: HexColor('#0D2735'),
                width: Get.width / 2 - 15,
                child: Row(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          Assets.images.speedometer.path,
                          height: 25,
                          width: 25,
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            "Score",
                            style: AppStyle.txtPoppinsSemiBold14White90002,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "12",
                            style: AppStyle.txtPoppinsSemiBold14White90002,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ).p(8),
                    SizedBox(height: 14),
                    Container(
                      alignment: Alignment.bottomCenter,
                      color: HexColor("#003D5E"),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Average Score: ${1220}",
                              style: AppStyle.txtPoppinsMedium12White90002,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          VerticalDivider(
                            width: 16,
                            color: Colors.white,
                          ),
                          Expanded(
                            child: Text(
                              "Best Score: ${1220}",
                              style: AppStyle.txtPoppinsMedium12White90002,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ).p(8).color(HexColor("#003D5E")),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 30),
              Container(
                height: 90,
                color: HexColor('#0D2735'),
                width: Get.width / 2 - 15,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(width: 20),
                    Image.asset(
                      Assets.images.rank.path,
                      height: 25,
                      width: 25,
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: Text(
                        "Rank",
                        style: AppStyle.txtPoppinsSemiBold14White90002,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Text(
                      "${controller.viewAnslist.length}/1200",
                      style: AppStyle.txtPoppinsSemiBold14White90002,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ).expand(),
            ],
          ),
        );
      }
    },
  );
}

Widget WidgetScreenThree() {
  return Container(
    child: Text("Leadership"),
  );
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
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        Get.back();
      },
    ),
  );
}