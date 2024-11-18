import 'package:exam_prep_tool/app/data/modal/Referralmodal/account_refferal_modal.dart';
import 'package:exam_prep_tool/app/data/modal/Referralmodal/check_referralcode_modal.dart';
import 'package:exam_prep_tool/app/data/modal/categories_filterdata.dart';
import 'package:exam_prep_tool/app/data/modal/circulam_lists/circulam_modal.dart';
import 'package:exam_prep_tool/app/data/modal/course.dart';
import 'package:exam_prep_tool/app/data/modal/courses_category.dart';
import 'package:exam_prep_tool/app/data/modal/notes_filterlist/notes_fiterlist.dart';
import 'package:exam_prep_tool/app/data/modal/subjectfilterlist/subjectfilter.dart';

import 'package:exam_prep_tool/app/data/modal/vidio_lecturesresponse/get_exam_id.dart';
//import 'package:exam_prep_tool/app/data/modal/pys_question/pys_question.dart';
//import 'package:exam_prep_tool/app/data/modal/courses/courses.dart';
import 'package:exam_prep_tool/app/data/modal/vidio_lecturesresponse/vidio_lecturesresponse.dart';
import 'package:exam_prep_tool/app/utils/utils.dart';

import '../modal/Referralmodal/subscription_referal_modal.dart';

abstract class CourseRepo {
  Future<DataState<Courses>> getcourses(String userId, String sortedby);

  Future<DataState<VidioLecturesresponse>> getList(
    String exam,
  );

  Future<DataState<VidioLecturesresponse>> getvidioList(
      String exam, String subject, String uploadType, String sortedby);
  // Future<DataState<Twentrypyqpdf>> getpysQues(
  //     String upload, String exam, String subject);
  // Future<DataState<PysQuestion>> getPyqsId(
  //   String upload,
  // );

  Future<DataState<GetExamid>> getexamid();
  Future<DataState<CoursesCategory>> getCoursescategory(String sortedby);
  Future<DataState<CategoriesFilter>> getFiltercategory(
      String userid, String category);
  Future<DataState<CirculamModalList>> circulimdatalist(
    String userid,
  );
  // Acconmt referral
  Future<DataState<AccounteferralModal>> referraldatalist(
      String userid, String token);
  Future<DataState<SubscriptioneferralModal>> subscriptionreferrallist(
      referID, String token);
  Future<DataState<CheckReferralcode>> checkreferrallist(
      referalID, UserId, String token);
// subject filter
  Future<DataState<SubjectfilterlistModal>> getsSubjectfilterlist(
      String sortedby);
  Future<DataState<PyqandNotesfilter>> getpyqlist(
      String subject, String uploadType);
}
