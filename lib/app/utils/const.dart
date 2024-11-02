import 'package:exam_prep_tool/app/data/modal/buycourses_modal.dart';

import 'package:exam_prep_tool/app/data/modal/profile/edit_profile.dart';
import 'package:exam_prep_tool/app/data/modal/otp_response/user_data.dart';
import 'package:exam_prep_tool/app/data/modal/payments_modal.dart';
import 'package:exam_prep_tool/app/utils/pref_utis.dart';
import 'package:get/get.dart';

// Encrypt other URLs as needed

final PrefUtils prefutils = Get.find();
const baseUrl = 'https://devapi.exampreptool.com/api/';
//const baseUrl = 'http://3.108.150.124:4000/api/'; //https://devapi.exampreptool.com/api/';
final userData = UserData().obs;
//const razorpayid = {`${rzp_test_PwgBzUCpnd1ZRt} RAZORPAY_KEY_ID = rzp_test_PwgBzUCpnd1ZRt
// RAZORPAY_KEY_SECRET = UfwrtiFlMRNrFBPpOvU5wKBr`}
var userid = EditProfile().obs;
const String key_id = "rzp_live_7ck6XrPcnXgzmw";
const examdat = "654f089dbf2c60d79abcb464";
const subjectss = "Algorithms(RIC-GATE-CSE-2024)";
const uploadTypesss = "video";
const preiousqu = "pyq20";
const imageUrl = 'https://ept-data-new.s3.amazonaws.com/';
const emailtext = "";
const purchase = "course purchase";
final paaym = Payments().obs;
const currencyin = "INR";
const secret = "QSqT1Nk3o8x3yM0DYxIrvdkO";
const orderidpay = "";




//RAZORPAY_KEY_ID_TEST = rzp_test_PwgBzUCpnd1ZRt
//RAZORPAY_KEY_SECRET_TEST = QSqT1Nk3o8x3yM0DYxIrvdkO
