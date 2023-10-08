import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:nihongo_dekita/controllers/question_controller.dart';
import 'package:nihongo_dekita/welcome_screen.dart';

void main() {
  runApp(MyApp());
  Get.put(QuestionController());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Nihongo Quiz",
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const WelcomeScreen(),
    );
  }
}
