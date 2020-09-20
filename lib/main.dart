import 'package:flutter/material.dart';
import 'package:quiz_app/model/question.dart';

void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: QuizApp(),
  ));
}

class QuizApp extends StatefulWidget {
  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  int _currentQuestionIndex = 0;

  List questionBank = [
    Question.name(
        "The U.S. Declaration of Indepandence was adopted in 1776.", true),
    Question.name("The Supreme law of the land is the constitution.", true),
    Question.name(
        "The two rights in the Declaration of Indepenedence are:"
        "   \n Life  "
        "   \nPursuit of happiness.",
        true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "True Citizen",
          ),
          centerTitle: true,
          backgroundColor: Colors.blueGrey,
        ),
        backgroundColor: Colors.blueGrey,
        body: Builder(
          builder: (BuildContext context) => Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Image.asset(
                    "images/flag.png",
                    width: 250.0,
                    height: 180.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(14.4),
                        border: Border.all(
                            color: Colors.blueGrey.shade400,
                            style: BorderStyle.solid)),
                    height: 120.0,
                    child: Center(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:
                          Text(questionBank[_currentQuestionIndex].questionText,
                              style: TextStyle(
                                fontSize: 16.9,
                                color: Colors.white,
                              )),
                    )),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    RaisedButton(
                      onPressed: () => _prevQuestion(),
                      color: Colors.blueGrey.shade900,
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                    RaisedButton(
                      onPressed: () => _checkAnswer(true, context),
                      color: Colors.blueGrey.shade900,
                      child: Text(
                        "TRUE",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    RaisedButton(
                      onPressed: () => _checkAnswer(false, context),
                      color: Colors.blueGrey.shade900,
                      child: Text(
                        "FALSE",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    RaisedButton(
                      onPressed: () => _nextQuestion(),
                      color: Colors.blueGrey.shade900,
                      child: Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Spacer(),
              ],
            ),
          ),
        ));
  }

  _checkAnswer(bool userChoice, BuildContext context) {
    if (userChoice == questionBank[_currentQuestionIndex].isCorrect) {
      final snackBar = SnackBar(
        backgroundColor: Colors.green,
        content: Text("Correct!"),
        duration: Duration(milliseconds: 500),
      );
      Scaffold.of(context).showSnackBar(snackBar);
      _updateQuestion();
    } else {
      final snackBar = SnackBar(
        backgroundColor: Colors.redAccent,
        content: Text("Incorrect!"),
        duration: Duration(milliseconds: 500),
      );
      Scaffold.of(context).showSnackBar(snackBar);
      _updateQuestion();
    }
  }

  _updateQuestion() {
    setState(() {
      _currentQuestionIndex = (_currentQuestionIndex + 1) % questionBank.length;
    });
  }

  _nextQuestion() {
    _updateQuestion();
  }

  _prevQuestion() {
    _currentQuestionIndex = (_currentQuestionIndex - 1) % questionBank.length;
  }
}
