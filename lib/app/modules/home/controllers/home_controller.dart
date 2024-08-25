import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:exam_prep_tool/app/data/irepositry/icourses_repo.dart';
import 'package:exam_prep_tool/app/data/irepositry/ilogin_repo.dart';
import 'package:exam_prep_tool/app/data/irepositry/iprofile_repo.dart';
import 'package:exam_prep_tool/app/data/modal/course.dart';
import 'package:exam_prep_tool/app/data/modal/one_device_login.dart';
import 'package:exam_prep_tool/app/data/modal/profile/edit_profile.dart';
import 'package:exam_prep_tool/app/data/repositry/courses_repo.dart';
import 'package:exam_prep_tool/app/data/repositry/login_repo.dart';
import 'package:exam_prep_tool/app/data/repositry/profile.dart';
import 'package:exam_prep_tool/app/modules/login_screen/controllers/login_screen_controller.dart';
import 'package:exam_prep_tool/app/modules/more_courses/controllers/more_courses_controller.dart';
import 'package:exam_prep_tool/app/modules/proile_page/controllers/proile_page_controller.dart';
import 'package:exam_prep_tool/app/routes/app_pages.dart';
import 'package:exam_prep_tool/app/utils/const.dart';
import 'package:exam_prep_tool/app/utils/pref_utis.dart';
import 'package:exam_prep_tool/app/utils/utils.dart';
//import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:get/get.dart';
import 'package:razorpay_web/razorpay_web.dart';
import 'package:http/http.dart' as https;
import 'package:screen_protector/screen_protector.dart';

class HomeController extends GetxController {
  final PrefUtils prefutils = Get.find();
  final LoginScreenController logout = Get.find();
  final ProilePageController profile = Get.find();
  final EditProfileRepo profilrrepositry = EditProfileImpl();
  final LoginRepo repositry1 = LoginRepoImpl();

  // final MoreCoursesController subscribe = Get.find();
  RxBool status = false.obs;
  RxBool twentyprevious = false.obs;
  RxBool isVisible = false.obs;
  RxBool isLoading = false.obs;
  final ispurchased = <Datum>[].obs;
  // final msg = <CheckToken>
  CheckToken? data;
  final CourseRepo repositry = CoursesRepoIml();

  final String url = 'https://devapi.exampreptool.com/api/payment/pay';

  // Replace 'your_token_here' with the actual token value
  final String token = prefUtils.getToken().toString();
  Razorpay razorpay = Razorpay();
  RxBool prventscreenshot = false.obs;

  // //////////////////// secure screen from screen shot

  // void screenon() async {
  //   await ScreenProtector.preventScreenshotOn();
  // }

  // void screenoff() async {
  //   await ScreenProtector.preventScreenshotOff();
  // }

  //final PaymentsRepo repositry = VerfypaymentRepoImpl();

  var orderid = "";
  var getrecipt = "";
  var signature = "".obs;
  var razorpaymentid = "".obs;
  final getdata = Get.arguments;

  var amount = "1".obs;

  void toggleSwitch() {
    status.toggle();
  }

  //void secureScreen() async {
  //  await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  //}

  RxList<bool> isSelected = [true, false, false].obs;

  void selectItem(int index) {
    for (int i = 0; i < isSelected.length; i++) {
      isSelected[i] = i == index;
    }
  }

  getList() async {
    isLoading.value = true;

    try {
      final response =
          await repositry.getcourses(prefutils.getID().toString(), 'priority');
      if (response.data != null) {
        print("course ${response.data!.data!.length}");

        ispurchased.value = response.data!.data ?? [];
        // pages.value = response.data!.data ?? [];
      } else {
        print("Data is null");
        ispurchased.value = []; // or handle the null case in a different way
      }
      isLoading.value = false;
    } catch (e) {
      log("err $e");
      isLoading.value = false;
    }
  }

  void verify() async {
    isLoading.value = true;
    try {
      final requestBody = {
        'TestSeriesId': "655390d60e6c9ae06a862214",
        "durationInMonths": "12",
        'courseType': "testSeries",
        'userId': prefutils.getID(),
        'razorpay_order_id': orderid.toString(),
        "razorpay_payment_id": razorpaymentid.value.toString(),
        "razorpay_signature": signature.value.toString(),
        "mode": "online"
      };
      final response = await https.post(
        Uri.parse('https://devapi.exampreptool.com/api/payment/purchase'),
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
  Timer? _timer;
  @override
  void onInit() async {
    getList();
    await onedevicelogin();
    // screenon();
    // await onedevicelogin();
    //  ProfileData();
 // 5 मिनट का टाइमर सेट करें
    _timer = Timer.periodic(const Duration(seconds: 25), (Timer timer) {
      onedevicelogin(); // हर 5 मिनट में टोकन को वेरिफाई करें
    });
    final data = Get.arguments;

    if (data != null && data is List && data.length >= 8) {
      // Printing the values

      print("id${prefutils.getID()}");
      print("token ${prefutils.getToken()}");
    } else {
      print('Invalid arguments format');
    }

    print("Signature    $signature");

    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccessResponse);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentErrorResponse);

    super.onInit();
  }

  paymentGetId() async {
    isLoading.value = true;
    try {
      //final String amountValue = (amount.value * 100).toString();
      final requestBody = {
        'amount': "100",
        'TestSeriesId': "655390d60e6c9ae06a862214",
        'currency': currencyin,
        'type': "testSeries",
        'userId': prefutils.getID(),
        'notes': purchase,
      };
      final response = await https.post(
        Uri.parse('https://devapi.exampreptool.com/api/payment/pay'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${token}',
        },
        body: jsonEncode(requestBody),
      );
      if (response.statusCode == 200) {
        final dynamic responseData = jsonDecode(response.body);

        if (responseData is Map<dynamic, dynamic>) {
          final String paymentId = responseData['data']['id'].toString();
          orderid = paymentId;
          print('orderii $orderid');

          callRazorpay(responseData['data']['id']); // Removed .toString() here
          print("Response ${response.body}");

          //showToastMessage('Success', 'Payment message sent successfully');
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
    print("Token${prefutils.getToken()}");
    print("Token${prefutils.getID()}");
    print("orderid.valueabahh ${orderid}");
    print("keyId ${key_id.runtimeType}");

    var options = {
      'key': key_id,
      'theme.color': '#ff7400',
      "order_id": id,
      'amount': "100",
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
    //Get.back();
  }

  Future<void> onedevicelogin() async {
    String? token = prefutils.getToken();

    if (token == null || token.isEmpty) {
      // Token not found or empty, redirect to login screen
      Get.offAll(Routes.LOGIN_SCREEN);
      return;
    }

    print("Token: $token");
    isLoading.value = true;

    try {
      var response = await repositry1.onedevicelogin('Bearer $token');

      if (response.data != null) {
        // Token is valid
        String? message =
            response.data!.message; // Access the message from the response
        print('Token is valid');
        print('Response message: $message');
      } else {
        // Token is invalid or expired
        print('Token is invalid');
        handleInvalidToken();
      }
    } catch (e) {
      // Handle errors
      print('Error occurred: $e');
      handleInvalidToken();
    } finally {
      isLoading.value = false; // Ensure loading state is reset
    }
  }

  void handleInvalidToken() {
    // Clear any stored token
    prefutils.clearPreferencesData();
    // Redirect user to login screen
    Get.offAll(Routes.LOGIN_SCREEN);
  }

  void handleExternalWalletSelected(ExternalWalletResponse response) {}

  final count = 0.obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
