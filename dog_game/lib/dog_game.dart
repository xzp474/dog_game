import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import 'src/game_breaker.dart';
import 'src/screens/game_over.dart';
import 'src/screens/start_game.dart';

class DogGame extends StatefulWidget {
  const DogGame({super.key});

  @override
  State<DogGame> createState() => _DogGameState();
}

class _DogGameState extends State<DogGame> {
  late final GameBreaker game;

  @override
  void initState() {
    super.initState();
    game = GameBreaker();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GameWidget(
            game: game,
            initialActiveOverlays: [PlayState.welcome.name],
            overlayBuilderMap: {
              PlayState.welcome.name: (context, _) => StartGame(game: game),
              PlayState.gameOver.name: (context, _) => GameOver(game: game),
            },
          ),
          Positioned(
            left: 30,
            bottom: 30,
            child: FloatingActionButton(
              onPressed: () {
                game.dogSpeedUp();
              },
              child: const Icon(Icons.add),
            ),
          ),
          Positioned(
            right: 30,
            bottom: 30,
            child: FloatingActionButton(
              onPressed: () {
                game.dogJump();
              },
              child: const Icon(Icons.remove),
            ),
          ),
        ],
      ),
    );
  }
}
