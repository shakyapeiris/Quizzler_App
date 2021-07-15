import 'package:flutter/material.dart';

import './questions.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  int _questionIndex = 0;
  List<Question> _qArr = [
    Question(q: 'Is Flutter Dumb?', a: false),
    Question(q: 'Is React Native Dumb?', a: true),
    Question(q: 'All the players in Sri Lankan Cricket team are Sri Lankan?', a: false)
  ];

  int correct_count = 0;

  List<Icon> scoreKeeper = [];

  var isEnd = false;

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey[900],
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: !isEnd
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        flex: 7,
                        child: Center(
                          child: Text(
                            _qArr[_questionIndex].questionText,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Card(
                          child: FlatButton(
                            child: Text('Yes', style: TextStyle(fontSize: 20, color: Colors.white)),
                            color: Colors.green,
                            onPressed: () {
                              setState(() {
                                if (_qArr[_questionIndex].questionAnswer == true) {
                                  scoreKeeper.add(
                                    Icon(
                                      Icons.check,
                                      color: Colors.green,
                                    ),
                                  );
                                  correct_count++;
                                } else {
                                  scoreKeeper.add(
                                    Icon(
                                      Icons.close,
                                      color: Colors.red,
                                    ),
                                  );
                                }

                                _questionIndex += 1;
                                if (_questionIndex == _qArr.length) {
                                  isEnd = true;
                                  return;
                                }
                              });
                            },
                          ),
                        ),
                      ),
                      Container(height: 10, width: double.infinity),
                      Expanded(
                        flex: 1,
                        child: Card(
                          child: FlatButton(
                            child: Text('No', style: TextStyle(fontSize: 20, color: Colors.white)),
                            color: Colors.red,
                            onPressed: () {
                              setState(() {
                                if (_qArr[_questionIndex].questionAnswer == false) {
                                  scoreKeeper.add(
                                    Icon(
                                      Icons.check,
                                      color: Colors.green,
                                    ),
                                  );
                                  correct_count++;
                                } else {
                                  scoreKeeper.add(
                                    Icon(
                                      Icons.close,
                                      color: Colors.red,
                                    ),
                                  );
                                }

                                _questionIndex += 1;
                                if (_questionIndex == _qArr.length) {
                                  isEnd = true;
                                  return;
                                }
                              });
                            },
                          ),
                        ),
                      ),
                      Row(
                        children: scoreKeeper,
                      ),
                    ],
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: double.infinity,
                      ),
                      Text(
                        'The End!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 25.0,
                          color: Colors.white,
                        ),
                      ),
                      Card(
                        color: Colors.blue[200],
                        child: Container(
                          margin: EdgeInsets.fromLTRB(0, 10.0, 0, 0),
                          padding: EdgeInsets.all(8.0),
                          width: 70.0,
                          height: 70.0,
                          child: Center(
                            child: Text((correct_count / _qArr.length * 100).round().toString() + '%',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(50, 10.0, 50, 0),
                        child: FlatButton(
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text('Restart!', style: TextStyle(fontSize: 20.0, color: Colors.blueGrey[900])),
                          ),
                          color: Colors.green,
                          onPressed: () {
                            setState(() {
                              _questionIndex = 0;
                              isEnd = false;
                              scoreKeeper = [];
                              correct_count = 0;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
