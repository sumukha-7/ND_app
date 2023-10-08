// ignore_for_file: avoid_print, prefer_final_fields, file_names

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:nihongo_dekita/Questions.dart';
import 'package:nihongo_dekita/score_screen.dart';

class QuestionController extends GetxController
    with GetSingleTickerProviderStateMixin {
  String? userName;
  late AnimationController _animationController;
  late Animation _animation;

  Animation get animation => _animation;

  late PageController _pageController;
  PageController get pageController => _pageController;

  var _questions = <Question>[].obs;
  List<Question> get questions => _questions;

  bool _isAnswered = false;
  bool get isAnswered => _isAnswered;

  late int _correctAns;
  int get correctAns => _correctAns;

  late int _selectedAns;
  int get selectedAns => _selectedAns;

  RxInt _questionNumber = 1.obs;
  RxInt get questionNumber => _questionNumber;

  int _numOfCorrectAns = 0;
  int get numOfCorrectAns => _numOfCorrectAns;

  var isLoading = true.obs;

  @override
  void onInit() {
    _animationController =
        AnimationController(duration: const Duration(seconds: 60), vsync: this);
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController)
      ..addListener(() {
        update();
      });

    _pageController = PageController();
    super.onInit();
  }

  void startTimer() {
    _animationController.forward().whenComplete(nextQuestion);
  }

  @override
  void onClose() {
    super.onClose();
    _animationController.dispose();
    _pageController.dispose();
  }

  void checkAns(Question question, int selectedIndex) {
    _isAnswered = true;
    _correctAns = question.answer;
    _selectedAns = selectedIndex;

    if (_correctAns == _selectedAns) _numOfCorrectAns++;

    _animationController.stop();
    update();

    Future.delayed(const Duration(seconds: 2), () {
      nextQuestion();
    });
  }

  void nextQuestion() {
    if (_questionNumber.value != _questions.length) {
      _isAnswered = false;
      _pageController.nextPage(
          duration: const Duration(milliseconds: 250), curve: Curves.ease);

      _animationController.reset();

      _animationController.forward().whenComplete(nextQuestion);
    } else {
      Get.off(const ScoreScreen());
    }
  }

  void updateTheQnNum(int index) {
    _questionNumber.value = index + 1;
  }

  Future<void> fetchAndSetQuestions(String source) async {
    isLoading.value = true;
    try {
      List<Question> fetchedQuestions =
          await Question.fetchQuestions(source: source);
      _questions.addAll(fetchedQuestions);
    } catch (e) {
      print("Failed to fetch questions: $e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> reset(String source) async {
    _questions.clear();
    await fetchAndSetQuestions(source);
    _isAnswered = false;
    _numOfCorrectAns = 0;
    _questionNumber.value = 1;
  }
}
