import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nihongo_dekita/data/db_helper.dart';

class ViewDataController extends GetxController {
  var kanjiData = <Map<String, dynamic>>[].obs;
  var vocabData = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    refreshData();
  }

  void refreshData() async {
    kanjiData.value = await DatabaseHelper.db.getData('kanji');
    vocabData.value = await DatabaseHelper.db.getData('vocabulary');
    update();
  }

  void clearKanjiData() async {
    await DatabaseHelper.db.clearTable('kanji');
    refreshData();
    Get.snackbar('Success', 'Kanji data cleared successfully!',
        titleText: const Text('Success',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16)),
        messageText: const Text('Kanji data cleared successfully!',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 14)));
  }

  void clearVocabData() async {
    await DatabaseHelper.db.clearTable('vocabulary');
    refreshData();
    Get.snackbar('Success', 'Vocabulary data cleared successfully!',
        titleText: const Text('Success',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16)),
        messageText: const Text('Vocabulary data cleared successfully!',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 14)));
  }
}
