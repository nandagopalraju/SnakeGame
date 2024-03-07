import 'package:flutter/material.dart';
import 'package:flutter_game_test/providers/change_providers.dart';
import 'package:flutter_game_test/snake_game.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(Provider<ChangeState>(
    create: (_) => ChangeState(),
    child: const MaterialApp(home: SnakeGame()),
  ));
}
