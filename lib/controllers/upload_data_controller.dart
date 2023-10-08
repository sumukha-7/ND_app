import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nihongo_dekita/data/db_helper.dart';

class UploadDataController extends GetxController {
  var dropdownValue = 'kanji'.obs;

  Future<void> uploadData(String key, String value) async {
    if (key.isNotEmpty && value.isNotEmpty) {
      await DatabaseHelper.db.insertData(dropdownValue.value, key, value);
      Get.snackbar(
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.white,
        'Success',
        '${dropdownValue.value} data uploaded successfully!',
        titleText: const Text(
          'Success',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
        ),
        messageText: Text(
          '${dropdownValue.value} data uploaded successfully!',
          style: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
        ),
      );
    } else {
      Get.snackbar(
        'Error',
        'Please fill in both fields!',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.white,
        titleText: const Text(
          'Error',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
        ),
        messageText: const Text(
          'Please fill in both fields!',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14),
        ),
      );
    }
  }
}
