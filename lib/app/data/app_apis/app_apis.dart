import 'package:exam_prep_tool/app/data/modal/Referralmodal/account_refferal_modal.dart';
import 'package:exam_prep_tool/app/data/modal/Referralmodal/account_refferal_modal.dart';
import 'package:exam_prep_tool/app/data/modal/Referralmodal/check_referralcode_modal.dart';
import 'package:exam_prep_tool/app/data/modal/Referralmodal/subscription_referal_modal.dart';
import 'package:exam_prep_tool/app/data/modal/buycourses_modal.dart';
import 'package:exam_prep_tool/app/data/modal/categories_filterdata.dart';
import 'package:exam_prep_tool/app/data/modal/change_password.dart';
import 'package:exam_prep_tool/app/data/modal/circulam_lists/circulam_modal.dart';
import 'package:exam_prep_tool/app/data/modal/course.dart';
import 'package:exam_prep_tool/app/data/modal/courses_category.dart';
import 'package:exam_prep_tool/app/data/modal/live_lectures_list.dart';
import 'package:exam_prep_tool/app/data/modal/one_device_login.dart';
import 'package:exam_prep_tool/app/data/modal/profile/edit_profile.dart';

import 'package:exam_prep_tool/app/data/modal/login_response/login_response.dart';
import 'package:exam_prep_tool/app/data/modal/otp_response/otp_response.dart';
import 'package:exam_prep_tool/app/data/modal/payments_modal.dart';
import 'package:exam_prep_tool/app/data/modal/profile/profile_updated.dart';

import 'package:exam_prep_tool/app/data/modal/signup/forget_password_response.dart';
import 'package:exam_prep_tool/app/data/modal/test_series/random_question_testseries.dart';
import 'package:exam_prep_tool/app/data/modal/test_series/submit_testseries_modal.dart';
import 'package:exam_prep_tool/app/data/modal/test_series/weekley_testSeries.dart';
import 'package:exam_prep_tool/app/data/modal/verify_payments.dart';
import 'package:exam_prep_tool/app/data/modal/vidio_lecturesresponse/get_exam_id.dart';
import 'package:exam_prep_tool/app/data/modal/vidio_lecturesresponse/vidio_lecturesresponse.dart';
import 'package:exam_prep_tool/app/data/modal/signup/send_otp_response.dart';
import 'package:exam_prep_tool/app/data/modal/signup/signup_response.dart';
import 'package:exam_prep_tool/app/utils/const.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
part 'app_apis.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class AppApis {
  factory AppApis(Dio dio, {String baseUrl}) = _AppApis;
  @POST('user/login')
  // ignore: avoid_types_as_parameter_names
  Future<HttpResponse<LoginResponse>> auth(@Body() loginparams);
  @POST('user/generateOTP')
  Future<HttpResponse<SignupResponse>> signup(@Body() sendOtpResponse);
  @POST('user/verifyOTP')
  Future<HttpResponse<OtpResponse>> otpverify(@Body() otpparams);
  @POST('user/forgot-password')
  Future<HttpResponse<ForgetpasswordResponse>> fogretpass(
      @Body() forgetpassparams);
  @POST('user/password-reset')
  Future<HttpResponse<ChangePassword>> changepassword(
      @Header("Authorization") String token, @Body() changepassParams);
  @POST('user/send-passwordOTP')
  Future<HttpResponse<SendOtpResponse>> sendotprespo(@Body() sendOtpParams);
  @GET('course')
  Future<HttpResponse<Courses>> getcourses(
    @Query("userId") String userId,
    @Query("sort") String sortedby,
  );
  @GET("uploadData/list")
  Future<HttpResponse<VidioLecturesresponse>> getList(
    @Query("exam") String exam,
    //@Query("subject") String subject,
    //@Query("uploadType") String uploadType,
  );
  //// get exam id
  @GET("course")
  Future<HttpResponse<GetExamid>> getexamid();
  @GET("uploadData/list")
  Future<HttpResponse<VidioLecturesresponse>> getvidioList(
    @Query("exam") String exam,
    @Query("subject") String subject,
    @Query("uploadType") String uploadType,
    @Query("sort") String sortedby,
  );

  @POST('payment/pay')
  Future<HttpResponse<Payments>> payments(
      @Header("Authorization") String token, @Body() paymentParams);
  @POST('payment/purchase')
  Future<HttpResponse<Verifypayments>> verifypayments(@Body() verifypayment);
  @GET("courseBuy/check/{id}")
  Future<HttpResponse<BuyCourses>> checkCourseBuy(@Path("id") String userId);
  @GET("user/edit/{userId}")
  Future<HttpResponse<EditProfile>> editUser(
    @Path("userId") String userId,
    @Header("Authorization") String token,
  );
  @POST('user/update')
  Future<HttpResponse<ProfileUpdated>> updateProfile(
    @Body() updateProfileParams,
    @Header("Authorization") String token,
  );
  @GET('courseCategory/list')
  Future<HttpResponse<CoursesCategory>> getCoursescategory(
    @Query("sort") String sortedby,
  );

  //categoryfilter
  @GET('course')
  Future<HttpResponse<CategoriesFilter>> getFiltercategory(
    @Query("userId") String userId,
    @Query("category") String category,
  );
  @GET('user/checkToken')
  Future<HttpResponse<CheckToken>> onedevicelogin(
    @Header("Authorization") String token,
  );

  @GET('liveChannel/list')
  Future<HttpResponse<Livechnalelist>> livelectureslist(
    @Query('courseId') String id,
    @Header("Authorization") String token,
  );
  @GET('courseModule/list')
  Future<HttpResponse<CirculamModalList>> circulimdatalist(
    @Query('courseId') String id,
  );
  // accountr referral

  @GET('user/referred/{userId}')
  Future<HttpResponse<AccounteferralModal>> referraldatalist(
    @Path("userId") String userId,
    @Header("Authorization") String token,
  );
  // courseBuy/listByReferral/ept586sub
  @GET('courseBuy/listByReferral/{referID}')
  Future<HttpResponse<SubscriptioneferralModal>> subscriptionreferrallist(
    @Path("referID") String referID,
    @Header("Authorization") String token,
  );
  @GET('user/check-referral/{referalID}')
  Future<HttpResponse<CheckReferralcode>> checkreferrallist(
    @Path("referalID") String referalID,
    @Query("userId") String userId,
    @Header("Authorization") String token,
  );
  //////////////////// testSeries

  @GET('test')
  Future<HttpResponse<WeeklyTestseriesModal>> weeklytestseries(
    @Query("subject") String subject,
    @Query("examId") String courseid,
  );
  //test/id/668b8c6d024fee047e44b9a1
  @GET('test/id/{testId}')
  Future<HttpResponse<RandomQuestionTestseriesModal>> randomqueslist(
    @Path("testId") String testId,
  );
  //SumitAnswerForTestSeies
  @POST('testAnswer/create')
  Future<HttpResponse<SubmitTestseriesModal>> testSeriesAnswer(
      @Header("Authorization") String token, @Body() submitAnswerparams);
}
