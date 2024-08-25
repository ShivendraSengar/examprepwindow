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
  
  const TestseriesViewAnlysispage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
  //  final Testseries testSeries = Get.arguments as Testseries;
    return MaterialApp(color: Vx.white,
        home: DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: HexColor('#0D2735'),
          title: Text(
            'Algorithm Weekely Test ',
            style: AppStyle.txtPoppinsSemiBold18White90002,
          ).centered(),
          bottom: TabBar(
              labelColor: Colors.white,
              labelStyle: AppStyle.txtPoppinsSemiBold18White90002,
              indicatorColor: Colors.yellow,
              // tabAlignment: TabAlignment.values,

              tabs: const [
                Tab(
                  text: 'Analysis',
                ),
                Tab(text: 'Solution'),
                Tab(text: 'Leadership'),
              ]),
        ),
        body: Padding(
          padding:  EdgeInsets.all(28.0),
          child: TabBarView(children: [
            WidgetScreenOne(controller),
            TestSeriesSolution(),
            
            // WidgetScreenTwo(controller),
            WidgetScreenThree()
          ]),
        ),
      ),
    ));
  }
}

 WidgetScreenOne(controller){
  return Container(
    width: 400,
    alignment: Alignment.topCenter,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 90,
          color: HexColor('#0D2735'),
          width: Get.width / 2 - 15, // Padding के लिए Adjustment
          child: Column(
            children: [
      // Text(  "${controller.receivedMarks[1].toString}/1200"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    Assets.images.speedometer.path,
                    height: 25,
                    width: 25,
                  ),
                  10.widthBox,
                  Expanded(
                    child: Text(
                      "Score",
                      style: AppStyle.txtPoppinsSemiBold14White90002,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "${controller.receivedMarks[0].toStringAsFixed(2)}/1200",
                      // "12",
                      style: AppStyle.txtPoppinsSemiBold14White90002,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ).p(8),
              14.heightBox,
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
                    Container(
                      height: 19,
                      child: VerticalDivider(
                        width: 16,
                        color: Colors.white,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "Best Score: ${1220}",
                        style: AppStyle.txtPoppinsMedium12White90002,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ).p(8).box.make().color(HexColor("#003D5E")),
              ),
            ],
          ),
        ),
        30.widthBox,
        Container(
          height: 90,
          color: HexColor('#0D2735'),
          width: Get.width / 2 - 15, // Padding के लिए Adjustment
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [20.widthBox,
              Image.asset(
                Assets.images.rank.path,
                height: 25,
                width: 25,
              ),
              20.widthBox,
              Text(
                "Rank",
                style: AppStyle.txtPoppinsSemiBold14White90002,
                textAlign: TextAlign.center,
              ),
              Text(
                "747/1200",
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




WidgetScreenThree() {
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
