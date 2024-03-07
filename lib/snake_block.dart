import 'package:flutter/material.dart';
import 'package:flutter_game_test/models/snake_features.dart';

class SnakeBlock extends StatelessWidget {
  final Features snake;

  const SnakeBlock({
    super.key,
    required this.snake,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment(snake.coords.x, snake.coords.y),
        child: Container(
          height:
              snake.direction == "up" || snake.direction == "down" ? 45 : 15,
          width: snake.direction == "up" || snake.direction == "down" ? 15 : 45,
          decoration: const BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
              color: Colors.deepPurple),
        ));
  }
}
