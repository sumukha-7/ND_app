import 'package:flutter/material.dart';

class ButtonValues extends StatelessWidget {
  ButtonValues({super.key});

  final List _buttons = ['test1', 'test2', 'test3', 'test4', 'test5', 'test6'];

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(const EdgeInsets.all(8)),
        backgroundColor: MaterialStateProperty.all(Colors.grey[300]),
      ),
      onPressed: () {},
      child: const SizedBox(
        width: 100,
        height: 50,
        child: Align(child: Text('test')),
      ),
    );
  }
}
