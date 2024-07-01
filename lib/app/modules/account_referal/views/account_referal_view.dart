import 'package:exam_prep_tool/app/modules/account_referal/views/subscription_referals.dart';
import 'package:exam_prep_tool/app/themes/app_style.dart';
import 'package:exam_prep_tool/app/widgets/custom_colors.dart';
import 'package:exam_prep_tool/app/widgets/custom_shimmer.dart';
import 'package:exam_prep_tool/app/widgets/custom_widgets.dart';
import 'package:exam_prep_tool/gen/assets.gen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/account_referal_controller.dart';

class AccountReferalView extends GetView<AccountReferalController> {
  const AccountReferalView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue, Colors.green], // Example gradient colors
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Scaffold(
              appBar: buildAppbar(),
              body: Container(
                height: Get.height,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      "Account Referrals"
                          .toUpperCase()
                          .text
                          .textStyle(TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black))
                          .make(),
                      SizedBox(height: 20),
                      Image.asset(
                        Assets.images.accountReferal
                            .path, // Provide the correct asset path
                        height: 140,
                        width: 180,
                        fit: BoxFit.fill,
                      ),
                      20.heightBox,
                      Container(
                        margin: const EdgeInsets.only(left: 10, right: 10),
                        width: 600,
                        height: 45,
                        decoration: BoxDecoration(
                          border: Border.all(width: 2, color: Colors.green),
                          borderRadius: BorderRadius.circular(25.0),
                          color: Vx.white,
                        ),
                        child: TabBar(
                          indicatorPadding: const EdgeInsets.all(0),
                          labelPadding: const EdgeInsets.all(0),
                          padding: const EdgeInsets.all(00),
                          //indicatorWeight: 2.0,
                          dividerHeight: 0,
                          indicator: BoxDecoration(
                            gradient: lineargrdient,
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          labelColor: Colors.white,
                          unselectedLabelColor: Colors.black,
                          tabs: [
                            Container(
                              alignment: Alignment.center,
                              child: const Tab(
                                text: "Acconut Referrals",
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              child: const Tab(
                                text: "Subscription Referrals",
                              ),
                            ),
                          ],
                        ),
                      ).p(8).centered(),
                      const SizedBox(height: 20),
                      Container(
                        height: Get.height,
                        child: TabBarView(
                          children: [
                            SingleChildScrollView(
                              child: Column(
                                children: [
                                  Obx(() {
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
                                            height: Get.height,
                                            width: 600,
                                            margin: EdgeInsets.only(bottom: 10),
                                            child: controller
                                                    .refaraldatalist.isEmpty
                                                ? Container(
                                                    alignment: Alignment.center,
                                                    height: 60,
                                                    child: Text("No data"),
                                                  )
                                                : ListView.builder(
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    itemCount: controller
                                                        .refaraldatalist.length,
                                                    itemBuilder:
                                                        (context, index) {
                                                      var data = controller
                                                              .refaraldatalist[
                                                          index];
                                                      String formattedDate =
                                                          DateFormat(
                                                                  'yyyy-MM-dd')
                                                              .format(data
                                                                  .createdAt!);

                                                      return Container(
                                                        margin: const EdgeInsets
                                                            .symmetric(
                                                            horizontal: 30,
                                                            vertical: 10),
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                horizontal: 10,
                                                                vertical: 25),
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(20),
                                                          gradient: cardcolor,
                                                          boxShadow: const [
                                                            BoxShadow(
                                                              color: Colors
                                                                  .black, // Set the shadow color here
                                                              blurRadius:
                                                                  5.0, // Adjust the blur radius
                                                              spreadRadius:
                                                                  0.0, // Adjust the spread radius
                                                              offset: Offset(0,
                                                                  2), // Adjust the offset
                                                            ),
                                                          ],
                                                        ),
                                                        child: Column(
                                                          children: [
                                                            buildCard(
                                                                "Name",
                                                                data.name ??
                                                                    ""),
                                                            buildCard(
                                                                "Email",
                                                                controller
                                                                    .obscureEmail(
                                                                        data.email ??
                                                                            "")),
                                                            buildCard(
                                                                " Date",
                                                                formattedDate ??
                                                                    ""),
                                                          ],
                                                        ),
                                                      );
                                                    },
                                                  ).marginOnly(bottom: 0),
                                          );
                                  }),
                                ],
                              ).marginOnly(bottom: 90),
                            ),
                            SubscriptionReferals()
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )));
  }

  Widget buildCard(text, title) {
    return Container(
      height: 60,
      //width: 300,
      child: Card(
        // margin: const EdgeInsets.all(10),
        elevation: 3,
        color: Colors.white,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              alignment: Alignment.center,
              //decoration: BoxDecoration(color: Vx.white),
              child: Text(
                text,
                style: AppStyle.txtPoppinsMedium14Gray90002,
              ),
            ),
            Container(
              alignment: Alignment.center,
              //decoration: BoxDecoration(color: Vx.white),
              child: Text(
                title,
                style: AppStyle.txtPoppinsMedium14Gray90002,
              ),
            ).paddingSymmetric(horizontal: 3),
          ],
        ).paddingSymmetric(horizontal: 7),
      ),
    );
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
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          // // Get.back();
          Get.back();
        },
      ),
    );
  }
}
