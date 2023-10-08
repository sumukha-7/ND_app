// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nihongo_dekita/data/db_helper.dart';
import 'package:nihongo_dekita/view_data.dart';

class UploadDataScreen extends StatefulWidget {
  const UploadDataScreen({Key? key}) : super(key: key);

  @override
  _UploadDataScreenState createState() => _UploadDataScreenState();
}

class _UploadDataScreenState extends State<UploadDataScreen> {
  TextEditingController keyController = TextEditingController();
  TextEditingController valueController = TextEditingController();
  String dropdownValue = 'kanji';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[300],
      appBar: AppBar(
        title: const Text("Enter data to upload"),
        backgroundColor: Colors.blue[300],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: keyController,
              decoration: const InputDecoration(
                labelText: 'Key',
                filled: true,
                fillColor: Color.fromARGB(255, 54, 132, 196),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: valueController,
              decoration: const InputDecoration(
                labelText: 'Value',
                filled: true,
                fillColor: Color.fromARGB(255, 54, 132, 196),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 54, 132, 196),
                borderRadius: BorderRadius.circular(4.0),
                border: Border.all(color: Colors.grey, width: 1),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  dropdownColor: const Color.fromARGB(255, 54, 132, 196),
                  value: dropdownValue,
                  isExpanded: true,
                  icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                    });
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
            const SizedBox(height: 40),
            ElevatedButton(
                onPressed: () async {
                  if (keyController.text.isNotEmpty &&
                      valueController.text.isNotEmpty) {
                    await DatabaseHelper.db.insertData(dropdownValue,
                        keyController.text, valueController.text);
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Data uploaded successfully!')));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Please fill in both fields!')));
                  }
                },
                child: const Text(
                  "Upload to database",
                  style: TextStyle(fontSize: 16),
                )),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Get.to(() => ViewDataScreen());
              },
              child: const Text(
                "View Stored Data",
                style: TextStyle(fontSize: 16),
              ),
            )
          ],
        ),
      ),
    );
  }
}
