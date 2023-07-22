import 'package:flutter/material.dart';
import 'package:nihongo_dekita/button_values.dart';

void main() {
  //WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: mainPage(),
    );
  }
}

// ignore: camel_case_types
class mainPage extends StatefulWidget {
  const mainPage({super.key});

  @override
  State<mainPage> createState() => _mainPageState();
}

Map<String, String> data = {};

// ignore: camel_case_types
class _mainPageState extends State<mainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue.shade50,
      appBar: AppBar(
        title: const Text("Match the pairs"),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 44),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 42),
                  child: Column(
                    children: [
                      ButtonValues(),
                      const SizedBox(
                        height: 20,
                      ),
                      ButtonValues(),
                      const SizedBox(
                        height: 20,
                      ),
                      ButtonValues(),
                      const SizedBox(
                        height: 20,
                      ),
                      ButtonValues(),
                      const SizedBox(
                        height: 20,
                      ),
                      ButtonValues(),
                      const SizedBox(
                        height: 20,
                      ),
                      ButtonValues(),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 42),
                  child: Column(
                    children: [
                      ButtonValues(),
                      const SizedBox(
                        height: 20,
                      ),
                      ButtonValues(),
                      const SizedBox(
                        height: 20,
                      ),
                      ButtonValues(),
                      const SizedBox(
                        height: 20,
                      ),
                      ButtonValues(),
                      const SizedBox(
                        height: 20,
                      ),
                      ButtonValues(),
                      const SizedBox(
                        height: 20,
                      ),
                      ButtonValues(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
