import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

final List<String> _keys = [
  'samui',
  'kaze',
  'chika',
  'ushiro',
  'yama',
  'higashi'
];
final List<String> _values = [
  'cold',
  'wind',
  'underground',
  'behind',
  'mountain',
  'east'
];
Future<void> fetchRandomPairs() async {
  final response = await http.get(Uri.parse('http://127.0.0.1:5000/'));

  if (response.statusCode == 200) {
    final jsonData = json.decode(response.body);

    _keys.clear();
    _values.clear();

    for (final entry in jsonData.entries) {
      _keys.add(entry.key);
      _values.add(entry.value);
    }
  } else {
    print('Failed to fetch random pairs: ${response.statusCode}');
  }
}

class ButtonValues extends StatefulWidget {
  final bool textType;
  final int index;

  ButtonValues(this.textType, this.index);

  @override
  _ButtonValuesState createState() => _ButtonValuesState();
}

class _ButtonValuesState extends State<ButtonValues> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(const EdgeInsets.all(8)),
        backgroundColor: MaterialStateProperty.all(
          isSelected ? Colors.red : Colors.grey[300],
        ),
      ),
      onPressed: () {
        setState(() {
          isSelected = !isSelected;
        });

        if (!widget.textType) {
          // For the first six buttons, toggle selection
          // by changing the background color to red
        } else {
          // For the next six buttons, check if it's a correct pair
          bool isPairCorrect = _keys[widget.index] == _values[widget.index];
          if (isPairCorrect) {
            // Set both buttons to green
          } else {
            // Reset the selection on the first column
          }
        }
      },
      child: SizedBox(
        width: 100,
        height: 50,
        child: Align(
          child: Text(
            widget.textType ? _values[widget.index] : _keys[widget.index],
          ),
        ),
      ),
    );
  }
}
