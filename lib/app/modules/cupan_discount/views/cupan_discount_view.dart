
import 'package:exam_prep_tool/app/routes/app_pages.dart';
import 'package:exam_prep_tool/app/themes/app_style.dart';
import 'package:exam_prep_tool/app/utils/const.dart';
import 'package:exam_prep_tool/app/utils/utils.dart';
import 'package:exam_prep_tool/app/widgets/custom_colors.dart';
import 'package:exam_prep_tool/gen/assets.gen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';import 'package:url_launcher/url_launcher.dart';

import '../controllers/cupan_discount_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class CupanDiscountView extends GetView<CupanDiscountController> {
  const CupanDiscountView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // Assuming controller.arguments[3] contains the course price as a String
    String coursePriceString = controller.arguments[3] ?? '0';

// Assuming controller.arguments[9] contains the coupon discount as a String
    String couponDiscountString = controller.arguments[9] ?? '0';

// Convert the strings to integers
// Convert the strings to integers
    int coursePrice = int.tryParse(coursePriceString ?? "0") ?? 0;
    int couponDiscount = int.tryParse(couponDiscountString ?? '0') ?? 0;

// Calculate the discount percentage
// Calculate the discount amount
    double discountPercentage = (couponDiscount / 100) * coursePrice;

    print("discountPercent${discountPercentage}");
    print("coursePrice${coursePrice}");
    print("couponDiscount${couponDiscount}");
// Calculate the final cost
// Calculate the final cost after discount
// RxInt finalCost = coursePrice - discountPercentage;
// RxInt finalCostInteger = finalCost;
    RxInt finalCost = 0.obs;
    finalCost.value = (coursePrice - discountPercentage).toInt();
    RxInt finalReferalCost = 0.obs;
    finalReferalCost.value = (controller.ReferaldiscountPercentage).toInt();

    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          width: 800,
          alignment: Alignment.center,
          height: Get.height,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: SingleChildScrollView(
                  child: Container(
                width: 600,
                child: Column(
                  children: [
                    //Obx(() => Text(
                    //'Course Price: ${controller.ReferaldiscountPercentage.value.toDouble()}')),
                    // Obx(() => Text('Coupon Discount: ${controller.couponDiscount.value}')),
                    // Obx(() => Text('Discount Percentage: ${controller.discountPercentage.value}')),
                    // Obx(() => Text('Final Cost: ${controller.finalCost.value}')),
                    // ElevatedButton(
                    //   onPressed: () {
                    //     // controller.calculateCost(); // Call your calculation function
                    //   },
                    //   child: Text('Calculate Cost'),
                    // ),

                    Text(
                      "Order Details",
                      style: AppStyle.txtPoppinsSemiBold18Black,
                    ),

                    8.heightBox,
                    Divider(
                      height: 2,
                      color: Colors.grey,
                    ),
                    10.heightBox,
                    Container(
                      height: 120,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              height: 90,
                              width: 90,
                              child: Image.network(
                                imageUrl + controller.arguments[0].toString(),
                                errorBuilder: (BuildContext context,
                                    Object exception, StackTrace? stackTrace) {
                                  return Image.asset(
                                    'images/placeholder.jpeg', // Replace 'assets/placeholder_image.png' with your placeholder image path
                                    fit: BoxFit.fill,
                                  );
                                },
                                fit: BoxFit.fill,
                              )),
                          10.widthBox,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              8.heightBox,
                              Center(
                                  child: Text(
                                controller.arguments[1].toString() ?? "",
                                style: AppStyle.txtPoppinsMedium16darkGray,
                              )).centered().w(250),
                              8.heightBox,
                              buildRow(
                                  "Duration",
                                  "${controller.arguments[4].toString()} days" ??
                                      ""),
                              5.heightBox,
                              buildRow("Course ID",
                                  controller.arguments[2].toString() ?? ""),
                            ],
                          )
                        ],
                      ),
                    ),
                    40.heightBox,

                    // Apply cu// Accessing the values in your view

                    // Pass the finalCostInteger value to RazorPay or wherever needed
                    Obx(() => Visibility(
                        visible: controller.showCouponSection.value,
                        child: controller.arguments[8] != null &&
                                controller.arguments[8].isNotEmpty
                            ? Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: TextField(
                                        decoration: InputDecoration(
                                          hintText:
                                              'Enter coupon code'.toUpperCase(),
                                          border: InputBorder.none,
                                        ),
                                        // Capture user input and update the coupon code in the controller
                                        onChanged: (value) {
                                          controller.couponCode.value = value;
                                        },
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        controller.toggleCouponSection();
                                        // Check if the entered coupon code is correct
                                        if (controller.couponCode.value ==
                                            controller.arguments[8]) {
                                          // Apply coupon logic
                                          controller.finalCostdata.value =
                                              finalCost.value;
                                          print(
                                              "controller.finalCostdata.value  ${controller.finalCostdata.value}");
                                          controller.toggleCoupon();
                                          print("object");
                                        } else {
                                          // Show a message indicating that the coupon code is not correct
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                  'Coupon code is not correct'),
                                              duration: Duration(seconds: 2),
                                            ),
                                          );
                                        }
                                      },
                                      child: Obx(
                                        () => Text(
                                          controller.isCouponApplied.value
                                              ? 'Applied'
                                              : 'Apply',
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                                .p(0)
                                .box
                                .roundedSM
                                .color(Colors.white)
                                .border(color: Colors.black, width: 2.0)
                                .make()
                            : SizedBox())),

                    20.heightBox,
                    Obx(() => Visibility(
                          visible: controller.showCouponSection.value,
                          child: controller.arguments[8] != null &&
                                  controller.arguments[8].isNotEmpty
                              ? Container(
                                  height: 140,
                                  width: 700,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              Assets.images.coupanImage.path))),
                                  child: Row(
                                    children: [
                                      RotatedBox(
                                        quarterTurns:
                                            3, // 90 degrees counter-clockwise rotation
                                        child: Text(
                                          'Coupon'.toUpperCase(),
                                          style: AppStyle
                                              .txtPoppinsSemiBold18White90002,
                                        ), // Optional: Define the text style
                                      ),
                                      10.widthBox,
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "${controller.arguments[8]}"
                                                            .toUpperCase() ??
                                                        "",
                                                    style: AppStyle
                                                        .txtPoppinsSemiBold14White90002,
                                                  ),
                                                  Text(
                                                    "flat ${controller.arguments[9]} % off"
                                                            .toUpperCase() ??
                                                        "",
                                                    style: AppStyle
                                                        .txtPoppinsSemiBold14White90002,
                                                  ),
                                                ],
                                              ),
                                              180.widthBox,
                                              Obx(() {
                                                return controller
                                                            .isCouponApplied
                                                            .value !=
                                                        true
                                                    ? Container(
                                                        alignment:
                                                            Alignment.center,
                                                        height: 30,
                                                        width: 90,
                                                        color: Colors.white,
                                                        child: Text(
                                                          'Apply',
                                                          style: AppStyle
                                                              .txtPoppinsMedium14Gray90002,
                                                        ),
                                                      ).onTap(() {
                                                        controller.finalCostdata
                                                                .value =
                                                            finalCost.value;
                                                        print(
                                                            "controller.finalCostdata.value  ${controller.finalCostdata.value}");
                                                        controller
                                                            .toggleCoupon();
                                                        print("object");
                                                      })
                                                    : Container(
                                                        alignment:
                                                            Alignment.center,
                                                        height: 30,
                                                        width: 90,
                                                        color: Colors.white,
                                                        child: Text(
                                                          'Applied',
                                                          style: AppStyle
                                                              .txtPoppinsMedium14Gray90002,
                                                        ),
                                                      ).onTap(() {
                                                        controller.finalCostdata
                                                                .value =
                                                            finalCost.value;
                                                        print(
                                                            "controller.finalCostdata.value  ${controller.finalCostdata.value}");
                                                        controller
                                                            .toggleCoupon();
                                                        controller
                                                            .toggleCouponSection();
                                                        print("object");
                                                      });
                                              })
                                            ],
                                          ),
                                          Text(
                                            "Valid until ${controller.arguments[10] != null ? controller.formatDate(controller.arguments[10].toString()) : 'N/A'}"
                                                .toUpperCase(),
                                            style: AppStyle
                                                .txtPoppinsSemiBold16White90002,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ).p(10),
                                )
                              : SizedBox(),
                        )),
                    40.heightBox,
                    // Referral code
Obx(() => Visibility(
  visible: controller.showReferralSection.value,
  child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Container(
        alignment: Alignment.center,
        height: 45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(width: 1.3, color: Vx.green700),
        ),
        child: TextField(
          textAlign: TextAlign.center,
          controller: controller.correctReferralCode,
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: "Enter referral code",
          ),
          onChanged: (value) {
            controller.referalCode.value = value;
          },
        ).p(0),
      ).expand(),
      10.widthBox,
      Container(
        alignment: Alignment.center,
        height: 35,
        width: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: horizontalGradient,
        ),
        child: GestureDetector(
          onTap: () {
         final   String enteredReferralCode = controller.correctReferralCode.text;
        final    String storedReferralCode = controller.prefutils.getreferralcode.toString();

            if (enteredReferralCode.isEmpty) {
              showToastMessage('Please Enter Coupon Code', "");
              print("Amountvalue${controller.finalCost.value.toInt()}");
            } else {
              if (enteredReferralCode == storedReferralCode) {
                showToastMessage("Own referal cannot be used", "");
                return;
              }

              if (controller.finalCost.value <= 10) {
                print("Amountvalue${controller.finalCost.value.toInt()}");
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Alert"),
                      content: Text("No Referral discount allowed for this course"),
                      actions: <Widget>[
                        Text("OK").onTap(() {
                          Navigator.pop(context);
                        }),
                      ],
                    );
                  },
                );
              } else {
                controller.toggleCouponSection();
                controller.togglereferral();
                print('Referral Code: ${controller.referalCode.value}');
                controller.checkReferralData(controller.referalCode.value);
              }
            }
          },
          child: Obx(() => Text(
            controller.isReferralApplied.value ? "Applied" : "Apply",
            style: TextStyle(color: Colors.white),
          )).centered(),
        ),
      )
    ],
  ),
)),

                    // Referral code
                    // Obx(() => Visibility(
                    //       visible: controller.showReferralSection.value,
                    //       child: Row(
                    //         mainAxisAlignment: MainAxisAlignment.center,
                    //         crossAxisAlignment: CrossAxisAlignment.center,
                    //         children: [
                    //           Container(
                    //             alignment: Alignment.center,
                    //             height: 45,
                    //             decoration: BoxDecoration(
                    //                 borderRadius: BorderRadius.circular(20),
                    //                 border: Border.all(
                    //                     width: 1.3, color: Vx.green700)),
                    //             child: TextField(
                    //               textAlign: TextAlign.center,
                    //               controller: controller.correctReferralCode,
                    //               decoration: const InputDecoration(
                    //                   border: InputBorder.none,
                    //                   hintText: "Enter referral code"),
                    //               onChanged: (value) {
                    //                 controller.referalCode.value = value;
                    //               },
                    //             ).p(0),
                    //           ).expand(),
                    //           10.widthBox,
                    //           Container(
                    //             alignment: Alignment.center,
                    //             height: 35,
                    //             width: 120,
                    //             decoration: BoxDecoration(
                    //               borderRadius: BorderRadius.circular(20),
                    //               gradient: horizontalGradient,
                    //             ),
                    //             child: GestureDetector(
                    //               onTap: () {
                    //                 if (controller
                    //                     .correctReferralCode.text.isEmpty) {
                    //                   showToastMessage(
                    //                       'Please Enter Coupon Code', "");
                    //                   print(
                    //                       "Amountvalue${controller.finalCost.value.toInt()}");
                    //                 } else {
                    //                   if (controller.finalCost.value <= 10) {
                    //                     print(
                    //                         "Amountvalue${controller.finalCost.value.toInt()}");
                    //                     showDialog(
                    //                         context: context,
                    //                         builder: (BuildContext context) {
                    //                           return AlertDialog(
                    //                             title: Text("Alert"),
                    //                             content: Text(
                    //                                 "No Referral discount allowed for this course"),
                    //                             actions: <Widget>[
                    //                               Text("OK").onTap(() {
                    //                                 Navigator.pop(context);
                    //                               }),
                    //                             ],
                    //                           );
                    //                         });
                    //                   } else {
                    //                     controller.toggleCouponSection();
                    //                     controller.togglereferral();
                    //                     print(
                    //                         'Referral Code: ${controller.referalCode.value}');
                    //                     controller.checkReferralData(
                    //                         controller.referalCode.value);
                    //                   }
                    //                 }
                    //               },
                    //               child: Obx(() => Text(
                    //                     controller.isReferralApplied.value
                    //                         ? "Applied"
                    //                         : "Apply",
                    //                     style: TextStyle(color: Colors.white),
                    //                   )).centered(),
                    //             ),
                    //           )
                    //         ],
                    //       ),
                    //     )),

                    // // Text(controller.chechreferal.first.email.toString()),

                    buildRow(
                        'Course Price', "Rs. ${controller.arguments[3]}" ?? ""),

                    Obx(() {
                      return controller.isCouponApplied.value != true
                          ? SizedBox()
                          : buildRow(
                              'Coupon Discount', "Rs. ${discountPercentage}");
                    }),
                    // Display Referral Discount if applied
Obx(() {
  String enteredReferralCode = controller.correctReferralCode.text;
  String storedReferralCode = controller.prefutils.getreferralcode.toString();

  return controller.isReferralApplied.value && enteredReferralCode == storedReferralCode
      ? buildRow('Referral Discount', "Rs. ${controller.referralDiscountAmount.value}")
      : SizedBox();
}),

                    // Obx(() {
                    //   return controller.isReferralApplied.value != true||enteredReferralCode == storedReferralCode
                    //       ? SizedBox()
                    //       : buildRow('Referral Discount',
                    //           "Rs. ${controller.referralDiscountAmount.value}");
                    // }),

                    Obx(() {
                      return controller.isReferralApplied.value != true
                          ? SizedBox()
                          : buildRow('referral',
                              "Rs. ${controller.ReferaldiscountPercentage.value.toInt()}");
                    }),

                    5.heightBox,

                    // If the coupon is applied, show the final cost; otherwise, show the course price

                    // Course price

                    // buildRow('Coupon Discount',"Rs. ${controller.arguments[9]}"),
                    15.heightBox,
                    Divider(
                      height: 3,
                      color: Vx.black,
                    ),

                    15.heightBox,
                    // buildRow('Final Cost', 'Rs. $finalCost'),
   Obx(() {
  final enteredReferralCode = controller.correctReferralCode.text;
  final storedReferralCode = controller.prefutils.getreferralcode();

  double totalAmount;

  // Retrieve and parse the base price from arguments
  final basePrice = double.tryParse(controller.arguments[3].toString()) ?? 0.0;

  // Check if referral code matches the stored referral code
  if (controller.isReferralApplied.value && enteredReferralCode == storedReferralCode) {
    totalAmount = basePrice;
    return buildRow('Total Amount', "Rs. ${totalAmount.toString()}");
  }
  // Check if neither coupon nor referral code is applied
  else if (!controller.isCouponApplied.value && !controller.isReferralApplied.value) {
    totalAmount = basePrice; // Base price
    return buildRow('Total Amount', "Rs. ${totalAmount.toString()}");
  }
  // Check if only coupon code is applied
  else if (controller.isCouponApplied.value && !controller.isReferralApplied.value) {
    totalAmount = controller.finalCost.value ?? 0.0; // Price after coupon discount
    return buildRow('Total Amount', "Rs. ${totalAmount.toString()}");
  }
  // Check if only referral code is applied
  else if (!controller.isCouponApplied.value && controller.isReferralApplied.value) {
    totalAmount = controller.ReferaldiscountPercentage.value.toDouble(); // Price after referral discount
    return buildRow('Total Amount', "Rs. ${totalAmount.toString()}");
  }
  // Check if both coupon and referral code are applied
  else {
    totalAmount = controller.finalCost.value ?? 0.0; // Price after combined discounts
    return buildRow('Total Amount', "Rs. ${totalAmount.toString()}");
  }
}),


                    20.heightBox,
                    Container(
                      height: 55,
                      width: 600,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 39, 145, 43),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          15.widthBox,
                          Obx(() {
                                double totalAmount;
final enteredReferralCode = controller.correctReferralCode.text;
  final storedReferralCode = controller.prefutils.getreferralcode();

  

  // Retrieve and parse the base price from arguments
  final basePrice = double.tryParse(controller.arguments[3].toString()) ?? 0.0;

  // Check if referral code matches the stored referral code
  if (controller.isReferralApplied.value && enteredReferralCode == storedReferralCode) {
    totalAmount = basePrice ;}
  
           else if (!controller.isCouponApplied.value && !controller.isReferralApplied.value) {
              totalAmount = double.tryParse(controller.arguments[3].toString()) ?? 0.0;
            } else if (controller.isCouponApplied.value && !controller.isReferralApplied.value) {
              totalAmount = controller.finalCost.value.toDouble() ?? 0.0;
            } else if (!controller.isCouponApplied.value && controller.isReferralApplied.value) {
              totalAmount = controller.ReferaldiscountPercentage.value.toDouble();
            } else {
              totalAmount = controller.finalCost.value.toDouble() ?? 0.0;
            }

            // Assigning the calculated totalAmount to controller.paynum
            controller.paynum.value = totalAmount;

            return Text(
              "Rs. $totalAmount",
              style: AppStyle.txtPoppinsSemiBold14White90002,
            );
          }),
                          // Text("Rs. $finalCost",style: AppStyle.txtPoppinsSemiBold14White90002,),
                          Container(
                              alignment: Alignment.center,
                              height: 30,
                              width: 160,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  border: Border.all(
                                      width: 1, color: Colors.white)),
                              child: Text(
                                'Proceed To Pay'.toUpperCase(),
                                style: AppStyle.txtPoppinsSemiBold14White90002,
                              )).p(0).onTap(() {
                                print("token${controller.prefutils.getToken().toString()}");
                                print("user id${controller.prefutils.getID().toString()}");
                                print("pay amount${controller.paynum.value.toString()}");
                                print( "course id${controller.arguments[6]}");
                                 print("course type${controller.arguments[4]}");
                                print("Time duration${controller.arguments[7]}");
                                print("Time duration${controller.orderid}");
//                        Get.toNamed(
//   Routes.RAZOR_PAY_WINDOW,
//   arguments: [
//     controller.paynum.value.toString(),
//     controller.arguments[6],
//     controller.arguments[7],
//     controller.arguments[4]
//   ],
// );

// Call the function after navigation
controller.paymentGetId();

          //  controller.paymentGetId();
            // controller.paymentGetId();
          }),
                            // controller.paymentGetId();
                         
                        ],
                      ).p(8),
                    ),
                    20.heightBox
                  ],
                ).w(800),
              )),
            ),
          ),
        ),
      ),
    );
  }
  
  Widget buildRow(text, cost) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: AppStyle.txtPoppinsSemiBold16Black,
          ),
          60.widthBox,
          Text(cost)
        ],
      ),
    );
  }
}
