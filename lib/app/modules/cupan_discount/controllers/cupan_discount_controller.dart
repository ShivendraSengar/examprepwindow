import 'dart:convert';
import 'dart:developer';

import 'package:exam_prep_tool/app/data/irepositry/icourses_repo.dart';
import 'package:exam_prep_tool/app/data/irepositry/ipayments_repo.dart';
import 'package:exam_prep_tool/app/data/modal/payments_modal.dart';
import 'package:exam_prep_tool/app/data/params/paramspayments.dart';
import 'package:exam_prep_tool/app/data/params/veryfy_payments_params.dart';
import 'package:exam_prep_tool/app/data/repositry/courses_repo.dart';
import 'package:exam_prep_tool/app/data/repositry/payments_repo.dart';
import 'package:exam_prep_tool/app/routes/app_pages.dart';
import 'package:exam_prep_tool/app/utils/const.dart';
import 'package:exam_prep_tool/app/utils/pref_utis.dart';
import 'package:exam_prep_tool/app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:http/http.dart' as https;
import 'package:intl/intl.dart';
//import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:razorpay_web/razorpay_web.dart';
import '../../../data/modal/Referralmodal/check_referralcode_modal.dart';

class CupanDiscountController extends GetxController {
  final arguments = Get.arguments;
  
// / Define arguments as per your logic
 var arguments1 = [].obs;

  RxDouble paynum = 0.0.obs;
InAppWebViewController? webView;
  final String url = 'https://exampreptool.com/api/payment/pay';
  final PrefUtils prefutils = Get.find();
  // Replace 'your_token_here' with the actual token value
  final String token = prefUtils.getToken().toString();
  var finalPrice = "".obs;
  Razorpay razorpay = Razorpay();
  final PaymentsRepo repositry = VerfypaymentRepoImpl();
  final TextEditingController correctCouponCode = TextEditingController();
  final CourseRepo repository1 = CoursesRepoIml();
  final TextEditingController correctReferralCode = TextEditingController();
  final checkreferal = <CheckReferaldata>[].obs;
  // Define reactive variables
  RxInt coursePrice = 0.obs;
  RxInt couponDiscount = 0.obs;
  RxDouble discountPercentage = 0.0.obs;
  RxDouble finalCost = 0.0.obs;

  void calculateCost() {
    // Assuming you've fetched and set coursePriceString and couponDiscountString

    // Convert strings to integers
    int parsedCoursePrice = int.tryParse(arguments[3]) ?? 0;
    int parsedCouponDiscount = int.tryParse(arguments[9]) ?? 0;

    // Assign values to reactive variables
    coursePrice.value = parsedCoursePrice;
    couponDiscount.value = parsedCouponDiscount;

    // Calculate discount percentage
    discountPercentage.value = (couponDiscount.value / 100) * coursePrice.value;

    // Calculate final cost after discount
    finalCost.value = coursePrice.value - discountPercentage.value;

    // Pass values to Razorpay or any other service
    // razorpayFunction(finalCost.value);
  }

  var referalCode = ''.obs;
  RxDouble ReferaldiscountPercentage = 0.0.obs;
  RxDouble referralDiscountAmount = 0.0.obs;
  var isReferralApplied = false.obs;
  // cupon Applied
  var couponCode = ''.obs;
  var isCouponApplied = false.obs;

  // Reactive variables to control visibility
  var showCouponSection = true.obs;
  var showReferralSection = true.obs;

  // Methods to toggle visibility
  void toggleCouponSection() {
    showCouponSection.value = !showCouponSection.value;
  }

  void toggleReferralSection() {
    showReferralSection.value = !showReferralSection.value;
  }

//  Method to toggle the isCouponApplied variable
  void checkReferralData(id) async {
  print("Referral code: ${referalCode}");
  try {
    isLoading.value = true;
    final response = await repository1.checkreferrallist(
      id,
      prefUtils.getID().toString(),
      'Bearer ${prefutils.getToken().toString()}',
    );

    if (response.data != null) {
      // Print the response data
      print("Response Data: ${response.data}");

      // Retrieve referral discount from the response
      checkreferal.value = response.data!.data ?? [];

      // Calculate the final amount after subtracting the referral discount
      ReferaldiscountPercentage.value = calculateFinalAmount(
          checkreferal.first.referralDiscount!.toDouble());

      // Show toast message for successful application of referral code
      showToastMessage("Referral code applied successfully", "");

      // Update the UI with the final amount
      updateFinalAmount(ReferaldiscountPercentage.value);
    } else {
      // Show toast message for invalid referral code
      showToastMessage("Own referal cannot be used", "");
    }
  } catch (e) {
    // Print the error message
    print("Error: $e");
    isLoading.value = false;
  }
}
//   // cupon Applied
  // Function to calculate the final amount after subtracting referral discount
  double calculateFinalAmount(double referralDiscount) {
    // Get the initial amount (replace this with your actual calculation)
    int parsedCoursePrice = int.tryParse(arguments[3]) ?? 0;
    print("final amountt${coursePrice.value}");

    // Assign values to reactive variables
    coursePrice.value = parsedCoursePrice;

    final initialAmount = coursePrice.value;

    // Subtract the referral discount from the initial amount
    final referralAmount = (referralDiscount / 100) * coursePrice.value;
    print('ReferalAmont${referralAmount}');
    referralDiscountAmount.value = referralAmount;

    ReferaldiscountPercentage.value = initialAmount - referralAmount;
    // Ensure the final amount is non-negative
    return ReferaldiscountPercentage.value >= 0
        ? ReferaldiscountPercentage.value
        : 0;
  }

  void updateFinalAmount(double finalAmount) {
    ReferaldiscountPercentage.value.toInt();
  }

//   // cupon Applied
  void togglereferral() {
    isReferralApplied.value = !isReferralApplied.value;
  }

  // Method to toggle the isCouponApplied variable
  void toggleCoupon() {
    isCouponApplied.value = !isCouponApplied.value;
  }

  var orderid = "".obs;
  var getrecipt = "";
  var signature = "".obs;
  var razorpaymentid = "".obs;
  final getdata = Get.arguments;
  RxBool isLoading = false.obs;
  PaymentsData? paymentsData;

  var amount = 0.obs;
  var image = "".obs;
  var name = "".obs;
  var number = 0.obs;
  var cost = 0.obs;
  var durationInMonths = 0.obs;
  var description = "".obs;
  var id = "".obs;
  var courseType = "".obs;
  var offerid = "".obs;
  var vaildDate = "".obs;
  var discountPercent = "".obs;
  var paymentId = ''.obs;
  // var orderid = ''.obs;
  var orderidpay = ''.obs;
  void setPaymentId(String id) {
    paymentId.value = id;
    orderid.value = id;
  }

  void verify() async {
    isLoading.value = true;
    try {
      final requestBody = {
        'courseId': arguments[6].toString(),
        "durationInMonths":  arguments[4].toString(),
        'courseType': arguments[7].toString(),
        'userId': prefutils.getID(),
        'razorpay_order_id': orderid.toString(),
        "razorpay_payment_id": razorpaymentid.value.toString(),
        "razorpay_signature": signature.value.toString(),
        "mode": "online"
      };
      final response = await https.post(
        Uri.parse('https://exampreptool.com/api/payment/purchase'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${token}',
        },
        body: jsonEncode(requestBody),
      );
      if (response.statusCode == 200) {
        Get.toNamed(Routes.COURSE_SCREEN);

        print("Response ${response.body}");

        showToastMessage('Success', 'Payment message sent successfully');
      } else {
        print('Error: ${response.statusCode}, ${response.body}');
        showToastMessage('Error', 'An error occurred during payment.');
      }
    } catch (e) {
      print('Error: $e');
      showToastMessage('Error', 'An error occurred during payment.');
    } finally {
      isLoading.value = false;
    }
  }

  // void fetchData() {
  //   final getdata = Get.arguments;
  //   if (getdata != null && getdata is List && getdata.length > 12) {
  //     amount = getdata[3];
  //   } else {
  //     amount = 0.obs;
  //   }
  // }
  // ///set final cost afete discount
  // Define variables to hold the values
  // Rx variable to hold the final cost
  var finalCostdata = 0.obs;

  //  Date timeparsing
  String? formatDate(String? dateString) {
    if (dateString == null) {
      return null; // or return an appropriate default value
    }
    DateTime? date = DateTime.tryParse(dateString);
    if (date == null) {
      return null; // or return an appropriate default value
    }
    String formattedDate = DateFormat("MMM dd, yyyy").format(date);
    return formattedDate;
  }

  @override
  void onInit() {
    calculateCost();
    final arguments = Get.arguments;

    if (arguments != null && arguments is List && arguments.length >= 8) {
      final image = arguments[0];
      final name = arguments[1];
      final number = arguments[2];
      final cost = arguments[3];
      //(amount.value * 100).toString(),
      final durationInMonths = arguments[4];
      final description = arguments[5];
      final id = arguments[6];
      final courseType = arguments[7];
      final offerid = arguments[8];
      final vaildDate = arguments[9];
      final discountPercent = arguments[10];

      print('Name: $name');
      print("id${prefutils.getID()}");
      print("token ${prefutils.getToken()}");
      print('Image: $image');
      print('Name: $name');
      print('Number: $number');
      print('Cost: $cost');
      print('Duration: $durationInMonths months');
      print('Description: $description');
      print('ID: $id');
      print('Course Type: $courseType');
      print('offerid: $orderid');

      //  amount.value = int.parse(getdata[3].toString());

      print("Subscribe ${amount.value * 100}");
      //razorpay = Razorpay();
      razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccessResponse);
      razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentErrorResponse);

      super.onInit();
    }

    paymentPay() async {
      isLoading.value = true;
      final String amountValue = (isCouponApplied.value
              ? finalCost.value * 100
              : coursePrice.value * 100)
          .toString();

      try {
        final params = Paramspayments()
          ..amount = amountValue.toString()
          ..courseId = id.toString()
          ..currency = currencyin
          ..notes = purchase
          ..type = courseType.toString()
          ..userId = prefutils.getID();

        final response = await repositry.payments(
          params,
          'Bearer ${prefutils.getToken().toString()}',
        );
        if (response.data != null) {
          paymentsData == response.data!.data ?? Payments();
          print(paymentsData!.amount.toString());
        }
      } catch (e) {
        log(e.toString());
      }
    }
  }

 void paymentGetId() async {
  isLoading.value = true;
  // final PaymentController paymentController = Get.find<PaymentController>();
  
  try {
    // Calculate the final amount based on coupon and referral conditions
    double amountValue;
    if (isCouponApplied.value && !isReferralApplied.value) {
      amountValue = finalCost.value;
    } else if (!isCouponApplied.value && isReferralApplied.value) {
      amountValue = ReferaldiscountPercentage.value.toDouble(); // Adjust calculation as needed
    } else if (isCouponApplied.value && isReferralApplied.value) {
      amountValue = finalCost.value; // Assuming finalCost includes both discounts
    } else {
      amountValue = coursePrice.value.toDouble();
    }

    // Convert amount to string and multiply by 100 to get the value in cents/paisa
    final String amountStr = (amountValue * 100).toString();

    // Prepare the request body
    final Map<String, dynamic> requestBody = {
      'amount': amountStr,
      'courseId': id.toString(),
      'currency': currencyin,
      'type': courseType.toString(),
      'userId': prefutils.getID(),
      'notes': purchase,
    };

    // Make the POST request
    final response = await https.post(
      Uri.parse('https://exampreptool.com/api/payment/pay'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(requestBody),
    );

    // Handle the response
    if (response.statusCode == 200) {
      final dynamic responseData = jsonDecode(response.body);

      if (responseData is Map<String, dynamic>) {
        final String paymentId = responseData['data']['id'].toString();
        setPaymentId(paymentId);
        print('orderid: ${paymentId}');
        print('orderid1: ${orderidpay}');
// for web app payment getwy
        // callRazorpay( paymentId);

     ////////////////////////// //   // Call the payment processing function Desktop app
     
        Get.toNamed(Routes.RAZOR_PAY_WINDOW, arguments: [
          paynum.value.toString(),
          arguments[6],
          arguments[7],
          arguments[4],
       paymentId,
        ]);
        print("Response: ${response.body}");

        // Optionally, show a success message
        // showToastMessage('Success', 'Payment message sent successfully');
      }
    } else {
      print('Error: ${response.statusCode}, ${response.body}');
      showToastMessage('Error', 'An error occurred during payment.');
    }
  } catch (e) {
    print('Error: $e');
    showToastMessage('Error', 'An error occurred during payment.');
  } finally {
    isLoading.value = false;
  }
}


  callRazorpay(String id) {
    log('dragonBall callRazorpay');
    print("orderid.valueabahh ${orderid}");
    print("keyId ${key_id.runtimeType}");

    var options = {
      'key': key_id,
      'theme.color': '#ff7400',
      "order_id": id,
      'amount': (amount.value),
      'description': '',
      'prefill': {'contact': prefUtils.getMobile().toString(), 'email': ""}
    };
    print("Options$options");
    try {
      razorpay.open(options);
    } catch (e) {
      log(e.toString());
    }
  }

  void handlePaymentErrorResponse(PaymentFailureResponse response) {
    /*
    * PaymentFailureResponse contains three values:
    * 1. Error Code
    * 2. Error Description
    * 3. Metadata
    * */
    //showAlertDialog(context, "Payment Failed",
    //    "Code: ${response.code}\nDescription: ${response.message}\nMetadata:${response.error.toString()}");
  }

  void handlePaymentSuccessResponse(PaymentSuccessResponse response) {
    /*
    * Payment Success Response contains three values:
    * 1. Order ID
    * 2. Payment ID
    * 3. Signature
//signature id

    //: {razorpay_signature: 23fa574cfe87148588091d086174e12d31ebc8cb43c9fe4b48f90060c6848251, razorpay_order_id: order_NPM8vIb8eENd8x, razorpay_payment_id: pay_NPM9pMfwzSEson}
    * */
    razorpaymentid.value = response.paymentId.toString();
    signature.value = response.signature.toString();
    log(" paymnet${response.paymentId} signature ${response.signature} ");
    //verifypayments();
    verify();

    print(response.toString());
  }

  void handleExternalWalletSelected(ExternalWalletResponse response) {}

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    razorpay.clear();
    super.onClose();
  }

  //void increment() => count.value++;
}
