import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:nihongo_dekita/controllers/question_controller.dart';
import 'package:nihongo_dekita/welcome_screen.dart';

void main() {
  runApp(const MyApp());
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

InputDecoration customInputDecoration({String? hintText}) {
  return InputDecoration(
      hintText: hintText,
      hintStyle: const TextStyle(color: Color.fromARGB(255, 190, 182, 182)),
      filled: true,
      fillColor: const Color.fromARGB(255, 54, 132, 196),
      enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
          borderRadius: BorderRadius.all(Radius.circular(12))),
      focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 100, 181, 246)),
          borderRadius: BorderRadius.all(Radius.circular(12))));
}
