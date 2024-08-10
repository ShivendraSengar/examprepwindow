import 'package:exam_prep_tool/app/data/modal/buycourses_modal.dart';
import 'package:exam_prep_tool/app/routes/app_pages.dart';
import 'package:exam_prep_tool/app/themes/app_style.dart';
import 'package:exam_prep_tool/app/utils/const.dart';
import 'package:exam_prep_tool/app/utils/utils.dart';
import 'package:exam_prep_tool/app/widgets/custom_alert_dialog.dart';
import 'package:exam_prep_tool/app/widgets/custom_colors.dart';
import 'package:exam_prep_tool/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:readmore/readmore.dart';
import 'package:velocity_x/velocity_x.dart';
import '../controllers/course_subscribe_controller.dart';
import "package:collection/collection.dart";

class CourseSubscribeView extends GetView<CourseSubscribeController> {
  const CourseSubscribeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // Group items by subject name
    var groupedData = groupBy(controller.vidiolistcorret, (obj) => obj.subject);
    var subjects = groupedData.keys.toList();

// Track whether a subject has been encountered before
    var encounteredSubjects = <String>{};

    return Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(gradient: lineargrdient),
        child: SafeArea(
            child: Scaffold(
                appBar: buildAppbar(),
                body: Container(
                    height: double.infinity,
                    width: double.infinity,
                    decoration: BoxDecoration(gradient: lineargrdient),
                    child: SingleChildScrollView(
                      child: Column(children: [
                        // Text(controller.getdata[].toString()),
                        60.heightBox,
                        Container(
                            width: 600,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            // height: Get.height,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: HexColor("#F3FEFF"),
                              boxShadow: const [
                                BoxShadow(
                                  color:
                                      Colors.black, // Set the shadow color here
                                  blurRadius: 5.0, // Adjust the blur radius
                                  spreadRadius: 0.0, // Adjust the spread radius
                                  offset: Offset(0, 2), // Adjust the offset
                                ),
                              ],
                            ),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                      //clipBehavior: Clip.antiAliasWithSaveLayer,
                                      height: 180,
                                      width: double.infinity,
                                      child: Image.network(
                                        imageUrl + controller.getdata[0],
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
                                  //Container(
                                  //  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  //  height: 180,
                                  //  decoration: BoxDecoration(
                                  //      image: DecorationImage(
                                  //          image: Image.network(imageUrl +
                                  //              controller.getdata[0]),

                                  //          errorBuilder: (BuildContext
                                  //                                      context,
                                  //                                  Object
                                  //                                      exception,
                                  //                                  StackTrace?
                                  //                                      stackTrace) {
                                  //                                return Image
                                  //                                    .asset(
                                  //                                  'images/placeholder.jpeg',)),
                                  //)),
                                  const SizedBox(height: 18.0),
                                  //Text(controller.getdata[8].toString()),
                                  //Text(controller.getdata[9].toString()),
                                  //Text(controller.getdata[10].toString()),
                                  buildCard("course name".toUpperCase(),
                                      controller.getdata[1].toUpperCase()),
                                  buildCard("course ID".toUpperCase(),
                                      controller.getdata[2].toUpperCase()),
                                  buildCard("Amount".toUpperCase(),
                                      "Rs. ${controller.getdata[3]}"),
                                  buildCard(
                                      "Duration".toUpperCase(),
                                      "${controller.getdata[4]} days"
                                          .toUpperCase()),
                                  //Obx(
                                  //  () => Text(controller.vidiolistcorret.length
                                  //      .toString()),
                                  //),
                                  10.heightBox,

                                  //  Obx(() =>    Text(controller.circulumdata.length.toString()),),

                                  Obx(() => Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          buildCircularButton('Overview', 0),
                                          const SizedBox(width: 30),
                                          buildCircularButton('Curriculum', 1),
                                          const SizedBox(width: 30),
                                          buildCircularButton('Lectures', 2),
                                        ],
                                      ).paddingAll(10)),
                                  const SizedBox(height: 20),
                                  Obx(() {
                                    switch (controller.selectedIndex.value) {
                                      case 0:
                                        return buildviewmore();
                                      case 1:
                                        return buildCurriculumContainer();
                                      case 2:
                                        return buildLecture(context);
                                      default:
                                        return Container();
                                    }
                                  }),
                                  //  buildviewmore(),
                                  20.heightBox
                                ])).paddingSymmetric(horizontal: 10),
                        20.heightBox,
                        GestureDetector(
                          onTap: () {
                            print("aaaaaaaa");
                            
                            Get.toNamed(Routes.CUPAN_DISCOUNT,
                                arguments: controller.getdata ?? "");
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: 160,
                            height: 40,
                            decoration: BoxDecoration(
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors
                                        .black, // Set the shadow color here
                                    blurRadius: 5.0, // Adjust the blur radius
                                    spreadRadius:
                                        0.0, // Adjust the spread radius
                                    offset: Offset(0, 2), // Adjust the offset
                                  ),
                                ],
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(30)),
                                gradient:
                                    buttonColor), // Add your overlay color

                            child: Text('SUBSCRIBE',
                                style: AppStyle.txtPoppinsSemiBold14White90002),
                          ),
                        ),
                        70.heightBox
                      ]).paddingSymmetric(horizontal: 20),
                    )))));
  }

  buildCard(name, duration) {
    return Container(
      height: 45,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          color: HexColor("#F3FEFF"),
          boxShadow: [
            BoxShadow(
              color: HexColor("#F3FEFF"), // Set the shadow color here
              blurRadius: 5.0, // Adjust the blur radius
              spreadRadius: 0.0, // Adjust the spread radius
              offset: const Offset(0, 2), // Adjust the offset
            ),
          ],
          border: Border.all(width: 2, color: Colors.grey.shade200),
          borderRadius: BorderRadius.circular(30)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name,
            style: AppStyle.txtPoppinsMedium12darkGray,
          ),
          Text(
            duration,
            style: AppStyle.txtPoppinsMedium12darkGray,
            overflow: TextOverflow.ellipsis,
          ).w(130)
        ],
      ),
    ).paddingSymmetric(horizontal: 10, vertical: 8);
  }

  Widget buildviewmore() {
    return Container(
      height: Get.height,
      
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      decoration: BoxDecoration(
          color: HexColor("#F3FEFF"),
          boxShadow: [
            BoxShadow(
              color: HexColor("#F3FEFF"), // Set the shadow color here
              blurRadius: 5.0, // Adjust the blur radius
              spreadRadius: 0.0, // Adjust the spread radius
              offset: const Offset(0, 2), // Adjust the offset
            ),
          ],
          border: Border.all(width: 2, color: Colors.grey.shade200),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "Course description".toUpperCase(),
            style: AppStyle.txtPoppinsMedium12darkGray,
          ),
          10.heightBox,
          Obx(() {
            final String displayedData = controller.showMore.value
                ? controller.getdata[5]
                : _truncateHtml(controller.getdata[5], 0, 630); // Truncate HTML

            return Html(
              data: displayedData,
            );
          }),
          GestureDetector(
            onTap: () {
              controller.toggleShowMore();
            },
            child: Text(
              controller.showMore.value ? 'Show Less' : 'Read More',
              style: const TextStyle(
                color: Colors.blue,
                // decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      ).p(8),
    ).p(15);
  }

  String _truncateHtml(String html, int startIndex, int endIndex) {
    // Strip HTML tags
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: false);
    String plainText = html.replaceAll(exp, '');

    // Truncate plain text
    if (plainText.length > endIndex) {
      return plainText.substring(startIndex, endIndex) + '...';
    } else {
      return plainText;
    }
  }

  Widget buildCircularButton(String label, int index) {
    return GestureDetector(
      onTap: () {
        controller.selectedIndex.value = index;
      },
      child: Card(
        elevation: 3,
        child: Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: controller.selectedIndex.value == index
                ? const Color.fromARGB(255, 3, 37, 95)
                : HexColor('#efefef'),
            boxShadow: const [
              BoxShadow(
                color: Colors.black, // Set the shadow color here
                blurRadius: 5.0, // Adjust the blur radius
                spreadRadius: 0.0, // Adjust the spread radius
                offset: Offset(0, 2), // Adjust the offset
              ),
            ],
            borderRadius: const BorderRadius.all(Radius.circular(8)),
          ), // Add your overlay color

          // shape: BoxShape.circle,

          child: Text(
            label.toUpperCase(),
            style: TextStyle(
                color: controller.selectedIndex.value == index
                    ? Vx.white
                    : Vx.black,
                fontSize: 14),
          ).paddingSymmetric(horizontal: 1),
        ),
      ),
    );
  }

  Widget buildCurriculumContainer() {
  return Obx(() => Card(
    elevation: 3,
    child: controller.isLoading.value
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : controller.circulumdata.isEmpty
            ? const Center(
                child: Text("No data found"),
              )
            : ListView.builder(
                itemCount: controller.circulumdata.length,
                itemBuilder: (context, index) {
                  var data = controller.circulumdata[index];
                  return ExpansionTile(
                    title: Text(data.heading.toString()),
                    trailing: Icon(controller.isExpanded.value
                        ? Icons.remove
                        : Icons.add),
                    onExpansionChanged: (expanded) {
                      controller.isExpanded.value = expanded;
                    },
                    children: <Widget>[
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: data.subHeading!.length,
                        itemBuilder: (context, subIndex) {
                          var subHeading = data.subHeading![subIndex];
                          return ListTile(
                            leading: const Icon(
                              Icons.circle,
                              size: 8,
                              color: Vx.black,
                            ),
                            title: Text(subHeading.toString()),
                          );
                        },
                      ),
                    ],
                  );
                }),
  ).p(10).h(300));}
  
  Widget buildLecture(BuildContext context) {
    // Group items by subject name
    var groupedData = groupBy(controller.vidiolistcorret, (obj) => obj.subject);
    var subjects = groupedData.keys.toList();

    return Container(
      height: 300,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: subjects.length,
        itemBuilder: (BuildContext context, int index) {
          var subject = subjects[index];
          var subjectData = groupedData[subject];

          return Obx(() {
            bool isExpanded = controller.expandedSubjects[subject] ?? false;

            return ExpansionTile(
              key: PageStorageKey(subject),
              title: Text(subject.toString()),
              initiallyExpanded: isExpanded,
              onExpansionChanged: (bool expanded) {
                controller.expandedSubjects[subject!] = expanded;
              },
              children: subjectData!.map((data) {
                return ListTile(
                  leading: Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white),
                    child: Icon(
                      Icons.play_arrow,
                      color: Colors.red,
                      size: 30,
                    ),
                  ),
                  title: Text(data.title.toString()),
                  subtitle: Text(data.description.toString()),
                ).onInkTap(() {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("Alert"),
                          content: Text("Please subscribe for watch lectures"),
                          actions: <Widget>[
                            Text("OK").onTap(() {
                              Navigator.pop(context);
                            }),
                          ],
                        );
                      });
                });
              }).toList(),
            );
          });
        },
      ),
    );
  }

  buildAppbar() {
    return AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
        title: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
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
        flexibleSpace: Container(
          decoration: BoxDecoration(gradient: lineargrdient),
        ));
  }
}
