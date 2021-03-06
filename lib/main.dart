import 'package:flutter/material.dart';
import 'package:quizzler/quiz_brain.dart';
import 'alert.dart';

QuizBrain quizBrain = QuizBrain();

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];

  void checkAnswer(bool answerGiven){
    bool correctAnswer = quizBrain.getAnswer();

    setState(() {
      if(correctAnswer == answerGiven){
          scoreKeeper.add(Icon(Icons.check, color: Colors.green,),);
      } else {
          scoreKeeper.add(Icon(Icons.close, color: Colors.red,),);
      }
      quizBrain.nextQuestion();
    });
  }

  void resetQuestionBank(){
    setState(() {
      showAlert(context);
      quizBrain.resetQuestionsBank();
      scoreKeeper.clear();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                (quizBrain.getQuestionNumber() + 1).toString() + '.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 56
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestion(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                if(quizBrain.getQuestionNumber() == quizBrain.getQuestionBankLength() - 1){
                  resetQuestionBank();
                } else {
                  checkAnswer(true);
                }
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                if(quizBrain.getQuestionNumber() == quizBrain.getQuestionBankLength() - 1){
                  resetQuestionBank();
                } else {
                  checkAnswer(true);
                }
              },
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
