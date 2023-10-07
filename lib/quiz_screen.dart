import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:nihongo_dekita/QuestionController.dart';
import 'package:nihongo_dekita/QuizBody.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

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
          return QuizBody();
        }
      }),
    );
  }
}
