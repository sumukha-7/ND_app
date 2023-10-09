// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nihongo_dekita/main.dart';
import 'package:nihongo_dekita/view_data.dart';
import 'controllers/upload_data_controller.dart';

class UploadDataScreen extends StatefulWidget {
  const UploadDataScreen({Key? key}) : super(key: key);

  @override
  _UploadDataScreenState createState() => _UploadDataScreenState();
}

class _UploadDataScreenState extends State<UploadDataScreen> {
  final UploadDataController _controller = Get.put(UploadDataController());
  final TextEditingController keyController = TextEditingController();
  final TextEditingController valueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[300],
      appBar: AppBar(
        title: const Text("Enter data to database"),
        backgroundColor: Colors.blue[300],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: Text(
                    "Kanji/Vocabulary field:",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                TextField(
                    controller: keyController,
                    decoration: customInputDecoration(
                        hintText: 'Enter japanese word here')),
                const Padding(
                  padding: EdgeInsets.only(bottom: 8, top: 20),
                  child: Text(
                    "Meaning field:",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                TextField(
                    controller: valueController,
                    decoration:
                        customInputDecoration(hintText: "Enter meaning here")),
                const Padding(
                  padding: EdgeInsets.only(bottom: 8, top: 20),
                  child: Text(
                    "Choose kanji or vocabulary:",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 54, 132, 196),
                    borderRadius: BorderRadius.circular(4.0),
                    border: Border.all(
                        color: const Color.fromARGB(255, 0, 0, 0), width: 1),
                  ),
                  child: Obx(
                    () => DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        dropdownColor: const Color.fromARGB(255, 54, 132, 196),
                        value: _controller.dropdownValue.value,
                        isExpanded: true,
                        icon: const Icon(Icons.arrow_drop_down,
                            color: Colors.white),
                        onChanged: (String? newValue) {
                          _controller.dropdownValue.value = newValue!;
                        },
                        items: <String>['kanji', 'vocabulary']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value,
                                style: const TextStyle(color: Colors.white)),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                Center(
                  child: ElevatedButton(
                      onPressed: () async {
                        await _controller.uploadData(
                            keyController.text, valueController.text);
                      },
                      child: const Text(
                        "Upload to database",
                        style: TextStyle(fontSize: 16),
                      )),
                ),
                const SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(() => ViewDataScreen());
                    },
                    child: const Text(
                      "View Stored Data",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
