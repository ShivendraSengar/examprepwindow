import 'package:exam_prep_tool/app/data/modal/categories_filterdata.dart';
import 'package:exam_prep_tool/app/data/modal/course.dart';
import 'package:exam_prep_tool/app/routes/app_pages.dart';
import 'package:exam_prep_tool/app/themes/app_style.dart';
import 'package:exam_prep_tool/app/utils/const.dart';
import 'package:exam_prep_tool/app/widgets/custom_colors.dart';
import 'package:exam_prep_tool/app/widgets/custom_shimmer.dart';
import 'package:exam_prep_tool/app/widgets/custom_widgets.dart';
import 'package:exam_prep_tool/gen/assets.gen.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/more_courses_controller.dart';
import 'categories_lists.dart';

class MoreCoursesView extends GetView<MoreCoursesController> {
  const MoreCoursesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    // Define breakpoints for different screen sizes
    const double mobileBreakpoint = 600;
    const double tabletBreakpoint = 1024;

    // Determine the layout based on the screen width
    if (screenWidth < mobileBreakpoint) {
      // Mobile layout
      return Mobileview();
    } else if (screenWidth < tabletBreakpoint) {
      // Tablet layout
      return Mobileview();
    } else {
      // Desktop layout

      return Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(gradient: lineargrdient),
          child: SafeArea(
            child: Scaffold(
              appBar: buildAppbar(),
              body: Obx(() {
                return Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(gradient: lineargrdient),
                  child: Center(
                    child: Container(
                      alignment: Alignment.center,
                      width: 1200,
                      height: Get.height,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 250,
                            height: Get.height,
                            child: ListView.builder(
                              shrinkWrap: true, // Add this line
                              scrollDirection:
                                  Axis.vertical, // Change this line
                              //gridDelegate:
                              //    const SliverGridDelegateWithFixedCrossAxisCount(
                              //  crossAxisCount: 4,
                              //  crossAxisSpacing: 2.0,
                              //  mainAxisSpacing: 8.0,
                              //  childAspectRatio: 9.9 / 3,
                              //),

                              itemCount: controller.categorieslist.length +
                                  1, // Add 1 for "All Courses" item
                              itemBuilder: (BuildContext ctx, index) {
                                if (index == 0) {
                                  return Obx(() => InkWell(
                                        onTap: () {
                                          controller.categoryId.value = '';
                                          controller.clearCategoriesList();
                                          print(
                                              "filter data list${controller.clearCategoriesList}");
                                          controller.getFilterList();
                                        },
                                        child: Container(
                                          height: 45,
                                          width: 150,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: HexColor('#0D2735'),
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment
                                                .start, // Center the content vertically
                                            children: [
                                              SizedBox(width: 18),
                                              Image.asset(
                                                controller.images[0],
                                                height: 30,
                                                width: 30,
                                              ),
                                              SizedBox(width: 5),
                                              SizedBox(
                                                height: 19,
                                                child: VerticalDivider(
                                                  color: Colors.white,
                                                  width: 6,
                                                ),
                                              ),
                                              SizedBox(width: 5),
                                              Text(
                                                "All Courses",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ],
                                          ),
                                        ).p(5),
                                      ));
                                } else {
                                  var data =
                                      controller.categorieslist[index - 1];
                                  return InkWell(
                                    onTap: () {
                                      controller.categoryId.value =
                                          data.id.toString();
                                      controller.getFilterList();
                                      print(data.id);
                                    },
                                    child: Container(
                                      height: 45,
                                      width: 150,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: HexColor('#0D2735'),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment
                                            .start, // Center the content vertically
                                        children: [
                                          SizedBox(width: 18),
                                          Image.asset(
                                            controller.images[index - 1],
                                            height: 30,
                                            width: 30,
                                          ),
                                          SizedBox(width: 5),
                                          SizedBox(
                                            height: 19,
                                            child: VerticalDivider(
                                              color: Colors.white,
                                              width: 6,
                                            ),
                                          ),
                                          SizedBox(width: 5),
                                          Text(
                                            data.category.toString(),
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ).p(5),
                                  );
                                }
                              },
                            ),
                          ).p(15),
                          //40.widthBox,
                          //Obx(() =>
                          //    Text(controller.filterlist.length.toString())),
                          controller.isLoading.isTrue
                              ? BuildShimmer(
                                  child: Column(
                                    children: [
                                      buildSkeltion(),
                                      buildSkeltion(),
                                      buildSkeltion(),
                                      buildSkeltion(),
                                    ],
                                  ),
                                ).w(300)
                              : allCourses().w(900).h(900)
                        ],
                      ),
                    ),
                  ),
                );
              }).p(3),
            ),
          ));
    }
  }

//////////

  ///
  Widget allCourses() {
    return Container(
      height: 900,
      //color: const Color.fromARGB(255, 64, 214, 255),
      child: Obx(() {
        final filteredData = controller.filterlist
            .where((coursedetails) => coursedetails.purchased != "yes")
            .toList();
        // Check if the filtered data is empty
        if (filteredData.isEmpty) {
          // Show "No courses available" message
          return Center(
            child: Text(
              "No courses available in this category.",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          );
        }

        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 4.0,
            mainAxisSpacing: 20.0,
            childAspectRatio: 2 / 3.4,
          ),
          itemCount: filteredData.length,
          padding: const EdgeInsets.only(bottom: 100),
          itemBuilder: (context, index) {
            var coursedetails = filteredData[index];
            // Check if a discount is applicable

            List<DiscountCodes>? discountCodes = coursedetails.discountCodes;
            var offercodes;

            if (discountCodes != null &&
                index >= 0 &&
                index < discountCodes.length) {
              offercodes = discountCodes[index];
            } else {
              // Handle the case where the index is out of bounds
              offercodes = null; // Or any other appropriate handling
            }
            int originalCost = int.parse(coursedetails.cost ?? '0');
            int discountPrice = coursedetails.discountPrice ?? 0;

            int discountedCost = discountPrice;

            String discountedCostString = discountedCost
                .toStringAsFixed(2); // Convert to string with 2 decimal places
            final bool isDiscountValid =
                controller.isDiscountValid(coursedetails.discountValidity);
            // final int price = isDiscountValid ? (discountedCost ?? 0) : (coursedetails.cost.toString() ?? 0);

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
                  : Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: cardcolor,
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
                              SizedBox(
                                  height: 120,
                                  width: double.infinity,
                                  child: Image.network(
                                    imageUrl + coursedetails.image.toString(),
                                    errorBuilder: (BuildContext context,
                                        Object exception,
                                        StackTrace? stackTrace) {
                                      return Image.asset(
                                        'images/placeholder.jpeg', // Replace 'assets/placeholder_image.png' with your placeholder image path
                                        fit: BoxFit.fill,
                                      );
                                    },
                                    fit: BoxFit.fill,
                                  )),
                              const SizedBox(height: 15.0),
                              Center(
                                child: Text(
                                  coursedetails.title
                                      .toString(), // Adjust 'maxLength' to your desired character limit
                                  maxLines: 1,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      overflow: TextOverflow.ellipsis),
                                  textAlign: TextAlign.center,
                                ).centered(),
                              )
                                  .paddingSymmetric(horizontal: 10)
                                  .w(120)
                                  .centered(),
                              10.heightBox,
                              buildCard(
                                "course Id".toUpperCase(),
                                coursedetails.number.toString().toUpperCase(),
                              ),
                              buildCard(
                                "duration".toUpperCase(),
                                "${coursedetails.durationInMonths.toString()} days",
                              ),
                              //buildCard("off".toUpperCase(),
                              //    "${discountCodes?.first.discountPercent ?? ""}"),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Amount",
                                    style: TextStyle(color: Vx.white),
                                  ),
                                  if (coursedetails.discount == "yes")
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        //Text(isDiscountValid
                                        //    ? 'Discounted Price: $discountedCost'
                                        //    : 'Actual Cost: ${coursedetails.cost.toString()}'),
                                        Text(
                                          "Rs. ${coursedetails.cost.toString()}",
                                          style: const TextStyle(
                                              color: Vx.white,
                                              decoration:
                                                  TextDecoration.lineThrough,
                                              decorationColor: Colors.white),
                                        ),
                                        Text(
                                          isDiscountValid
                                              ? 'Rs. $discountedCost'
                                              : 'Rs. ${coursedetails.cost.toString()}',
                                          style: const TextStyle(
                                              color: Vx.green500),
                                        ),
                                      ],
                                    )
                                  else
                                    Text(
                                      "Rs. ${coursedetails.cost.toString()}",
                                      style: const TextStyle(color: Vx.white),
                                    ),
                                ],
                              ).p(15),
                              5.heightBox,
                              if (coursedetails.discount == "yes")
                                Row(
                                  children: [
                                    8.widthBox,
                                    const Icon(
                                      Icons.alarm,
                                      size: 20,
                                      color: Colors.yellow,
                                    ),
                                    Text(
                                      " ${coursedetails.discountValidity != null ? controller.getDaysUntilDate(coursedetails.discountValidity) : 'N/A'} days left"
                                          .toUpperCase(),
                                      style: const TextStyle(
                                          color: Colors.yellow, fontSize: 14),
                                    ),
                                  ],
                                ),
                              14.heightBox,
                            ],
                          ),
                        ).paddingSymmetric(horizontal: 8),
                        Positioned(
                          left: 50,
                          right: 50,
                          bottom: -15,
                          child: InkWell(
                            onTap: () {
                              print("object${coursedetails.rating}");
                              print("purchase${coursedetails.purchased}");

                              Get.toNamed(Routes.COURSE_SUBSCRIBE, arguments: [
                                coursedetails.image,
                                coursedetails.title,
                                coursedetails.number,
                                coursedetails.discount == "yes"
                                    ? '$discountedCost'
                                    : '${coursedetails.cost.toString()}',
                                coursedetails.durationInMonths,
                                coursedetails.description,
                                coursedetails.id,

                                coursedetails.courseType,
                                // offercodes?.categoryIds,
                                offercodes?.code ?? "",
                                offercodes?.discountPercent ?? "",
                                offercodes?.endDate ?? "",
                                coursedetails.exam?.id,
                                print("exam idddd${coursedetails.exam?.id}"),

                                // offercodes?.offerName,
                              ]);
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 40,
                              decoration: BoxDecoration(
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black,
                                    blurRadius: 5.0,
                                    spreadRadius: 0.0,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(30),
                                ),
                                gradient: buttonColor,
                              ),
                              child: const Text(
                                'View more',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        )
                      ],
                    ).p(5);
            });
          },
        ).marginOnly(bottom: 20);
      }),
    ).marginOnly(bottom: 0);
  }

  Widget buildCard(text, textid) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          alignment: Alignment.center,
          // decoration: BoxDecoration(color: Vx.white),
          child: Text(
            text,
            style: AppStyle.txtPoppinsMedium12White90002,
          ),
        ),
        //25.widthBox,
        Container(
          width: 70,
          alignment: Alignment.centerRight,
          // decoration: BoxDecoration(color: Vx.white),
          child: Text(
            textid,
            overflow: TextOverflow.ellipsis,

            style: const TextStyle(
              color: Colors.white,
            ),

            //textAlign: TextAlign.justify,
          ),
        ),
      ],
    ).paddingSymmetric(horizontal: 15, vertical: 8);
  }

  buildAppbar() {
    return AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        title: GestureDetector(
          onTap: () {
            //controller.data.categorieslist.clear();
          },
          child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Image.asset(
              Assets.images.headerLogo.path,
              height: 40,
              // color: Colors.white,
              width: 110,
              fit: BoxFit.contain,
            ),
            "Exam Prep Tool"
                .text
                .size(20)
                .textStyle(AppStyle.txtPoppinsSemiBold16White90002)
                .color(Vx.white)
                .make(),
          ]),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(gradient: lineargrdient),
        ));
  }
}
