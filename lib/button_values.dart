import 'package:flutter/material.dart';

final List _keys = ['k1', 'k2', 'k3', 'k4', 'k5', 'k6'];
final List _values = ['v1', 'v2', 'v3', 'v4', 'v5', 'v6'];
// ignore: non_constant_identifier_names
ButtonValues(bool textType, int index) {
  return TextButton(
    style: ButtonStyle(
      padding: MaterialStateProperty.all(const EdgeInsets.all(8)),
      backgroundColor: MaterialStateProperty.all(Colors.grey[300]),
    ),
    onPressed: () {},
    child: SizedBox(
      width: 100,
      height: 50,
      child: Align(
        child: Text(
          textType ? _values[index] : _keys[index],
        ),
      ),
    ),
  );
}
