import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/testseries_answer_detailpage_controller.dart';

class TestseriesAnswerDetailpageView
    extends GetView<TestseriesAnswerDetailpageController> {
  const TestseriesAnswerDetailpageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TestseriesAnswerDetailpageView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'TestseriesAnswerDetailpageView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
