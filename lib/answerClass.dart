import 'package:flutter/material.dart';

class Quest {
  Image pic;
  String answer;

  List<String> alphabets = [
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
    "H",
    "I",
    "J",
    "K",
    "L",
    "M",
    "N",
    "O",
    "P",
    "Q",
    "R",
    "S",
    "T",
    "U",
    "V",
    "W",
    "X",
    "Y",
    "Z"
  ];

  Quest(
    this.pic,
    this.answer,
  );
}

class GameBrain {
  int questionNumber = 0;
  final questionBank = [
    Quest(
      Image.asset('images/train.jpg'),
      'Train'.toUpperCase(),
    ),
    Quest(Image.asset('images/bus.jpg'), 'Bus'.toUpperCase()),
    Quest(Image.asset('images/ship.jpg'), 'ship'.toUpperCase())
  ];
  int? nextQuestion() {
    if (questionNumber < questionBank.length) {
      return questionNumber++;
    }
  }

  Image getQuestionIamge() {
    return questionBank[questionNumber].pic;
  }

  String getAnswerText() {
    return questionBank[questionNumber].answer;
  }

  List<String> getList() {
    return questionBank[questionNumber].alphabets;
  }
}
