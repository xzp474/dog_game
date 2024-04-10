import 'package:flutter/material.dart';

import '../game_breaker.dart';

class GameOver extends StatelessWidget {
  const GameOver({
    super.key,
    required this.game,
  });
  final GameBreaker game;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black38,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Score: 100',
              style: TextStyle(
                fontSize: 60,
                color: Colors.white,
                fontFamily: 'Game',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                game.overlays.remove(PlayState.gameOver.name);
                game.overlays.add(PlayState.welcome.name);
                game.cleanGame();
                game.onLoad();
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
              child: const Text(
                'Restart',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
