import 'package:exam_prep_tool/app/modules/air_testseries/controllers/air_testseries_controller.dart';
import 'package:exam_prep_tool/app/modules/air_testseries/views/air_testseries_view.dart';
import 'package:exam_prep_tool/app/modules/more_courses/views/more_courses_view.dart';
import 'package:exam_prep_tool/app/modules/select_coursesScreen/controllers/select_courses_screen_controller.dart';
import 'package:exam_prep_tool/app/modules/select_coursesScreen/views/select_courses_screen_view.dart';
import 'package:exam_prep_tool/app/routes/app_pages.dart';
import 'package:exam_prep_tool/app/themes/app_style.dart';
import 'package:exam_prep_tool/app/utils/const.dart';
import 'package:exam_prep_tool/app/utils/utils.dart';
import 'package:exam_prep_tool/app/widgets/custom_alert_dialog.dart';
import 'package:exam_prep_tool/app/widgets/custom_colors.dart';
import 'package:exam_prep_tool/app/widgets/custom_shimmer.dart';
import 'package:exam_prep_tool/app/widgets/custom_widgets.dart';
import 'package:exam_prep_tool/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(gradient: lineargrdient),
        child: SafeArea(
            child: Scaffold(
                drawer: buildDrawer(),
                appBar: AppBar(
                    leading: Builder(
                        builder: (context) => Image.asset(
                              Assets.images.menuIcon.path,
                              height: 10,
                              width: 10,
                              color: Vx.white,
                              fit: BoxFit.contain,
                            ).onTap(() {
                              Scaffold.of(context).openDrawer();
                            }).paddingOnly(
                                left: 15, top: 12, bottom: 15, right: 15)),
                    toolbarHeight: 60,
                    elevation: 0,
                    title: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            Assets.images.headerLogo.path,
                            height: 40,
                            // color: Colors.white,
                            width: 50,
                            fit: BoxFit.contain,
                          ),
                          10.widthBox,
                          "Exam Prep Tool"
                              .text
                              .size(20)
                              .textStyle(
                                  AppStyle.txtPoppinsSemiBold16White90002)
                              .color(Vx.white)
                              .make(),
                        ]),
                    actions: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.notifications_none_outlined,
                            color: Vx.white,
                          )).paddingOnly(right: 0)
                    ],
                    flexibleSpace: Container(
                      decoration: BoxDecoration(gradient: lineargrdient),
                    )),
                body: Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(gradient: lineargrdient),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        5.heightBox,

                        //Text(controller.prefUtils.getMobile().toString()),
                        //Obx(() =>
                        //    Text(controller.ispurchased.length.toString())),
                        //Obx(() => Text(
                        //    controller.ispurchased.first.purchased.toString())),

                        //Text(controller.ispurchased.value.toString()),
                        //Obx(
                        //  () => Text(
                        //      controller.subscribe.courdata.length.toString()),
                        //),
                        Image.asset(
                          Assets.images.homeScreenImage.path,
                          height: 130,
                          width: 300,
                        ),
                        10.heightBox,
                        Container(
                            width: 800,
                            margin: const EdgeInsets.symmetric(horizontal: 25),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: const [
                                BoxShadow(
                                  color:
                                      Colors.black, // Set the shadow color here
                                  blurRadius: 9.0, // Adjust the blur radius
                                  spreadRadius: 0.0, // Adjust the spread radius
                                  offset: Offset(0, 2), // Adjust the offset
                                ),
                              ],
                              gradient: cardcolor,
                            ),
                            child: Column(
                              children: [
                                //Text(controller.email.toString()),
                                //Obx(
                                //  () => Switch(
                                //      value: controller.prventscreenshot.value,
                                //      onChanged: (value) {
                                //        print(
                                //            "object${controller.prventscreenshot.value}");
                                //        controller.prventscreenshot.value =
                                //            value;
                                //        controller.prventscreenshot.value
                                //            ? controller.screenon()
                                //            : controller.screenoff();
                                //      }),
                                //),

                                10.heightBox,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Do You want Online Doubts ?",
                                      style:
                                          AppStyle.txtPoppinsMedium12White90002,
                                    ),
                                    //  Text(controller.profile?.studentId?.name?? "ffff"),

                                    20.widthBox,
                                    Obx(
                                      () => FlutterSwitch(
                                        width: 50.0,
                                        activeToggleColor: Colors.green,
                                        inactiveColor: Colors.white,
                                        activeColor: Colors.white,
                                        toggleColor: Vx.red700,
                                        height: 20.0,
                                        inactiveTextColor: Colors.black,
                                        activeTextColor: Colors.black,
                                        valueFontSize: 12.0,
                                        toggleSize: 13.0,
                                        value: controller.status.value,
                                        borderRadius: 30.0,
                                        padding: 3.0,
                                        showOnOff: true,
                                        onToggle: (val) {
                                          controller.toggleSwitch();
                                        },
                                      ),
                                    ) // "Switch button".text.make(),
                                  ],
                                ).paddingOnly(left: 0),
                                10.heightBox,
                                buildItemsList(
                                        "Resolve your doubt".toUpperCase())
                                    .onTap(() {
                                  _showDialogUnderProcess(context);
                                  //showToastMessage(
                                  //    "", "Work under Development");
                                }),
                                10.heightBox,
                                buildItemsList(
                                        "top practice questions".toUpperCase())
                                    .onTap(() {
                                  _showDialogUnderProcess(context);
                                }),
                                10.heightBox,
                                buildItemsList(
                                        "My subscribed courses".toUpperCase())
                                    .onTap(() {
                                  if (controller.isLoading.value = true) {
                                    for (int i = 0;
                                        i < controller.ispurchased.length;
                                        i++) {
                                      var coursedetails =
                                          controller.ispurchased[i];

                                      if (coursedetails.purchased == "yes") {
                                        print(
                                            "abha ${controller.ispurchased.length}");
                                        print("yes ${coursedetails.purchased}");
                                        Future.delayed(Duration(seconds: 0),
                                            () {
                                          Get.lazyPut(() =>
                                              SelectCoursesScreenController());
                                          Get.to(
                                              () => SelectCoursesScreenView());
                                        });
                                        //// You probably want to navigate to the SelectCoursesScreenView here
                                        //Get.lazyPut(() =>
                                        //    SelectCoursesScreenController());
                                        //Get.to(() => SelectCoursesScreenView());

                                        // If you want to stop the loop after finding a purchased item, you can break out of it
                                        break;
                                      } else {
                                        Get.toNamed(Routes.CATEGORIES);

                                        print("No ${coursedetails.purchased}");
                                        // You probably want to navigate to the MoreCoursesView here
                                      }
                                    }
                                    print(
                                        "object${controller.isLoading.value}");
                                  } else {
                                    CircularProgressIndicator();
                                  }
                                }),

                                10.heightBox,
                                buildItemsList("Air-1 Notes".toUpperCase())
                                    .onTap(() {
                                  print(controller.twentyprevious.toString());
                                  Get.toNamed(Routes.AIR_NOTES,
                                      arguments: true);
                                }),

                                10.heightBox,
                                buildItemsList(
                                        "air -1 test series".toUpperCase())
                                    .onTap(() {
                                  bool alertShown = false;

                                  for (int i = 0;
                                      i < controller.ispurchased.length;
                                      i++) {
                                    var coursedetails =
                                        controller.ispurchased[i];

                                    if (coursedetails.purchased == "yes" &&
                                            coursedetails.courseType ==
                                                "testseries" ||
                                        coursedetails.courseType ==
                                            "testSeries") {
                                      print(
                                          "abha ${controller.ispurchased.length}");
                                      print(
                                          "yes ${coursedetails.courseType.toString()}");

                                      Get.toNamed(Routes.AIR_TESTSERIES);
                                    } else {
                                      print(
                                          "not testSeries ${coursedetails.courseType.toString()}");

                                      // Show the alert only if it hasn't been shown before
                                      if (!alertShown) {
                                        Get.back;
                                        _showDialog(context);
                                        alertShown =
                                            true; // Set the flag to true to avoid showing the alert again
                                      }

                                      // controller.paymentGetId();
                                    }
                                  }
                                }),
                                10.heightBox,
                                buildItemsList("20 years pyq’s with answer"
                                        .toUpperCase())
                                    .onTap(() {
                                  print(controller.twentyprevious.toString());
                                  Get.toNamed(Routes.TWENYPYS_QUESTION,
                                      arguments: true);
                                }),
                                10.heightBox,
                              ],
                            )),
                        10.heightBox,
                      ],
                    ),
                  ),
                ))
            //))
            ));
  }

  Widget buildItemsList(text) {
    return Container(
      height: 55,
      width: 330,
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(horizontal: 8),
        // padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          gradient: lineargrdient,
          borderRadius: BorderRadius.circular(30),
          boxShadow: const [
            BoxShadow(
              color: Colors.black, // Set the shadow color here
              blurRadius: 6.0, // Adjust the blur radius
              spreadRadius: 0.0, // Adjust the spread radius
              offset: Offset(0, 2), // Adjust the offset
            ),
          ],
        ),
        child: Text(
          text,
          style: AppStyle.txtPoppinsSemiBold14White90002,
        ),
      ),
    ).paddingAll(3);
  }

  buildDrawer() {
    return Drawer(
        child: Container(
            height: double.infinity,
            decoration: BoxDecoration(gradient: horizontalGradient),
            child: ListView(padding: EdgeInsets.zero, children: [
              SizedBox(
                height: 100,
                child: DrawerHeader(
                  decoration: BoxDecoration(gradient: lineargrdient),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 50,
                        height: 80,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        decoration: BoxDecoration(shape: BoxShape.circle),
                        alignment: Alignment.centerLeft,
                        child: Image.asset(
                          Assets.images.profileImageBg.path,
                          // width: 50,
                          // height: 80,
                        ),
                      ),
                      const SizedBox(width: 20),
                      Text(
                        controller.profile.profile?.studentId?.name!
                                .toUpperCase() ??
                            "",
                        style: AppStyle.txtPoppinsSemiBold14White90002,
                      ),
                    ],
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.home, color: Colors.white),
                title:
                    const Text('HOME', style: TextStyle(color: Colors.white)),
                onTap: () {
                  Get.back();
                },
              ),
              ListTile(
                leading: Image.asset(
                  Assets.images.menuMyStoryIcon.path,
                  height: 30,
                  width: 30,
                ),
                title: const Text('MY STORY',
                    style: TextStyle(color: Colors.white)),
                onTap: () {
                  Get.toNamed(
                    Routes.MYSTORY_PAGE,
                  );
                  // Get.back();
                },
              ),
              ListTile(
                leading: Image.asset(
                  Assets.images.menuResolveDoubtNowIcon.path,
                  height: 25,
                  width: 25,
                ),
                title: const Text('RESOLVE DOUBT NOW',
                    style: TextStyle(color: Colors.white)),
                onTap: () {
                  Get.toNamed(Routes.RESOLVE_DOUBTPAGE);
                },
              ),
              ListTile(
                leading: Image.asset(
                  Assets.images.menuMoreCoursesIcon.path,
                  height: 25,
                  width: 25,
                ),
                title: const Text('MORE COURSES',
                    style: TextStyle(color: Colors.white)),
                onTap: () {
                  //Get.toNamed(Routes.CATEGORIES);
                  Get.toNamed(Routes.MORE_COURSES);
                },
              ),
              ListTile(
                leading: Image.asset(
                  Assets.images.settingsMenu.path,
                  height: 25,
                  width: 25,
                ),
                title: const Text('SETTINGS',
                    style: TextStyle(color: Colors.white)),
                onTap: () {
                  Get.toNamed(Routes.SETTINGS_PAGE);
                },
              ),
              ListTile(
                leading: Image.asset(
                  Assets.images.menuContactUsIcon.path,
                  height: 25,
                  width: 25,
                ),
                title: const Text('CONTACT US',
                    style: TextStyle(color: Colors.white)),
                onTap: () {
                  Get.toNamed(Routes.CONTACT_USPAGE);
                },
              ),
              ListTile(
                leading: Image.asset(
                  Assets.images.menuContactUsIcon.path,
                  height: 25,
                  width: 25,
                ),
                //trailing: Icon(Icons.mobile_screen_share_outlined),
                title: const Text('Refer/invite',
                    style: TextStyle(color: Colors.white)),
                onTap: () {
                  Get.toNamed(Routes.REFERAL);
                },
              ),
              ListTile(
                leading: Image.asset(
                  Assets.images.menuLogoutIcon.path,
                  height: 25,
                  width: 25,
                ),
                title:
                    const Text('LOGOUT', style: TextStyle(color: Colors.white)),
                onTap: () {
                  print("logout");
                  print("logout${controller.logout.email}");
                  print("logout${controller.logout.password}");
                  controller.prefutils.clearPreferencesData();
                  controller.logout.email.clear();
                  controller.logout.password.clear();
                  Get.offAndToNamed(Routes.LOGIN_SCREEN);
                },
              ),
            ])));
  }

  void _showDialog(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
          child: Container(
            decoration: BoxDecoration(gradient: horizontalGradient),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Row(
                    children: [
                      Image.asset(
                        Assets.images.headerLogo.path,
                        height: 70,
                        width: 70,
                      ),
                      Text(
                        'Air-1 Test Series',
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Text(
                    'This Test Series made by GATE CSE AIR-1 AbhinavGarg,Total price will be Rs: 999, 3 Months Valid, Approx 100 tests will be there in PDF Format with solutions. ',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const Divider(thickness: 1, color: Colors.white),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        //controller.pickImageFromGallery();
                        Get.back();
                        //Get.back();
                      },
                      child: const Column(
                        children: [
                          Icon(
                            Icons.cancel,
                            color: Colors.white,
                          ),
                          Text(
                            'Cancel',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Center(
                      child: Container(
                        height: 50,
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        Get.back();
                        controller.paymentGetId();
                      },
                      child: const Column(
                        children: [
                          Icon(
                            Icons.payment,
                            color: Colors.white,
                          ),
                          Text(
                            'Pay',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showDialogUnderProcess(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
          child: Container(
            height: 250,
            decoration: BoxDecoration(gradient: horizontalGradient),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        Assets.images.headerLogo.path,
                        height: 70,
                        width: 70,
                      ),
                      Text(
                        'Work Under Development',
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(thickness: 1, color: Colors.white),
                InkWell(
                  onTap: () {
                    //controller.pickImageFromGallery();
                    Get.back();
                    //Get.back();
                  },
                  child: const Column(
                    children: [
                      Text(
                        'OK',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
