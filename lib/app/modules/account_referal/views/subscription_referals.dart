import 'package:exam_prep_tool/app/modules/account_referal/controllers/account_referal_controller.dart';
import 'package:exam_prep_tool/app/themes/app_style.dart';
import 'package:exam_prep_tool/app/widgets/custom_colors.dart';
import 'package:exam_prep_tool/app/widgets/custom_shimmer.dart';
import 'package:exam_prep_tool/app/widgets/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

class SubscriptionReferals extends GetView<SubscriptionReferals> {
  const SubscriptionReferals({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AccountReferalController controller =
        Get.put(AccountReferalController());

    return SingleChildScrollView(
      child: Container(
        height: Get.height,
        margin: EdgeInsets.only(bottom: 00),
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
                      margin: const EdgeInsets.only(bottom: 00),
                      width: 600,
                      height: Get.height,
                      child: controller.subscriptionrefaraldatalist.isEmpty
                          ? Container(
                              alignment: Alignment.center,
                              height: 60,
                              child: Text("No Data"),
                            )
                          : ListView.builder(
                              shrinkWrap: true,
                              physics: AlwaysScrollableScrollPhysics(),
                              //  scrollDirection: Axis.vertical,
                              itemCount:
                                  controller.subscriptionrefaraldatalist.length,
                              itemBuilder: (context, index) {
                                var data = controller
                                    .subscriptionrefaraldatalist[index];
                                int amount = data.amount ?? 0;
                                int referralPercent = data.referralEarn ?? 0;
                                double referralAmount =
                                    (amount * referralPercent) / 100;

                                return Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 30, vertical: 10),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 25),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    gradient: cardcolor,
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors
                                            .black, // Set the shadow color here
                                        blurRadius:
                                            5.0, // Adjust the blur radius
                                        spreadRadius:
                                            0.0, // Adjust the spread radius
                                        offset:
                                            Offset(0, 2), // Adjust the offset
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    children: [
                                      buildCard(
                                          "Name", data.userId!.name ?? ""),
                                      buildCard(
                                          "Email",
                                          controller.obscureEmail(
                                              data.userId?.email ?? "")),
                                      buildCard("Amount Paid ", "Rs. $amount"),
                                      buildCard("Referral Amount",
                                          "Rs. $referralAmount"),
                                      buildCard("Payment status",
                                          "${data.referralTransferred}" ?? ""),
                                      buildCard("Date", data.createdAt ?? ""),
                                    ],
                                  ),
                                ).marginOnly(bottom: 0);
                              },
                            ).marginOnly(bottom: 00));
            }),
          ],
        ),
      ),
    );
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
          crossAxisAlignment: CrossAxisAlignment.stretch,
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
              width: 170,
              alignment: Alignment.center,
              //decoration: BoxDecoration(color: Vx.white),
              child: Text(
                title,
                style: AppStyle.txtPoppinsMedium14Gray90002,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ).paddingSymmetric(horizontal: 3),
          ],
        ).paddingSymmetric(horizontal: 5),
      ),
    );
  }
}
