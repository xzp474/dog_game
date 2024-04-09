import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/parallax.dart';

import '../assets.dart';
import '../config.dart';
import '../game_breaker.dart';

class Ground extends ParallaxComponent<GameBreaker> with HasGameRef<GameBreaker> {
  Ground();

  @override
  Future<void> onLoad() async {
    final ground = await Flame.images.load(Assets.ground);
    parallax = Parallax([
      ParallaxLayer(
        ParallaxImage(ground, fill: LayerFill.none),
      ),
    ]);
  }

  @override
  void update(double dt) {
    super.update(dt);
    // parallax?.baseVelocity.x = gameSpeed;
  }
}
