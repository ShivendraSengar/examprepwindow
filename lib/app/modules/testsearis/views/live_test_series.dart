import 'package:exam_prep_tool/app/modules/testsearis/controllers/testsearis_controller.dart';
import 'package:exam_prep_tool/app/routes/app_pages.dart';
import 'package:exam_prep_tool/app/themes/app_style.dart';
import 'package:exam_prep_tool/app/widgets/custom_alert_dialog.dart';
import 'package:exam_prep_tool/app/widgets/custom_shimmer.dart';
import 'package:exam_prep_tool/app/widgets/custom_widgets.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:velocity_x/velocity_x.dart';

class LiveTestSeries extends GetView<TestsearisController> {
  const LiveTestSeries({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Obx(() {
            return Container(
              //width: 300,
              height: Get.height,
              child: allCourses(),
            );
          }),
          //300.heightBox
        ],
      ),
    );
  }
// Toggle between true and false based on user action.

  Widget allCourses() {
    return Container(
      width: Get.width,
      height: 110,
      alignment: Alignment.topCenter,
      //color: const Color.fromARGB(255, 64, 214, 255),
      child: 
      controller.livetestSeries.isEmpty
                                  ? CustomAlertBox(
                                      title: "No data found",
                                      message: "",
                                      onOkPressed: () {
                                        controller.isVisible.value = false;
                                      })
                                  : 
                                       GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 4.0,
            mainAxisSpacing: 20.0,
            childAspectRatio: 3 / 1.4,
          ),
          itemCount: controller.livetestSeries.length,

          //padding: const EdgeInsets.only(bottom: 10),
          itemBuilder: (context, index) {
            var data = controller.livetestSeries[index];
            return Obx(
              () {
                return controller.isLoading.isTrue
                    ? BuildShimmer(
                        child: Column(
                          children: [
                            buildSkeltion(),
                            buildSkeltion(),
                            buildSkeltion(),
                            buildSkeltion(),
                          ],
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          // Get.toNamed(
                          //   Routes.TESTSERIES_VALUE_ANALYSIS,
                          //   arguments: data,
                          // );
                        },
                        child: Container(
                          width: 350,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            //gradient: cardcolor,
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black,
                                blurRadius: 5.0,
                                spreadRadius: 0.0,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const SizedBox(height: 15.0),
                              Center(
                                child: Text(
                                  data.testName
                                      .toString(), // Adjust 'maxLength' to your desired character limit
                                  maxLines: 1,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      overflow: TextOverflow.ellipsis),
                                  textAlign: TextAlign.center,
                                ).centered(),
                              )
                                  .paddingSymmetric(horizontal: 10)
                                  .w(300)
                                  .centered(),
                              10.heightBox,
                              Container(
                                height: 40,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.note_alt,
                                          color: Vx.gray200,
                                        ),
                                        2.widthBox,
                                        Text(
                                          data.questions!.length.toString(),
                                          style: const TextStyle(
                                            color: Vx.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 15, horizontal: 8.0),
                                      child: VerticalDivider(
                                        width: .1,
                                        thickness: 1,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    const Text(
                                      "marks",
                                      style: TextStyle(
                                        color: Vx.black,
                                      ),
                                    ),
                                    5.widthBox,
                                    Text(
                                      data.totalMarks.toString(),
                                      style: const TextStyle(
                                        color: Vx.black,
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.symmetric(
                                        vertical: 15,
                                        horizontal: 8.0,
                                      ),
                                      child: VerticalDivider(
                                        width: .1,
                                        thickness: 1,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Text(
                                      data.timeData!.duration.toString(),
                                      style: const TextStyle(
                                        color: Vx.black,
                                      ),
                                    ),
                                    5.widthBox,
                                    const Text(
                                      "mins",
                                      style: TextStyle(
                                        color: Vx.black,
                                      ),
                                    ),
                                  ],
                                ).w(700),
                              ),
                              buildCard(data.createdAt.toString().toUpperCase(),
                                      "Lang - English")
                                  .w(700)
                                  .p(8),
                              13.heightBox,
                              //////////////////////////////////////////////////////////////////////////////////////////////////////////
                              ////////////////////////
InkWell(
  onTap: () {
    if (data.status == "live") {
      bool isStarted = controller.testStates[index] ?? false;
      controller.updateTestState(index, !isStarted);
      
      // Navigate to the appropriate route
      Get.toNamed(
        isStarted
            ? Routes.TESTSERIES_VALUE_ANALYSIS
            : Routes.TESTSERIES_INSTRUCTION,
        arguments: data,
      );
    } else {
      // Show a message or keep the user on the same page
      // Get.snackbar(
      //   "Test Series",
      //   "The test series is not live.",
      //   snackPosition: SnackPosition.BOTTOM,
      // );
    }
  },
  child: Container(
    
    alignment: Alignment.center,
    height: 45,
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.all(
        Radius.circular(15),
      ),
      color: Colors.green,
    ),
    child: Text(
      // अगर status 'live' है तो 'Start' दिखाएं, अन्यथा status दिखाएं
      data.status == "live" ? "Start" : "${data.status}",
      style: const TextStyle(
        color: Colors.black,
      ),
      textAlign: TextAlign.center,
    ),
  ),
).p(8),

                          ]),
                        ).paddingSymmetric(horizontal: 8),
                      );
              },
            );
          }),
    ).marginOnly(bottom: 0);
  }

  Widget buildCard(text, textid) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(
              Icons.watch_later,
              color: Colors.grey.shade200,
            ),
            5.widthBox,
            Container(
              alignment: Alignment.center,
              // decoration: BoxDecoration(color: Vx.black),
              child: Text(
                text,
                style: AppStyle.txtPoppinsSemiBold14Black,
              ),
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 8.0,
          ),
          child: VerticalDivider(
            width: .1,
            thickness: 1,
            color: Colors.grey,
          ),
        ),
        //25.widthBox,
        Container(
          alignment: Alignment.center,
          //decoration: BoxDecoration(
          //    color: Color.fromARGB(255, 3, 179, 64),
          //    borderRadius: BorderRadius.circular(15)),
          child: Text(
            textid,
            overflow: TextOverflow.ellipsis,

            style: const TextStyle(
              color: Colors.black,
            ),

            //textAlign: TextAlign.justify,
          ),
        ),
      ],
    ).paddingSymmetric(horizontal: 15, vertical: 8);
  }
}
