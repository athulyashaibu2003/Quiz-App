import 'package:flutter/material.dart';
import 'package:git_sample/view/question%20screen/question_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: QuestionScreen(),
    );
  }
}
