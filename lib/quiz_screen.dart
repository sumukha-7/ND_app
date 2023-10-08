// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:nihongo_dekita/controllers/question_controller.dart';
import 'package:nihongo_dekita/quiz_body.dart';

class QuizScreen extends StatelessWidget {
  final String userName;
  const QuizScreen({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          Obx(() => _controller.isLoading.value
              ? Container()
              : ElevatedButton(
                  onPressed: _controller.nextQuestion,
                  child: const Text("Skip"),
                )),
        ],
      ),
      body: Obx(() {
        if (_controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return const QuizBody();
        }
      }),
    );
  }
}
