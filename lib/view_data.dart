import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nihongo_dekita/controllers/view_data_controller.dart';

class ViewDataScreen extends StatelessWidget {
  final ViewDataController _controller = Get.put(ViewDataController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[300],
      appBar: AppBar(
        title: const Text("Your Stored Data"),
        backgroundColor: Colors.blue[300],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            const Text(
              "WARNING: ONCE THE DATA IS CLEARED, IT CANNOT BE RECOVERED!!",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  backgroundColor: Colors.yellow),
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    Color.fromARGB(255, 220, 16, 16)),
              ),
              onPressed: _controller.clearKanjiData,
              child: const Text(
                "Clear Kanji Data",
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    Color.fromARGB(255, 220, 16, 16)),
              ),
              onPressed: _controller.clearVocabData,
              child: const Text(
                "Clear Vocabulary Data",
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Kanji data:",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Colors.black,
              ),
            ),
            GetBuilder<ViewDataController>(
              builder: (controller) => Padding(
                padding: const EdgeInsets.all(20),
                child: controller.kanjiData.isNotEmpty
                    ? Column(
                        children: controller.kanjiData
                            .map(
                              (e) => ListTile(
                                title: Text("${e['key']} : ${e['value']}",
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 20)),
                              ),
                            )
                            .toList(),
                      )
                    : const Text(
                        "No kanji data found.",
                        style: TextStyle(color: Colors.black),
                      ),
              ),
            ),
            const Text(
              "Vocabulary data:",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Colors.black,
              ),
            ),
            GetBuilder<ViewDataController>(
              builder: (controller) => Padding(
                padding: const EdgeInsets.all(20),
                child: controller.vocabData.isNotEmpty
                    ? Column(
                        children: controller.vocabData
                            .map(
                              (e) => ListTile(
                                title: Text("${e['key']} : ${e['value']}",
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 20)),
                              ),
                            )
                            .toList(),
                      )
                    : const Text(
                        "No vocabulary data found.",
                        style: TextStyle(color: Colors.black),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
