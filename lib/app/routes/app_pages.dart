import 'package:get/get.dart';

import '../modules/account_referal/bindings/account_referal_binding.dart';
import '../modules/account_referal/views/account_referal_view.dart';
import '../modules/air_notes/bindings/air_notes_binding.dart';
import '../modules/air_notes/views/air_notes_view.dart';
import '../modules/air_testseries/bindings/air_testseries_binding.dart';
import '../modules/air_testseries/views/air_testseries_view.dart';
import '../modules/change_passScreen/bindings/change_pass_screen_binding.dart';
import '../modules/change_passScreen/views/change_pass_screen_view.dart';
import '../modules/contact_uspage/bindings/contact_uspage_binding.dart';
import '../modules/contact_uspage/views/contact_uspage_view.dart';
import '../modules/course_screen/bindings/course_screen_binding.dart';
import '../modules/course_screen/views/course_screen_view.dart';
import '../modules/course_subscribe/bindings/course_subscribe_binding.dart';
import '../modules/course_subscribe/views/course_subscribe_view.dart';
import '../modules/courses_categories/bindings/categories_binding.dart';
import '../modules/courses_categories/views/categories_view.dart';
import '../modules/cupan_discount/bindings/cupan_discount_binding.dart';
import '../modules/cupan_discount/views/cupan_discount_view.dart';
import '../modules/edit_proile/bindings/edit_proile_binding.dart';
import '../modules/edit_proile/views/edit_proile_view.dart';
import '../modules/faq_screen/bindings/faq_screen_binding.dart';
import '../modules/faq_screen/views/faq_screen_view.dart';
import '../modules/forgetpass_screen/bindings/forgetpass_screen_binding.dart';
import '../modules/forgetpass_screen/views/forgetpass_screen_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/live_letcture/bindings/live_letcture_binding.dart';
import '../modules/live_letcture/views/live_letcture_view.dart';
import '../modules/login_screen/bindings/login_screen_binding.dart';
import '../modules/login_screen/views/login_screen_view.dart';
import '../modules/more_courses/bindings/more_courses_binding.dart';
import '../modules/more_courses/views/more_courses_view.dart';
import '../modules/mystory_page/bindings/mystory_page_binding.dart';
import '../modules/mystory_page/views/mystory_page_view.dart';
import '../modules/otp_screen/bindings/otp_screen_binding.dart';
import '../modules/otp_screen/views/otp_screen_view.dart';
import '../modules/play_vidio/bindings/play_vidio_binding.dart';
import '../modules/play_vidio/views/play_vidio_view.dart';
import '../modules/privacy_policypage/bindings/privacy_policypage_binding.dart';
import '../modules/privacy_policypage/views/privacy_policypage_view.dart';
import '../modules/proile_page/bindings/proile_page_binding.dart';
import '../modules/proile_page/views/proile_page_view.dart';
import '../modules/razor_pay_window/binding/razor_pay_binding.dart';
import '../modules/razor_pay_window/view/razor_pay_windoe.dart';
import '../modules/referal/bindings/referal_binding.dart';
import '../modules/referal/views/referal_view.dart';
import '../modules/resetpass_screen/bindings/resetpass_screen_binding.dart';
import '../modules/resetpass_screen/views/resetpass_screen_view.dart';
import '../modules/resolve_doubtpage/bindings/resolve_doubtpage_binding.dart';
import '../modules/resolve_doubtpage/views/resolve_doubtpage_view.dart';
import '../modules/select_coursesScreen/bindings/select_courses_screen_binding.dart';
import '../modules/select_coursesScreen/views/select_courses_screen_view.dart';
import '../modules/selected_vidiolecture/bindings/selected_vidiolecture_binding.dart';
import '../modules/selected_vidiolecture/views/selected_vidiolecture_view.dart';
import '../modules/settings_page/bindings/settings_page_binding.dart';
import '../modules/settings_page/views/settings_page_view.dart';
import '../modules/show_pdf_View/bindings/show_pdf_view_binding.dart';
import '../modules/show_pdf_View/views/show_pdf_view_view.dart';
import '../modules/signup_screen/bindings/signup_screen_binding.dart';
import '../modules/signup_screen/views/signup_screen_view.dart';
import '../modules/splash_screen/bindings/splash_screen_binding.dart';
import '../modules/splash_screen/views/splash_screen_view.dart';
import '../modules/terms_conditionscreen/bindings/terms_conditionscreen_binding.dart';
import '../modules/terms_conditionscreen/views/terms_conditionscreen_view.dart';
import '../modules/testactive_screen/bindings/testactive_screen_binding.dart';
import '../modules/testactive_screen/views/testactive_screen_view.dart';
import '../modules/testsearis/bindings/testsearis_binding.dart';
import '../modules/testsearis/views/testsearis_view.dart';
import '../modules/testseries_Answer_detailpage/bindings/testseries_answer_detailpage_binding.dart';
import '../modules/testseries_Answer_detailpage/views/testseries_answer_detailpage_view.dart';
import '../modules/testseries_instruction/bindings/testseries_instruction_binding.dart';
import '../modules/testseries_instruction/views/testseries_instruction_view.dart';
import '../modules/testseries_mcq/bindings/testseries_mcq_binding.dart';
import '../modules/testseries_mcq/views/testseries_mcq_view.dart';
import '../modules/twenypys_question/bindings/twenypys_question_binding.dart';
import '../modules/twenypys_question/views/twenypys_question_view.dart';
import '../modules/verify_user/bindings/un_authorized_person_binding.dart';
import '../modules/verify_user/views/un_authorized_person_view.dart';

//import '../modules/test_Series_purchase/bindings/test_series_purchase_binding.dart';
//import '../modules/test_Series_purchase/views/test_series_purchase_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH_SCREEN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => const SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN_SCREEN,
      page: () => const LoginScreenView(),
      binding: LoginScreenBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP_SCREEN,
      page: () => const SignupScreenView(),
      binding: SignupScreenBinding(),
    ),
    GetPage(
      name: _Paths.FORGETPASS_SCREEN,
      page: () => const ForgetpassScreenView(),
      binding: ForgetpassScreenBinding(),
    ),
    GetPage(
      name: _Paths.RESETPASS_SCREEN,
      page: () => const ResetpassScreenView(),
      binding: ResetpassScreenBinding(),
    ),
    GetPage(
      name: _Paths.RESOLVE_DOUBTPAGE,
      page: () => const ResolveDoubtpageView(),
      binding: ResolveDoubtpageBinding(),
    ),
    GetPage(
      name: _Paths.MORE_COURSES,
      page: () => const MoreCoursesView(),
      binding: MoreCoursesBinding(),
    ),
    GetPage(
      name: _Paths.SETTINGS_PAGE,
      page: () => const SettingsPageView(),
      binding: SettingsPageBinding(),
    ),
    GetPage(
      name: _Paths.CONTACT_USPAGE,
      page: () => const ContactUspageView(),
      binding: ContactUspageBinding(),
    ),
    GetPage(
      name: _Paths.MYSTORY_PAGE,
      page: () => const MystoryPageView(),
      binding: MystoryPageBinding(),
    ),
    GetPage(
      name: _Paths.COURSE_SCREEN,
      page: () => const CourseScreenView(),
      binding: CourseScreenBinding(),
    ),
    GetPage(
      name: _Paths.COURSE_SUBSCRIBE,
      page: () => const CourseSubscribeView(),
      binding: CourseSubscribeBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PROILE,
      page: () => const EditProileView(),
      binding: EditProileBinding(),
    ),
    GetPage(
      name: _Paths.PROILE_PAGE,
      page: () => const ProilePageView(),
      binding: ProilePageBinding(),
    ),
    GetPage(
      name: _Paths.FAQ_SCREEN,
      page: () => const FaqScreenView(),
      binding: FaqScreenBinding(),
    ),
    GetPage(
      name: _Paths.TERMS_CONDITIONSCREEN,
      page: () => const TermsConditionscreenView(),
      binding: TermsConditionscreenBinding(),
    ),
    GetPage(
      name: _Paths.PRIVACY_POLICYPAGE,
      page: () => const PrivacyPolicypageView(),
      binding: PrivacyPolicypageBinding(),
    ),
    GetPage(
      name: _Paths.CHANGE_PASS_SCREEN,
      page: () => const ChangePassScreenView(),
      binding: ChangePassScreenBinding(),
    ),
    GetPage(
      name: _Paths.AIR_NOTES,
      page: () => const AirNotesView(),
      binding: AirNotesBinding(),
    ),
    GetPage(
      name: _Paths.AIR_TESTSERIES,
      page: () => AirTestseriesView(),
      binding: AirTestseriesBinding(),
    ),
    GetPage(
      name: _Paths.TWENYPYS_QUESTION,
      page: () => TwenypysQuestionView(),
      binding: TwenypysQuestionBinding(),
    ),
    GetPage(
      name: _Paths.SELECT_COURSES_SCREEN,
      page: () => const SelectCoursesScreenView(),
      binding: SelectCoursesScreenBinding(),
    ),
    GetPage(
      name: _Paths.SELECTED_VIDIOLECTURE,
      page: () => SelectedVidiolectureView(),
      binding: SelectedVidiolectureBinding(),
    ),
    GetPage(
      name: _Paths.SHOW_PDF_VIEW,
      page: () => const ShowPdfViewView(),
      binding: ShowPdfViewBinding(),
    ),
    GetPage(
      name: _Paths.OTP_SCREEN,
      page: () => const OtpScreenView(),
      binding: OtpScreenBinding(),
    ),
    GetPage(
      name: _Paths.PLAY_VIDIO,
      page: () => PlayVidioView(),
      binding: PlayVidioBinding(),
    ),
    GetPage(
      name: _Paths.UN_AUTHORIZED_PERSON,
      page: () => const UnAuthorizedPersonView(),
      binding: UnAuthorizedPersonBinding(),
    ),
    GetPage(
      name: _Paths.RAZOR_PAY_WINDOW,
      page: () => const RazorpayWindowPageView(),
      binding: RazorpayWindowBinding(),
    ),
    GetPage(
      name: _Paths.CUPAN_DISCOUNT,
      page: () => const CupanDiscountView(),
      binding: CupanDiscountBinding(),
    ),
    GetPage(
      name: _Paths.CATEGORIES,
      page: () => const CategoriesView(),
      binding: CategoriesBinding(),
    ),
    GetPage(
      name: _Paths.LIVE_LETCTURE,
      page: () => const LiveLetctureView(),
      binding: LiveLetctureBinding(),
    ),
    GetPage(
      name: _Paths.REFERAL,
      page: () => ReferalView(),
      binding: ReferalBinding(),
    ),
    GetPage(
      name: _Paths.ACCOUNT_REFERAL,
      page: () => const AccountReferalView(),
      binding: AccountReferalBinding(),
    ),
    GetPage(
      name: _Paths.TESTSEARIS,
      page: () => const TestsearisView(),
      binding: TestsearisBinding(),
    ),
    GetPage(
      name: _Paths.TESTSERIES_INSTRUCTION,
      page: () => TestseriesInstructionView(),
      binding: TestseriesInstructionBinding(),
    ),
    GetPage(
      name: _Paths.TESTSERIES_MCQ,
      page: () => TestseriesMcqView(),
      binding: TestseriesMcqBinding(),
    ),
    GetPage(
      name: _Paths.TESTACTIVE_SCREEN,
      page: () => const TestactiveScreenView(),
      binding: TestactiveScreenBinding(),
    ),
    GetPage(
      name: _Paths.TESTSERIES_ANSWER_DETAILPAGE,
      page: () => const TestseriesAnswerDetailpageView(),
      binding: TestseriesAnswerDetailpageBinding(),
    ),
  ];
}
