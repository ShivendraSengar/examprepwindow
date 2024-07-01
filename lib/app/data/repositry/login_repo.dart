import 'package:exam_prep_tool/app/data/modal/change_password.dart';
import 'package:exam_prep_tool/app/data/modal/login_response/login_response.dart';
import 'package:exam_prep_tool/app/data/modal/one_device_login.dart';
import 'package:exam_prep_tool/app/data/modal/otp_response/otp_response.dart';
import 'package:exam_prep_tool/app/data/modal/payments_modal.dart';
import 'package:exam_prep_tool/app/data/modal/signup/forget_password_response.dart';
import 'package:exam_prep_tool/app/data/modal/signup/send_otp_response.dart';
import 'package:exam_prep_tool/app/data/params/changepass_params.dart';

import 'package:exam_prep_tool/app/data/params/forgetpassparams.dart';
import 'package:exam_prep_tool/app/data/params/loginparams.dart';

import 'package:exam_prep_tool/app/data/params/otpparams.dart';
import 'package:exam_prep_tool/app/data/params/paramspayments.dart';
//import 'package:exam_prep_tool/app/data/params/payment_params.dart';
import 'package:exam_prep_tool/app/data/params/send_otp_params.dart';
import 'package:exam_prep_tool/app/data/params/signup_params.dart';
import 'package:exam_prep_tool/app/data/modal/signup/signup_response.dart';
import 'package:exam_prep_tool/app/utils/utils.dart';

abstract class LoginRepo {
  Future<DataState<LoginResponse>> auth(Loginparams param);
  Future<DataState<SignupResponse>> signup(SignupParams param);
  Future<DataState<OtpResponse>> otpverify(Otpparams param);
  Future<DataState<SendOtpResponse>> sendotprespo(SendOtpParams param);
  Future<DataState<ChangePassword>> changepassword(
      ChangepassParams param, String token);
  Future<DataState<ForgetpasswordResponse>> fogretpass(Forgetpassparams param);
  Future<DataState<CheckToken>> onedevicelogin(String token);
}
