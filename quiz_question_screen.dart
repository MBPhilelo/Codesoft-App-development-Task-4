import 'package:flutter/material.dart';
import 'result_screen.dart';

class QuizQuestionScreen extends StatefulWidget {
  final int quizIndex;

  QuizQuestionScreen({required this.quizIndex});

  @override
  _QuizQuestionScreenState createState() => _QuizQuestionScreenState();
}

class _QuizQuestionScreenState extends State<QuizQuestionScreen> {
  final List<List<Map<String, Object>>> quizzes = [
    // Quiz 1
    [
      {
        'question': 'Which planet in the Solar System is the smallest?',
        'options': ['Pluto', 'Earth', 'Mercury', 'Mars'],
        'answer': 'Mercury',
      },
      {
        'question': 'What does HTML stand for?',
        'options': [
          'Hyper Transfer Markup Language',
          'Hyper Text Makeup Language',
          'Hyper Text Markup Language',
          'High Transfer Markup Language',
        ],
        'answer': 'Hyper Text Markup Language',
      },
      {
        'question': 'Which gas is most abundant in the Earth’s atmosphere?',
        'options': ['Oxygen', 'Hydrogen', 'Nitrogen', 'Carbon Dioxide'],
        'answer': 'Nitrogen',
      },
      {
        'question': 'What is the capital of France?',
        'options': ['Paris', 'London', 'Berlin', 'Madrid'],
        'answer': 'Paris',
      },
    ],
    // Quiz 2
    [
      {
        'question': 'Which element has the chemical symbol O?',
        'options': ['Oxygen', 'Gold', 'Osmium', 'Oganesson'],
        'answer': 'Oxygen',
      },
      {
        'question': 'Who developed the theory of relativity?',
        'options': [
          'Isaac Newton',
          'Galileo Galilei',
          'Albert Einstein',
          'Nikola Tesla',
        ],
        'answer': 'Albert Einstein',
      },
      {
        'question': 'What is the hardest natural substance on Earth?',
        'options': ['Iron', 'Diamond', 'Gold', 'Silver'],
        'answer': 'Diamond',
      },
      {
        'question': 'What is the capital of Japan?',
        'options': ['Beijing', 'Seoul', 'Bangkok', 'Tokyo'],
        'answer': 'Tokyo',
      },
    ],
    // Quiz 3
    [
      {
        'question': 'What is the chemical symbol for water?',
        'options': ['O2', 'H2O', 'CO2', 'H2'],
        'answer': 'H2O',
      },
      {
        'question': 'Who is known as the father of computers?',
        'options': [
          'Charles Babbage',
          'Alan Turing',
          'Bill Gates',
          'Steve Jobs',
        ],
        'answer': 'Charles Babbage',
      },
      {
        'question': 'Which planet is known as the Red Planet?',
        'options': ['Earth', 'Venus', 'Mars', 'Jupiter'],
        'answer': 'Mars',
      },
      {
        'question': 'What is the capital of Australia?',
        'options': ['Sydney', 'Melbourne', 'Brisbane', 'Canberra'],
        'answer': 'Canberra',
      },
    ],
  ];

  int _currentQuestionIndex = 0;
  int _score = 0;
  String? _selectedOption;

  void _nextQuestion() {
    if (_selectedOption == quizzes[widget.quizIndex][_currentQuestionIndex]['answer']) {
      _score++;
    }
    setState(() {
      _selectedOption = null;
      if (_currentQuestionIndex < quizzes[widget.quizIndex].length - 1) {
        _currentQuestionIndex++;
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ResultScreen(score: _score),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz Question'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              quizzes[widget.quizIndex][_currentQuestionIndex]['question'] as String,
              style: TextStyle(fontSize: 18),
            ),
            ...(quizzes[widget.quizIndex][_currentQuestionIndex]['options'] as List<String>).map((option) {
              return RadioListTile<String>(
                title: Text(option),
                value: option,
                groupValue: _selectedOption,
                onChanged: (value) {
                  setState(() {
                    _selectedOption = value;
                  });
                },
              );
            }).toList(),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _nextQuestion,
              child: Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}
