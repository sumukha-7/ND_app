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
// ignore: non_constant_identifier_names

// ignore: camel_case_types
class _mainPageState extends State<mainPage> {
  @override
  void initState() {
    super.initState();
    fetchRandomPairs();
  }

  @override
  Widget build(BuildContext context) {
    List<int> key_index = [0, 1, 2, 3, 4, 5];
    key_index.shuffle();

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
                      ButtonValues(false, key_index[0]),
                      const SizedBox(
                        height: 20,
                      ),
                      ButtonValues(false, key_index[1]),
                      const SizedBox(
                        height: 20,
                      ),
                      ButtonValues(false, key_index[2]),
                      const SizedBox(
                        height: 20,
                      ),
                      ButtonValues(false, key_index[3]),
                      const SizedBox(
                        height: 20,
                      ),
                      ButtonValues(false, key_index[4]),
                      const SizedBox(
                        height: 20,
                      ),
                      ButtonValues(false, key_index[5]),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 42),
                  child: Column(
                    children: [
                      ButtonValues(true, 0),
                      const SizedBox(
                        height: 20,
                      ),
                      ButtonValues(true, 1),
                      const SizedBox(
                        height: 20,
                      ),
                      ButtonValues(true, 2),
                      const SizedBox(
                        height: 20,
                      ),
                      ButtonValues(true, 3),
                      const SizedBox(
                        height: 20,
                      ),
                      ButtonValues(true, 4),
                      const SizedBox(
                        height: 20,
                      ),
                      ButtonValues(true, 5),
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
