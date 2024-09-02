import 'package:exam_prep_tool/app/routes/app_pages.dart';
import 'package:exam_prep_tool/app/themes/app_style.dart';
import 'package:exam_prep_tool/app/widgets/custom_colors.dart';
import 'package:exam_prep_tool/app/widgets/custom_shimmer.dart';
import 'package:exam_prep_tool/app/widgets/custom_widgets.dart';
import 'package:exam_prep_tool/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import '../controllers/select_courses_screen_controller.dart';

// class SelectCoursesScreenView extends GetView<SelectCoursesScreenController> {
//   const SelectCoursesScreenView({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//   body: Row(
//     children: [
//       Container(
//         width: 250, // Adjust the width as needed
//          decoration: BoxDecoration(gradient: lineargrdient),// Background color or gradient
//         child: ListView(
//           children: [
//             Container(
//               height: 100,
//                decoration: BoxDecoration(gradient: lineargrdient),
//               child: DrawerHeader(
//                 child: Row(
//                   children: [
//                     Container(
//                       width: 50,
//                       height: 80,
//                       clipBehavior: Clip.antiAliasWithSaveLayer,
//                       decoration: BoxDecoration(shape: BoxShape.circle),
//                       alignment: Alignment.centerLeft,
//                       child: Image.asset(
//                         Assets.images.profileImageBg.path,
//                       ),
//                     ),
//                     const SizedBox(width: 20),
//                     Text(
//                       controller.profile.profile?.studentId?.name!
//                               .toUpperCase() ??
//                           "",
//                       style: AppStyle.txtPoppinsSemiBold14White90002,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             ListTile(
//               leading: const Icon(Icons.home, color: Colors.white),
//               title: const Text('HOME', style: TextStyle(color: Colors.white)),
//               onTap: () {
//                 Get.back();
//               },
//             ),
//             // Add other ListTiles here as needed
//              ListTile(
//                 leading: Image.asset(
//                   Assets.images.menuMyStoryIcon.path,
//                   height: 30,
//                   width: 30,
//                 ),
//                 title: const Text('MY STORY',
//                     style: TextStyle(color: Colors.white)),
//                 onTap: () {
//                   Get.toNamed(
//                     Routes.MYSTORY_PAGE,
//                   );
//                   // Get.back();
//                 },
//               ),
//               ListTile(
//                 leading: Image.asset(
//                   Assets.images.menuResolveDoubtNowIcon.path,
//                   height: 25,
//                   width: 25,
//                 ),
//                 title: const Text('RESOLVE DOUBT NOW',
//                     style: TextStyle(color: Colors.white)),
//                 onTap: () {
//                   Get.toNamed(Routes.RESOLVE_DOUBTPAGE);
//                 },
//               ),
//               ListTile(
//                 leading: Image.asset(
//                   Assets.images.menuMoreCoursesIcon.path,
//                   height: 25,
//                   width: 25,
//                 ),
//                 title: const Text('MORE COURSES',
//                     style: TextStyle(color: Colors.white)),
//                 onTap: () {
//                   //Get.toNamed(Routes.CATEGORIES);
//                   Get.toNamed(Routes.MORE_COURSES);
//                 },
//               ),
//               ListTile(
//                 leading: Image.asset(
//                   Assets.images.settingsMenu.path,
//                   height: 25,
//                   width: 25,
//                 ),
//                 title: const Text('SETTINGS',
//                     style: TextStyle(color: Colors.white)),
//                 onTap: () {
//                   Get.toNamed(Routes.SETTINGS_PAGE);
//                 },
//               ),
//               ListTile(
//                 leading: Image.asset(
//                   Assets.images.menuContactUsIcon.path,
//                   height: 25,
//                   width: 25,
//                 ),
//                 title: const Text('CONTACT US',
//                     style: TextStyle(color: Colors.white)),
//                 onTap: () {
//                   Get.toNamed(Routes.CONTACT_USPAGE);
//                 },
//               ),
//               ListTile(
//                 leading: Image.asset(
//                   Assets.images.menuContactUsIcon.path,
//                   height: 25,
//                   width: 25,
//                 ),
//                 //trailing: Icon(Icons.mobile_screen_share_outlined),
//                 title: const Text('Refer/invite',
//                     style: TextStyle(color: Colors.white)),
//                 onTap: () {
//                   Get.toNamed(Routes.REFERAL);
//                 },
//               ),
//               ListTile(
//                 leading: Image.asset(
//                   Assets.images.menuLogoutIcon.path,
//                   height: 25,
//                   width: 25,
//                 ),
//                 title:
//                     const Text('LOGOUT', style: TextStyle(color: Colors.white)),
//                 onTap: () {
//                   print("logout");
//                   print("logout${controller.logout.email}");
//                   print("logout${controller.logout.password}");
//                   controller.prefutils.clearPreferencesData();
//                   controller.logout.email.clear();
//                   controller.logout.password.clear();
//                   Get.offAndToNamed(Routes.LOGIN_SCREEN);
//                 },
//               ),
//           ],
//         ),
//       ),
//       Expanded(
//         child: // Your main content goes here
  

    
    
//      Container(
//         height: double.infinity,
//         width: double.infinity,
//         decoration: BoxDecoration(gradient: lineargrdient),
//         child: SafeArea(
//             child: Scaffold(
//                 appBar: buildAppbar(),
//                 body: Obx(() {
//                   return controller.isLoading.isTrue
//                       ? BuildShimmer(
//                           child: Column(
//                             children: [
//                               buildSkeltion(),
//                               buildSkeltion(),
//                               buildSkeltion(),
//                               buildSkeltion(),
//                             ],
//                           ),
//                         )
//                       : Container(
//                           alignment: Alignment.center,
//                           height: double.infinity,
//                           width: double.infinity,
//                           decoration: BoxDecoration(gradient: lineargrdient),
//                           child: Container(
//                             width: 800,
//                             child: SingleChildScrollView(
//                               child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   crossAxisAlignment: CrossAxisAlignment.center,
//                                   children: [
//                                     buildselectcourses("Air- 1 Notes")
//                                         .onTap(() {
//                                       Get.toNamed(Routes.AIR_NOTES);
//                                     }),
//                                      buildselectcourses("Test Series").onTap(() {
//                                       Get.toNamed(Routes.TESTSEARIS);
//                                     }),
//                                     // buildselectcourses("Air-1 Test series")
//                                     //     .onTap(() {
//                                     //   Get.toNamed(Routes.AIR_TESTSERIES);
//                                     // }),
//                                     buildselectcourses("video lectures")
//                                         .onTap(() {
//                                       Get.toNamed(Routes.SELECTED_VIDIOLECTURE);
//                                     }),
//                                     buildselectcourses("top practice questions")
//                                         .onTap(() {
//                                       _showDialogUnderProcess(context);
//                                     }),
//                                     buildselectcourses(
//                                             "20 years pyq's with answer")
//                                         .onTap(() {
//                                       Get.toNamed(Routes.TWENYPYS_QUESTION);
//                                     }),
//                                     // buildselectcourses("Live Lectures")
//                                     //     .onTap(() {
//                                     //   Get.toNamed(Routes.LIVE_LETCTURE);
//                                     // }),
                                   
//                                   ]),
//                             ),
//                           ));
//                 }))))
//                 )
//   ]));
//   }


class SelectCoursesScreenView extends GetView<SelectCoursesScreenController> {
  const SelectCoursesScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 600) {
            // Agar width 600 se kam hai, to yeh UI dikhaye
            return Column(
              children: [
                buildAppbar(),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(gradient: lineargrdient),
                    child: Obx(() {
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
                              alignment: Alignment.center,
                              height: double.infinity,
                              width: double.infinity,
                              decoration: BoxDecoration(gradient: lineargrdient),
                              child: Container(
                                width: double.infinity,
                                padding: EdgeInsets.all(16),
                                child: SingleChildScrollView(
                                  child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        buildselectcourses("Air- 1 Notes").onTap(() {
                                          Get.toNamed(Routes.AIR_NOTES);
                                        }),
                                        buildselectcourses("Test Series").onTap(() {
                                          Get.toNamed(Routes.TESTSEARIS);
                                        }),
                                        buildselectcourses("Video Lectures").onTap(() {
                                          Get.toNamed(Routes.SELECTED_VIDIOLECTURE);
                                        }),
                                        buildselectcourses("Top Practice Questions").onTap(() {
                                          _showDialogUnderProcess(context);
                                        }),
                                        buildselectcourses("20 years PYQs with Answer").onTap(() {
                                          Get.toNamed(Routes.TWENYPYS_QUESTION);
                                        }),
                                      ]),
                                ),
                              ));
                    }),
                  ),
                ),
              ],
            );
          } else {
            // Default UI for width >= 600
            return Row(
              children: [
                Container(
                  width: 250,
                  decoration: BoxDecoration(gradient: lineargrdient),
                  child: ListView(
                    children: [
                      buildDrawerHeader(),
                      buildListTile(Icons.home, 'HOME', () => Get.back()),
                      buildListTileWithImage(Assets.images.menuMyStoryIcon.path, 'MY STORY', () => Get.toNamed(Routes.MYSTORY_PAGE)),
                      buildListTileWithImage(Assets.images.menuResolveDoubtNowIcon.path, 'RESOLVE DOUBT NOW', () => Get.toNamed(Routes.RESOLVE_DOUBTPAGE)),
                      buildListTileWithImage(Assets.images.menuMoreCoursesIcon.path, 'MORE COURSES', () => Get.toNamed(Routes.MORE_COURSES)),
                      buildListTileWithImage(Assets.images.settingsMenu.path, 'SETTINGS', () => Get.toNamed(Routes.SETTINGS_PAGE)),
                      buildListTileWithImage(Assets.images.menuContactUsIcon.path, 'CONTACT US', () => Get.toNamed(Routes.CONTACT_USPAGE)),
                      buildListTileWithImage(Assets.images.menuContactUsIcon.path, 'Refer/invite', () => Get.toNamed(Routes.REFERAL)),
                      buildListTileWithImage(Assets.images.menuLogoutIcon.path, 'LOGOUT', () {
                        controller.prefutils.clearPreferencesData();
                        controller.logout.email.clear();
                        controller.logout.password.clear();
                        Get.offAndToNamed(Routes.LOGIN_SCREEN);
                      }),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    decoration: BoxDecoration(gradient: lineargrdient),
                    child: SafeArea(
                      child: Scaffold(
                        appBar: buildAppbar(),
                        body: Obx(() {
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
                                  alignment: Alignment.center,
                                  height: double.infinity,
                                  width: double.infinity,
                                  decoration: BoxDecoration(gradient: lineargrdient),
                                  child: Container(
                                    width: 800,
                                    child: SingleChildScrollView(
                                      child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            buildselectcourses("Air- 1 Notes").onTap(() {
                                              Get.toNamed(Routes.AIR_NOTES);
                                            }),
                                            buildselectcourses("Test Series").onTap(() {
                                              Get.toNamed(Routes.TESTSEARIS);
                                            }),
                                            buildselectcourses("video lectures").onTap(() {
                                              Get.toNamed(Routes.SELECTED_VIDIOLECTURE);
                                            }),
                                            buildselectcourses("top practice questions").onTap(() {
                                              _showDialogUnderProcess(context);
                                            }),
                                            buildselectcourses("20 years pyq's with answer").onTap(() {
                                              Get.toNamed(Routes.TWENYPYS_QUESTION);
                                            }),
                                          ]),
                                    ),
                                  ));
                        }),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
  
  Widget buildDrawerHeader() {
    return Container(
      height: 100,
      decoration: BoxDecoration(gradient: lineargrdient),
      child: DrawerHeader(
        child: Row(
          children: [
            Container(
              width: 50,
              height: 80,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(shape: BoxShape.circle),
              alignment: Alignment.centerLeft,
              child: Image.asset(
                Assets.images.profileImageBg.path,
              ),
            ),
            const SizedBox(width: 20),
            Text(
              controller.profile.profile?.studentId?.name!.toUpperCase() ?? "",
              style: AppStyle.txtPoppinsSemiBold14White90002,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildListTile(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(title, style: TextStyle(color: Colors.white)),
      onTap: onTap,
    );
  }

  Widget buildListTileWithImage(String imagePath, String title, VoidCallback onTap) {
    return ListTile(
      leading: Image.asset(
        imagePath,
        height: 25,
        width: 25,
      ),
      title: Text(title, style: TextStyle(color: Colors.white)),
      onTap: onTap,
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

  Widget buildselectcourses(String text) {
    return Container(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        padding: EdgeInsets.only(left: 15),
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(boxShadow: const [
          BoxShadow(
            color: Colors.black, // Set the shadow color here
            blurRadius: 6.0, // Adjust the blur radius
            spreadRadius: 0.0, // Adjust the spread radius
            offset: Offset(0, 2), // Adjust the offset
          ),
        ], borderRadius: BorderRadius.circular(25), gradient: cardcolor),
        child: Row(
          children: [
            text
                .toUpperCase()
                .text
                .center
                .textStyle(AppStyle.txtPoppinsMedium12White90002)
                .make()
                .expand(),
            // Container(
            //   clipBehavior: Clip.antiAliasWithSaveLayer,
            //   alignment: Alignment.center,
            //   height: 95,
            //   width: 39,
            //   decoration:
            //       BoxDecoration(shape: BoxShape.circle, gradient: buttonColor),
            //   child: Icon(
            //     Icons.arrow_drop_down,
            //     color: Colors.white,
            //     size: 35,
            //   ),
            // )
          ],
        )).paddingSymmetric(horizontal: 45, vertical: 10);
  }

  buildAppbar() {
    return AppBar(
      elevation: 0,
      iconTheme: const IconThemeData(color: Colors.white),
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
      ),
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Get.toNamed(Routes.HOME);
          // // Get.back();
          // Get.back();
        },
      ),
    );
  }
}
