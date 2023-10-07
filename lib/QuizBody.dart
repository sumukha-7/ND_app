// ignore_for_file: no_leading_underscores_for_local_identifiers, file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nihongo_dekita/ProgressBar.dart';
import 'package:nihongo_dekita/QuestionCard.dart';
import 'package:nihongo_dekita/QuestionController.dart';

class QuizBody extends StatelessWidget {
  const QuizBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // So that we have acccess our controller
    QuestionController _questionController = Get.put(QuestionController());
    return Stack(
      children: [
        SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: ProgressBar(),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Obx(
                  () => Text.rich(
                    TextSpan(
                      text:
                          "Question ${_questionController.questionNumber.value}",
                      style: const TextStyle(
                          color: Color.fromARGB(255, 139, 148, 188)),
                      children: [
                        TextSpan(
                            text: "/${_questionController.questions.length}",
                            style: const TextStyle(
                                color: Color.fromARGB(255, 139, 148, 188))),
                      ],
                    ),
                  ),
                ),
              ),
              const Divider(thickness: 1.5),
              const SizedBox(height: 20),
              Expanded(
                child: PageView.builder(
                  // Block swipe to next qn
                  physics: const NeverScrollableScrollPhysics(),
                  controller: _questionController.pageController,
                  onPageChanged: _questionController.updateTheQnNum,
                  itemCount: _questionController.questions.length,
                  itemBuilder: (context, index) => QuestionCard(
                      question: _questionController.questions[index]),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
