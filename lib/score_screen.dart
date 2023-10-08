// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nihongo_dekita/controllers/question_controller.dart';
import 'package:nihongo_dekita/welcome_screen.dart';

class ScoreScreen extends StatelessWidget {
  const ScoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    QuestionController _qnController = Get.find<QuestionController>();

    List<String> goodScore = [
      "Wow! you did it ${_qnController.userName}!",
      "Good job ${_qnController.userName}!",
      "Keep it up ${_qnController.userName}!",
      "Omedetou gozaimasu ${_qnController.userName}!"
    ];

    List<String> badScore = [
      "Daijoubu ${_qnController.userName}, you can try again!",
      "Daijoubu ${_qnController.userName}, ganbatte!",
      "Don't worry ${_qnController.userName}, you got this!",
      "Keep trying ${_qnController.userName}!"
    ];

    String getFeedbackMessage(int score) {
      Random rand = Random();
      if (score > 40) {
        return goodScore[rand.nextInt(goodScore.length)];
      } else {
        return badScore[rand.nextInt(badScore.length)];
      }
    }

    return Scaffold(
      backgroundColor: Colors.blue[300],
      body: Stack(
        fit: StackFit.expand,
        children: [
          Column(
            children: [
              const Spacer(flex: 3),
              const Text(
                "Score:",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 36,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "${_qnController.numOfCorrectAns * 10}/${_qnController.questions.length * 10}",
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 28,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                getFeedbackMessage(_qnController.numOfCorrectAns * 10),
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                  onPressed: () {
                    Get.offAll(() => const WelcomeScreen());
                  },
                  child: const Text(
                    "Play again!",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  )),
              const Spacer(flex: 3),
            ],
          )
        ],
      ),
    );
  }
}
