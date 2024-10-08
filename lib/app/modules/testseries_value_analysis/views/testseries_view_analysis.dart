// import 'package:encrypt/encrypt.dart';
import 'package:exam_prep_tool/app/data/modal/test_series/weekley_testSeries_modal.dart';
import 'package:exam_prep_tool/app/modules/testseries_value_analysis/controllers/testseries_view_analysis_controller.dart';
import 'package:exam_prep_tool/app/modules/testseries_value_analysis/views/testseries_solution_page.dart';
import 'package:exam_prep_tool/app/routes/app_pages.dart';
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
    // Test ID ko retrieve karein (ya pass kiya hua argument use karein)
    var testId = controller.testSeriesId; // Replace with actual test ID
    var marks = controller.controller1.marksMap[testId] ?? 0.0;

    // @override
    // Widget build(BuildContext context) {
    //  final Testseries testSeries = Get.arguments as Testseries;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: buildAppbar(controller),
        body: Padding(
          padding: EdgeInsets.all(28.0),
          child: TabBarView(
            children: [
              WidgetScreenOne(controller, context),
              TestSeriesSolution(),
              // WidgetScreenThree(),
            ],
          ),
        ),
      ),
    );
  }

  Widget WidgetScreenOne(controller, context) {
    double screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth < 600) {
      // Width is less than 600, show the Column layout
      return Column(
        children: [
          _buildScoreContainer(),
          SizedBox(height: 30),
          _buildRankContainer(controller),
        ],
      );
    } else {
      // Width is 600 or more, show the Row layout
      return Container(
        width: 300,
        alignment: Alignment.topCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildScoreContainer(width: screenWidth / 2.5 - 15),
            SizedBox(width: 30),
            _buildRankContainer(controller, width: screenWidth / 2.5 - 15),
          ],
        ),
      );
    }
  }

  Widget _buildScoreContainer({double? width}) {
    return Obx(() {
      // Check if the list is empty
      if (controller.viewAnslist.isEmpty) {
        return Center(
          child: Text(
            'No data available',
            style: AppStyle.txtPoppinsSemiBold14White90002,
          ),
        );
      }

    return Container(
      height: 90,
      color: HexColor('#0D2735'),
      width: width,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
        children: List.generate(controller.viewAnslist.length, (index) {
            var answerItem = controller.viewAnslist[index];
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
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
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Expanded(
                  child: Text(
                    "Marks: ${answerItem.marksGot?.toStringAsFixed(2) ?? '0'}", // Display Marks Got
                    style: AppStyle.txtPoppinsSemiBold14White90002,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ).p(8);
        }),
        ),
      );
    });
  }

  Widget _buildRankContainer(controller, {double? width}) {
    return Obx(() {
      // Check if the list is empty
      if (controller.viewAnslist.isEmpty) {
        return Center(
          child: Text(
            'No data available',
            style: AppStyle.txtPoppinsSemiBold14White90002,
          ),
        );
      }

    return Container(
      height: 90,
      color: HexColor('#0D2735'),
      width: width,
      alignment: Alignment.center,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
        children: List.generate(controller.viewAnslist.length, (index) {
            var answerItem = controller.viewAnslist[index];
             return Row(
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
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(width: 40),
                  Expanded(
                    child: Text(
                      "${answerItem.rank?.toString()}", // Display only the integer part of the rank
                      style: AppStyle.txtPoppinsSemiBold14White90002,
                      textAlign: TextAlign.center,
                      ),
                  ),
                ],
              
            );

          
       }),
        ),
      );
    });
  }
          // Return empty space if testId or questions are null
     


  Widget WidgetScreenThree() {
    return Container(
      child: Text("Leadership"),
    );
  }

  buildAppbar(controller) {
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
   
  Get.offAndToNamed(Routes.TESTSEARIS);


            // Get.back(result: {
            //   // 'testSeriesId':
            //   //     controller.testSeriesId, // Ensure correct value is passed
            //   // 'finalMarks': controller
            //   //     .testSeriesId, // Ensure finalMarks is correctly passed
            // });
          },
        ),
        bottom: TabBar(
          unselectedLabelColor: Colors.black,
          labelColor: Colors.white,
          labelStyle: AppStyle.txtPoppinsSemiBold18White90002,
          indicatorColor: Colors.yellow,
          tabs: const [
            Tab(text: 'Analysis'),
            Tab(text: 'Solution'),
            // Tab(text: 'Leadership'),
          ],
        ));
  }
}
