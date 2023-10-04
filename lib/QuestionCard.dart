import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nihongo_dekita/QuestionController.dart';
import 'package:nihongo_dekita/QuestionResult.dart';
import 'package:nihongo_dekita/Questions.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    Key? key,
    // it means we have to pass this
    required this.question,
  }) : super(key: key);

  final Question question;

  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          Text(
            question.question,
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
          SizedBox(height: 20),
          ...List.generate(
            question.options.length,
            (index) => QuestionResult(
              index: index,
              text: question.options[index],
              press: () => _controller.checkAns(question, index),
            ),
          ),
        ],
      ),
    );
  }
}
