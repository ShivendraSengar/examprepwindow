import 'package:exam_prep_tool/app/data/modal/buycourses_modal.dart';
import 'package:exam_prep_tool/app/data/modal/live_lectures_list.dart';
import 'package:exam_prep_tool/app/data/modal/payments_modal.dart';
import 'package:exam_prep_tool/app/data/modal/verify_payments.dart';
import 'package:exam_prep_tool/app/data/params/paramspayments.dart';
//import 'package:exam_prep_tool/app/data/params/loginparams.dart';
import 'package:exam_prep_tool/app/data/params/veryfy_payments_params.dart';
import 'package:exam_prep_tool/app/utils/utils.dart';

abstract class PaymentsRepo {
  Future<DataState<Payments>> payments(Paramspayments param, String token);
  Future<DataState<Verifypayments>> verifypayments(VeryfyPaymentsParams param);
  Future<DataState<BuyCourses>> checkCourseBuy(String id);
  Future<DataState<Livechnalelist>> livelectureslist(String id, String token);
}
