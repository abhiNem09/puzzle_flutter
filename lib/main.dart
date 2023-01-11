import 'package:flutter/material.dart';
import 'letter.dart';
import 'game.dart';
import 'ReusableCard.dart';
import 'answerClass.dart';

GameBrain brain = GameBrain();
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  refresh() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF39298a),
      appBar: AppBar(
        title: Text(
          'Image Puzzle Game',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: ReusableCard(
              shade: Color(0XFF39298a),
              cardChild: Container(
                padding: EdgeInsets.all(10),
                child: brain.getQuestionIamge(),
              ),
            ),
          ),
          Expanded(
            child: ReusableCard(
              shade: Color(0XFF39298a),
              cardChild: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: brain
                    .getAnswerText()
                    .split('')
                    .map((e) => letter(e.toUpperCase(),
                        !Game.selectedChar.contains(e.toUpperCase())))
                    .toList(),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: ReusableCard(
              shade: Color(0XFF39298a),
              cardChild: SizedBox(
                width: double.infinity,
                height: 250.0,
                child: GridView.count(
                  crossAxisCount: 7,
                  mainAxisSpacing: 8.0,
                  crossAxisSpacing: 8.0,
                  padding: EdgeInsets.all(8.0),
                  children: brain.getList().map((e) {
                    return RawMaterialButton(
                      onPressed: Game.selectedChar.contains(e)
                          ? null // we first check that we didn't selected the button before
                          : () {
                              setState(() {
                                Game.selectedChar.add(e);
                                print(Game.selectedChar);
                              });
                            },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: Text(
                        e,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      fillColor: Game.selectedChar.contains(e)
                          ? Colors.black87
                          : Colors.blue,
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  Game.selectedChar = [];
                  brain.nextQuestion();
                });
              },
              child: Text('Next'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.cyan),
            ),
          ]),
        ],
      ),
    );
  }
}
