import 'package:flutter/material.dart';
import 'package:quiz_app/model/question.dart';

class QuizApp extends StatefulWidget {
  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  List questionBank = [
    Question.name('The Suprem Law of land is the constitution', true),

    Question.name(
        'A good world citizen needs the ability to think critically about his or her traditions', true),
    Question.name('The (U.S) constitution has 26 Amendments', false),
    Question.name(
        'Freedom of religion means : \n you can practise any religion , or not practise a religion',
        true),
    Question.name(
        'Journalist is on part of or branch of the government ', false),
    Question.name('The U.S. has a lot of power in his army  ', true),
    Question.name('The U.S. Mens all is good', false),
  ];
  int currentIndex = 0;
  int totalCorrect = 0;
  int totalFalse = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'True Citizen ',
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Color(0xFFF6F6F6),
      ),
      backgroundColor: Color(0xFFF6F6F6),
      body: Container(
        child: Builder(
          builder: (context) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                  child: Image.asset(
                "images/flag.png",
                width: 250,
                height: 180,
              )),
              Padding(
                padding: const EdgeInsets.all(13.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(
                      color: Colors.blueGrey.shade400,
                      style: BorderStyle.solid,
                    ),
                  ),
                  height: 120.0,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        questionBank[currentIndex].questionText,
                        style: TextStyle(fontSize: 16.0, color: Colors.pink,),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MaterialButton(
                        color: Colors.blueGrey.shade400,
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                        onPressed: () => previousQuestion()),
                    MaterialButton(
                        color: Colors.blueGrey.shade400,
                        child: Text(
                          'TRUE',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () => _checkAnswer(true, context)),
                    MaterialButton(
                        color: Colors.blueGrey.shade400,
                        child: Text(
                          'FALSE',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () => _checkAnswer(false, context)),
                    MaterialButton(
                        color: Colors.blueGrey.shade400,
                        child: Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        ),
                        onPressed: () => nextQuestion()),
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                child: Column(
                  children: [
                    Text(
                      ' Total Correct Answers : ${totalCorrect}',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.green
                      ),
                    ),
                    SizedBox(
                      height: 18.0,
                    ),
                    Text(' Total False Answers : ${totalFalse}',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.red
                      ),
                    ),


                  ],
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  _checkAnswer(bool userChoice, BuildContext context) {
    if (userChoice == questionBank[currentIndex].isCorrect) {
      Scaffold.of(context).showSnackBar(
        SnackBar(
          duration: Duration(milliseconds: 800),
          backgroundColor: Colors.greenAccent,
          content: Text(' Correct !'),
        ),
      );
      setState(() {
        currentIndex = (currentIndex + 1) % questionBank.length;
        totalCorrect+=1;
      });
    } else {
      setState(() {
        totalFalse+=1;
      });
      Scaffold.of(context).showSnackBar(
        SnackBar(
          duration: Duration(milliseconds: 800),
          backgroundColor: Colors.red,
          content: Text('  InCorrect !'),
        ),
      );
    }
  }

  nextQuestion() {
    setState(() {
      currentIndex = (currentIndex + 1) % questionBank.length;
    });
  }

  previousQuestion() {
    setState(() {
      currentIndex = (currentIndex - 1) % questionBank.length;
    });
  }
}
