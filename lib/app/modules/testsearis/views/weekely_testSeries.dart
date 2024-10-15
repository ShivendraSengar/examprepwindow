import 'package:exam_prep_tool/app/data/modal/buycourses_modal.dart';
import 'package:exam_prep_tool/app/modules/testsearis/controllers/testsearis_controller.dart';
import 'package:exam_prep_tool/app/routes/app_pages.dart';
import 'package:exam_prep_tool/app/themes/app_style.dart';
import 'package:exam_prep_tool/app/widgets/custom_alert_dialog.dart';
import 'package:exam_prep_tool/app/widgets/custom_colors.dart';
import 'package:exam_prep_tool/app/widgets/custom_shimmer.dart';
import 'package:exam_prep_tool/app/widgets/custom_widgets.dart';
import 'package:exam_prep_tool/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:velocity_x/velocity_x.dart';

class WeeklyTest extends GetView<TestsearisController> {
  WeeklyTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
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
          : LayoutBuilder(
              builder: (context, constraints) {
                bool isSmallScreen = constraints.maxWidth < 600;

                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              controller.updateFilter('attempted');
                            },
                            child: const Text("Attempted"),
                          ),
                          18.widthBox,
                          ElevatedButton(
                            onPressed: () {
                              controller.updateFilter('notStarted');
                            },
                            child: const Text("Not Attempted"),
                          ),
                        ],
                      ).paddingSymmetric(horizontal: 16, vertical: 10),

Obx(() {
                      return Container(
                        //width: 300,
                        height: Get.height,
                        child: controller.selectedFilter.value == "attempted"
                            ? 
                     

                      Container(
                          // Set a minimum height or use MediaQuery for dynamic height
                          constraints: BoxConstraints(
                            minHeight: constraints.maxHeight,
                          ),
                          height: 110,
                          child: GridView.builder(
                            shrinkWrap: true,
                            physics:
                                const NeverScrollableScrollPhysics(), // Disable GridView's own scrolling
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: isSmallScreen ? 1 : 3,
                              crossAxisSpacing: 4.0,
                              mainAxisSpacing: 20.0,
                              childAspectRatio:
                                  isSmallScreen ? 3 / 1.5 : 3 / 1.2,
                            ),
                            itemCount: controller.filteredTestSeries.length,
                            itemBuilder: (context, index) {
                              var data = controller.filteredTestSeries[index];
                              return buildTestCard(
                                  context, data, index, isSmallScreen);
                            },
                          ),
                        ): allTest(isSmallScreen));
                      }),
                    ],
                  ),
                );
              },
            );
    });
  }
  
// ///////////////////////////////////////////// all tests
  Widget allTest(bool isSmallScreen) {
    return Container(
      width: Get.width,
      height: 90,
      alignment: Alignment.topCenter,
      //color: const Color.fromARGB(255, 64, 214, 255),
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: isSmallScreen ? 1 : 3,
            crossAxisSpacing: 4.0,
            mainAxisSpacing: 20.0,
            childAspectRatio: isSmallScreen ? 3 / 1.5 : 3 / 1.2,
          ),
          itemCount: controller.testSeries.length,

          //padding: const EdgeInsets.only(bottom: 10),
          itemBuilder: (context, index) {
            var data = controller.testSeries[index];
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
                              const SizedBox(height: 8.0),
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
                              8.heightBox,
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
                                          Icons.question_answer_sharp,
                                          color: Vx.gray200,
                                        ),
                                        2.widthBox,
                                        Text(
                                          "${data.questions!.length.toString()} ques",
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
                                    Text(
                                      "${data.totalMarks.toString()} marks",
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
                                      "${data.timeData!.duration.toString()} mins ",
                                      style: const TextStyle(
                                        color: Vx.black,
                                      ),
                                    ),
                                  ],
                                ).w(700),
                              ),

                              buildCard(
                                      "${controller.formatDateTime(data.timeData!.rawStartDate.toString())}",
                                      "Lang - English")
                                  .w(700)
                                  .p(8),
                              10.heightBox,
                              //////////////////////////////////////////////////////////////////////////////////////////////////////////
                              ////////////////////////

                              InkWell(
                                onTap: () {
                                  bool isStarted =
                                      controller.testStates[index] ?? false;
                                  controller.updateTestState(index, !isStarted);
                                  Get.toNamed(
                                    isStarted
                                        ? Routes.TESTSERIES_VALUE_ANALYSIS
                                        : Routes.TESTSERIES_INSTRUCTION,
                                    arguments: data,
                                  );
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 45,
                                  decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(15),
                                      ),
                                      color: Colors.green),
                                  child: const Text(
                                    "Start",
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ).paddingSymmetric(horizontal: 8),
                              ),
                            ],
                          ),
                        ).paddingSymmetric(horizontal: 8),
                      );
              },
            );
          }),
    ).marginOnly(bottom: 0);
  }

  Widget buildTestCard(
      BuildContext context, data, int index, bool isSmallScreen) {
    return GestureDetector(
      onTap: () {
        bool isStarted = controller.testStates[index] ?? false;
        controller.updateTestState(index, !isStarted);
        Get.toNamed(
          isStarted
              ? Routes.TESTSERIES_VALUE_ANALYSIS
              : Routes.TESTSERIES_INSTRUCTION,
          arguments: data,
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 5.0,
              spreadRadius: 0.0,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10.0),
            Center(
              child: Text(
                data.testName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 8.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Example icons and texts, adjust as per your data
                  Row(
                    children: [
                      const Icon(Icons.question_answer_sharp,
                          color: Colors.grey),
                      const SizedBox(width: 2),
                      Text("${data.questions.length} ques"),
                    ],
                  ),
                  const VerticalDivider(
                    width: 20,
                    thickness: 1,
                    color: Colors.grey,
                  ),
                  Text("${data.totalMarks} marks"),
                  const VerticalDivider(
                    width: 20,
                    thickness: 1,
                    color: Colors.grey,
                  ),
                  Text("${data.timeData.duration} mins"),
                ],
              ),
            ),
            const SizedBox(height: 6.0),
            buildCard(
              controller.formatDateTime(data.timeData.rawStartDate),
              "Lang - English",
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: InkWell(
                onTap: () {
                  controller.selectedFilter.value == "attempted"
                      ? Get.toNamed(Routes.TESTSERIES_VALUE_ANALYSIS,
                          arguments: [index, data.id])
                      : Get.toNamed(
                          Routes.TESTSERIES_INSTRUCTION,
                          arguments: data,
                        );
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.green,
                  ),
                  child: Text(
                    controller.selectedFilter.value == "attempted"
                        ? "View Analysis"
                        : "Start",
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ).paddingSymmetric(horizontal: 8),
              ),
            ),
            const SizedBox(height: 8.0),
          ],
        ),
      ).paddingSymmetric(horizontal: 8),
    );
  }

  Widget buildCard(String text, String textid) {
    return Row(
      children: [
        Row(
          children: [
            Icon(Icons.watch_later, color: Colors.grey.shade200),
            const SizedBox(width: 5),
            Text(
              text,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ],
        ),
        const VerticalDivider(
          width: 20,
          thickness: 1,
          color: Colors.grey,
        ),
        Text(
          textid,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
