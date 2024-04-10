import 'package:flutter/material.dart';

import '../game_breaker.dart';

class StartGame extends StatelessWidget {
  const StartGame({
    super.key,
    required this.game,
  });
  final GameBreaker game;
  @override
  Widget build(BuildContext context) {
    game.pauseEngine();
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('狗追飛盤遊戲'),
            FilledButton(
              onPressed: () {
                game.overlays.remove(PlayState.welcome.name);
                game.resumeEngine();
              },
              child: const Text('開始遊戲'),
            ),
          ],
        ),
      ),
    );
  }
}
