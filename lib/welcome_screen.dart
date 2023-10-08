import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nihongo_dekita/quiz_screen.dart';
import 'package:nihongo_dekita/controllers/question_controller.dart';
import 'package:nihongo_dekita/upload_data.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<QuestionController>();
    final nameController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.blue[300],
      body: SafeArea(
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
                  fontSize: 32,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "Enter name to start",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const Spacer(flex: 1),
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                    filled: true,
                    fillColor: Color.fromARGB(255, 54, 132, 196),
                    hintText: "おなまえ を おねがいします",
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 100, 181, 246)),
                        borderRadius: BorderRadius.all(Radius.circular(12)))),
              ),
              const Spacer(flex: 1),
              InkWell(
                onTap: () async {
                  controller.userName = nameController.text;
                  await controller.reset('vocab');
                  Get.to(() => QuizScreen(userName: nameController.text));
                  controller.startTimer();
                },
                child: _buildButton("Start vocab quiz"),
              ),
              const SizedBox(height: 20),
              InkWell(
                onTap: () async {
                  controller.userName = nameController.text;
                  await controller.reset('kanji');
                  Get.to(() => QuizScreen(userName: nameController.text));
                  controller.startTimer();
                },
                child: _buildButton("Start kanji quiz", isKanjiButton: true),
              ),
              const Spacer(flex: 2),
              Center(
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromARGB(255, 11, 15, 224))),
                    onPressed: () {
                      Get.to(() => const UploadDataScreen());
                    },
                    child: const Text(
                      "Upload your data!",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    )),
              ),
              const Spacer(flex: 1)
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton(String text, {bool isKanjiButton = false}) {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: isKanjiButton
                  ? [
                      const Color.fromARGB(255, 202, 153, 30),
                      const Color.fromARGB(255, 255, 215, 0)
                    ]
                  : [
                      const Color.fromRGBO(76, 176, 192, 1),
                      const Color.fromRGBO(66, 221, 198, 1)
                    ]),
          borderRadius: const BorderRadius.all(Radius.circular(12))),
      child: Text(
        text,
        style: const TextStyle(
            fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }
}
