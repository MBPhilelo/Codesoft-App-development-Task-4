import 'package:flutter/material.dart';
import 'quiz_question_screen.dart';

class QuizSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select a Quiz'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuizQuestionScreen(quizIndex: 0),
                  ),
                );
              },
              child: Text('Quiz 1'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuizQuestionScreen(quizIndex: 1),
                  ),
                );
              },
              child: Text('Quiz 2'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuizQuestionScreen(quizIndex: 2),
                  ),
                );
              },
              child: Text('Quiz 3'),
            ),
          ],
        ),
      ),
    );
  }
}

