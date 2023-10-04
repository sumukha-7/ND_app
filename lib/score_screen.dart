import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nihongo_dekita/QuestionController.dart';
import 'package:nihongo_dekita/welcome_screen.dart';

class ScoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    QuestionController _qnController = Get.put(QuestionController());
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
              SizedBox(
                height: 20,
              ),
              Text(
                "${_qnController.numOfCorrectAns * 10}/${_qnController.questions.length * 10}",
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 28,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    _qnController.reset();
                    Get.offAll(() => WelcomeScreen());
                  },
                  child: const Text(
                    "Play again!",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )),
              const Spacer(flex: 3),
            ],
          )
        ],
      ),
    );
  }
}
