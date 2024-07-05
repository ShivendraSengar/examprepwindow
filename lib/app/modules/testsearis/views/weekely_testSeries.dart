import 'package:exam_prep_tool/app/modules/testsearis/controllers/testsearis_controller.dart';
import 'package:exam_prep_tool/app/routes/app_pages.dart';
import 'package:exam_prep_tool/app/themes/app_style.dart';
import 'package:exam_prep_tool/app/widgets/custom_colors.dart';
import 'package:exam_prep_tool/app/widgets/custom_shimmer.dart';
import 'package:exam_prep_tool/app/widgets/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:velocity_x/velocity_x.dart';

class WeeklyTest extends GetView<TestsearisController> {
  const WeeklyTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: allCourses(),
    );
  }

  Widget allCourses() {
    return Container(
      width: 600,
      height: 120,
      alignment: Alignment.topCenter,
      //color: const Color.fromARGB(255, 64, 214, 255),
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 4.0,
            mainAxisSpacing: 20.0,
            childAspectRatio: 3 / 1.6,
          ),
          itemCount: 30,
          //padding: const EdgeInsets.only(bottom: 10),
          itemBuilder: (context, index) {
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
                    : Container(
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
                              child: const Text(
                                "Algorithms Weekly Test", // Adjust 'maxLength' to your desired character limit
                                maxLines: 1,
                                style: TextStyle(
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
                                      const Text(
                                        "data",
                                        style: TextStyle(
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
                                  const Text(
                                    "55",
                                    style: TextStyle(
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
                                  const Text(
                                    "99",
                                    style: TextStyle(
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
                            buildCard("18 sep, 1999".toUpperCase(),
                                    "Language - English'")
                                .w(700)
                                .p(8),
                            18.heightBox,
                            InkWell(
                              onTap: () {
                                //print("object${coursedetails.rating}");
                                //print("purchase${coursedetails.purchased}");

                                Get.toNamed(Routes.TESTSERIES_INSTRUCTION

                                    //print("exam idddd${coursedetails.exam?.id}"),

                                    // offercodes?.offerName,
                                    );
                              },
                              child: Container(
                                //padding: EdgeInsets.symmetric(horizontal: 8),
                                alignment: Alignment.center,
                                height: 45,
                                decoration: const BoxDecoration(
                                    //boxShadow: [
                                    //  BoxShadow(
                                    //    color: Colors.black,
                                    //    blurRadius: 5.0,
                                    //    spreadRadius: 0.0,
                                    //    offset: Offset(0, 2),
                                    //  ),
                                    //],
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(15),
                                    ),
                                    //gradient: buttonColor,
                                    color: Colors.green),
                                child: const Text(
                                  'Start',
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ).paddingSymmetric(horizontal: 8);
              },
            ).marginOnly(bottom: 0);
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
