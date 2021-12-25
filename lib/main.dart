import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: HomeScreen(),
    ),
  );
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int questionIndex = 0;

  nextQuestion() {
    setState(() {
      questionIndex++;
    });
    print('pressed');
  }

  var question = [
    {
      'questionText': 'What\'s your favorite colour',
      'answers': ['red', 'Black', 'Yellow'],
    },
    {
      'questionText': 'What\'s your car',
      'answers': ['Lambo', 'Ferari', 'V8'],
    },
    {
      'questionText': 'Who is your favorite tutor',
      'answers': ['Samuel', 'Twumasi', 'Ankra'],
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My first app'),
        centerTitle: true,
      ),
      body: questionIndex < question.length
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Question(
                    question:
                        question[questionIndex]['questionText'] as String),
                ...(question[questionIndex]['answers'] as List<String>)
                    .map((answer) {
                  return Answer(
                    answer: answer,
                    selectHandler: nextQuestion,
                  );
                })
              ],
            )
          : const Center(
              child: Text('You are done'),
            ),
    );
  }
}

class Question extends StatelessWidget {
  final String question;
  // ignore: use_key_in_widget_constructors
  const Question({
    required this.question,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      width: double.infinity,
      child: Text(
        question,
        style: const TextStyle(fontSize: 28),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class Answer extends StatelessWidget {
  final String answer;
  final VoidCallback? selectHandler;
  // ignore: use_key_in_widget_constructors
  const Answer({required this.answer, this.selectHandler});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: selectHandler,
      child: SizedBox(
        width: double.infinity,
        child: Center(
          child: Text(
            answer,
          ),
        ),
      ),
    );
  }
}
