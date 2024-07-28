import 'package:exam_prep_tool/app/data/modal/test_series/random_question_testseries.dart';
import 'package:exam_prep_tool/app/data/modal/test_series/submit_testseries_modal.dart';
import 'package:exam_prep_tool/app/data/modal/test_series/weekley_testSeries.dart';
import 'package:exam_prep_tool/app/utils/utils.dart';

abstract class TestSeriesRepo {
  Future<DataState<WeeklyTestseriesModal>> weeklytestseries(
      String subject, String courseid);

  Future<DataState<RandomQuestionTestseriesModal>> randomqueslist(
      String testId);

  Future<DataState<SubmitTestseriesModal>> testSeriesAnswer(
      token, submitAnswerparams);
}
