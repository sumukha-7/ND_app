// ignore_for_file: file_names, constant_identifier_names, non_constant_identifier_names

import 'dart:convert';
import 'package:http/http.dart' as http;

class Question {
  final int id, answer;
  final String question;
  final List<String> options;

  Question(
      {required this.id,
      required this.question,
      required this.answer,
      required this.options});

  // Function to fetch data from the data from API
  static Future<List<Question>> fetchQuestions({required String source}) async {
    final response =
        await http.get(Uri.parse('http://192.168.0.111:5000/$source'));

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse
          .map((data) => Question(
                id: data['id'],
                question: data['question'],
                answer: data['answer_index'],
                options: List<String>.from(data['options']),
              ))
          .toList();
    } else {
      throw Exception('Failed to load questions');
    }
  }
}

List<Question> sample_data = [];
