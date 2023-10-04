import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nihongo_dekita/quiz_screen.dart';
import 'package:nihongo_dekita/QuestionController.dart'; // Make sure to import QuestionController

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key); // Corrected this line

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(QuestionController());

    return Scaffold(
      backgroundColor: Colors.blue[300],
      body: Stack(children: [
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(flex: 2),
                const Text(
                  "Let's play nihongo quiz!",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Enter name to start",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 50),
                const TextField(
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Color.fromARGB(255, 54, 132, 196),
                      hintText: "Enter your name",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)))),
                ),
                const Spacer(flex: 2),
                InkWell(
                  onTap: () async {
                    await controller.reset('vocab');
                    Get.to(() => const QuizScreen());
                    controller.startTimer();
                  },
                  child: _buildButton("Start vocab quiz"),
                ),
                const SizedBox(height: 20),
                InkWell(
                  onTap: () async {
                    await controller.reset('kanji');
                    Get.to(() => const QuizScreen());
                    controller.startTimer();
                  },
                  child: _buildButton("Start kanji quiz"),
                ),
                const Spacer(flex: 2),
              ],
            ),
          ),
        ),
      ]),
    );
  }

  Widget _buildButton(String text) {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(15),
      decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(76, 176, 192, 1),
              Color.fromRGBO(66, 221, 198, 1)
            ],
          ),
          borderRadius: BorderRadius.all(Radius.circular(12))),
      child: Text(
        text,
        style: const TextStyle(
            fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }
}
