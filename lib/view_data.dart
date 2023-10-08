// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:nihongo_dekita/data/db_helper.dart';

class ViewDataScreen extends StatefulWidget {
  @override
  _ViewDataScreenState createState() => _ViewDataScreenState();
}

class _ViewDataScreenState extends State<ViewDataScreen> {
  late Future<List<Map<String, dynamic>>> kanjiData;
  late Future<List<Map<String, dynamic>>> vocabData;

  @override
  void initState() {
    super.initState();
    _refreshData();
  }

  _refreshData() {
    setState(() {
      kanjiData = DatabaseHelper.db.getData('kanji');
      vocabData = DatabaseHelper.db.getData('vocabulary');
    });
  }

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
                      Color.fromARGB(255, 220, 16, 16))),
              onPressed: () async {
                await DatabaseHelper.db.clearTable('kanji');
                _refreshData();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text('Kanji data cleared successfully!')),
                );
              },
              child: const Text(
                "Clear Kanji Data",
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromARGB(255, 220, 16, 16))),
              onPressed: () async {
                await DatabaseHelper.db.clearTable('vocabulary');
                _refreshData();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text('Vocabulary data cleared successfully!')),
                );
              },
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
                  color: Colors.black),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: FutureBuilder<List<Map<String, dynamic>>>(
                future: kanjiData,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                      return Column(
                        children: snapshot.data!
                            .map((e) => ListTile(
                                  title: Text("${e['key']} : ${e['value']}",
                                      style:
                                          const TextStyle(color: Colors.black)),
                                ))
                            .toList(),
                      );
                    } else {
                      return const Text(
                        "No vocabulary data found.",
                        style: TextStyle(color: Colors.black),
                      );
                    }
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
              ),
            ),
            const Text(
              "Vocabulary data:",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.black),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: FutureBuilder<List<Map<String, dynamic>>>(
                future: vocabData,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                      return Column(
                        children: snapshot.data!
                            .map((e) => ListTile(
                                  title: Text(
                                    "${e['key']} : ${e['value']}",
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                ))
                            .toList(),
                      );
                    } else {
                      return const Text(
                        "No vocabulary data found.",
                        style: TextStyle(color: Colors.black),
                      );
                    }
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
