import 'package:flutter/material.dart';
import 'package:quizzler/main.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

final bucketGlobal = PageStorageBucket();

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage>{
  int score = 0;
  List <Widget> scoreKeeper = [];
  //int i = 0;
  // List <bool> answers =[false, true,true,];
  //
  // List <String> questions = [
  //   'You can lead a cow down stairs but not up stairs.',
  //   'Approximately one quarter of human bones are in the feet.',
  //   'A slug\'s blood is green.',
  // ];
  void checkAnswer(bool userAns){
    bool cans = qb.getQans();
    setState(() {
      if (cans == userAns)
      {
        score++;
        scoreKeeper.add(
          Icon(
              Icons.check,
              color: Colors.green
          ),
        );
      }
      else
      {
        scoreKeeper.add(
          Icon(
              Icons.close,
              color: Colors.red
          ),
        );
      }
      int i2 = qb.GetNextQuestion();
      if(i2==0) {
        Alert(
          context: context,
          onWillPopActive: true,
          type: AlertType.error,
          title: "Your Score:\n$score",
          buttons: [
            DialogButton(
              child: Text(
                "Restart The Quiz",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () {
                setState(() {
                  score = 0;
                  scoreKeeper = [];
                });
                Navigator.pop(context);
              },
              width: 200,
            )
          ],
        ).show();
      }
    });
    setState(() {
      scoreKeeper;
    });
  }
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: PageStorageKey('Qpage'),
      backgroundColor: Colors.black26,
      appBar: AppBar(
        backgroundColor: Colors.lime,
      ),
      body:
      SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 5,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Center(
                  child: Text(
                    qb.getQtext(),
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
                    //The user picked true.
                    checkAnswer(true);
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
                    //The user picked true.
                    checkAnswer(false);
                  },
                ),
              ),
            ),
            Row(
              children: scoreKeeper,
            ),
          ],
        ),
      ),
    );
  }

}