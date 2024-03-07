import 'dart:async';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_game_test/keypad.dart';
import 'package:flutter_game_test/models/points.dart';
import 'package:flutter_game_test/models/snake_features.dart';
import 'package:flutter_game_test/snake_block.dart';

enum Direction { up, down, left, right }

class SnakeGame extends StatefulWidget {
  const SnakeGame({super.key});

  @override
  State<SnakeGame> createState() => _SnakeGameState();
}

class _SnakeGameState extends State<SnakeGame> {
  Point headPos = Point(0, 0);
  List<Features> snakeList = [];

  Features snakeHead =
      Features(Direction.left.name, coords: Points(x: 0, y: 0));
  // double pointX = 0;
  // double pointY = 0;
  final ValueNotifier<int> _counter = ValueNotifier(0);
  // var headDirection = Direction.left;
  String headDirectionLabel = Direction.left.name;

  List<Point> pivotPointList = [];

  void startGame() {
    snakeList.add(snakeHead);

    Timer.periodic(const Duration(microseconds: 8), (timer) {
      _counter.value++;
      // setState(() {
      updateDirection();

      moveHead();
      // });
    });
  }

  void moveHead() {
    // print(headDirection.name);

    // if (headDirection == Direction.left) {
    //   snake1.coords.x -= 0.005;

    //   // pointX -= 0.005;
    // } else if (headDirection == Direction.right) {
    //   snake1.coords.x += 0.005;

    //   // pointX += 0.005;
    // } else if (headDirection == Direction.up) {
    //   snake1.coords.y -= 0.005;

    //   // pointY -= 0.005;
    // } else if (headDirection == Direction.down) {
    //   snake1.coords.y += 0.005;

    //   // pointY += 0.005;
    if (snakeHead.direction == Direction.left.name) {
      snakeHead.coords.x -= 0.005;

      // pointX -= 0.005;
    } else if (snakeHead.direction == Direction.right.name) {
      snakeHead.coords.x += 0.005;

      // pointX += 0.005;
    } else if (snakeHead.direction == Direction.up.name) {
      snakeHead.coords.y -= 0.005;

      // pointY -= 0.005;
    } else if (snakeHead.direction == Direction.down.name) {
      snakeHead.coords.y += 0.005;

      // pointY += 0.005;
    }

    // });
  }

  void updateDirection() {
    // setState(() {
    // if (pointX >= 1) {
    //   pointX = -1;
    // } else if (pointX <= -1) {
    //   pointX = 1;
    // } else if (pointY >= 1) {
    //   pointY = -1;
    // } else if (pointY <= -1) {
    //   pointY = 1;
    // }
    if (snakeHead.coords.x >= 1) {
      snakeHead.coords.x = -1;
    } else if (snakeHead.coords.x <= -1) {
      snakeHead.coords.x = 1;
    } else if (snakeHead.coords.y >= 1) {
      snakeHead.coords.y = -1;
    } else if (snakeHead.coords.y <= -1) {
      snakeHead.coords.y = 1;
    }
    // });
  }

  void changeDirection(String key) {
    // pivotPointList.add(Point(pointX, pointY));
    pivotPointList.add(Point(snakeHead.coords.x, snakeHead.coords.y));

    print(pivotPointList);
    // setState(() {
    if (key == "Arrow Up") {
      snakeHead.direction = Direction.up.name;
    } else if (key == "Arrow Down") {
      snakeHead.direction = Direction.down.name;
    } else if (key == "Arrow Left") {
      snakeHead.direction = Direction.left.name;
    } else if (key == "Arrow Right") {
      snakeHead.direction = Direction.right.name;
    }
    // });
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardListener(
      focusNode: FocusNode(),
      autofocus: true,
      onKeyEvent: (event) {
        final key = event.logicalKey.keyLabel;
        if (headDirectionLabel != key) {
          headDirectionLabel = key;
          changeDirection(key);
          snakeList.add(Features(key, coords: snakeHead.coords));
        }

        ///add a condition to check for same direction clicked again and restrict function call
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepOrange,
        ),
        body: Column(
          children: [
            Flexible(
              flex: 5,
              child: ValueListenableBuilder(
                  valueListenable: _counter,
                  builder: (context, value, child) {
                    return Container(
                      color: Colors.amberAccent,

                      // child: ListView.builder(
                      //     itemCount: snakeList.length,
                      //     scrollDirection: snakeHead.direction == "up" ||
                      //             snakeHead.direction == "down"
                      //         ? Axis.vertical
                      //         : Axis.horizontal,
                      //     itemBuilder: (context, index) {
                      //       return SnakeBlock(snake: snakeHead);
                      //     }),
                      child: SnakeBlock(snake: snakeHead),
                    );
                  }),
            ),
            Flexible(
                flex: 2,
                child: KeyPad(
                  startGame: startGame,
                )),
          ],
        ),
      ),
    );
  }
}
