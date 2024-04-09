import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';

import 'components/ball.dart';
import 'components/components.dart';
import 'config.dart';

class GameBreaker extends FlameGame with TapDetector {
  GameBreaker()
      : super(
          camera: CameraComponent.withFixedResolution(
            width: gameWidth,
            height: gameHeight,
          ),
        );

  double get width => size.x;
  double get height => size.y;

  List<Background> background = [];
  double backgroundPosition = 0;
  late Dog dog;
  late FollowTarget followTarget;

  void dogJump() {
    dog.jump();
  }

  void dogSpeedUp() {
    dog.speedUp();
  }

  @override
  void update(double dt) {
    super.update(dt);

    if (dog.position.x > (backgroundPosition - (backWidth / 2))) {
      if (background.first.position.x < background.last.position.x) {
        background.first.position.x += (backWidth * 2);
      } else {
        background.last.position.x += (backWidth * 2);
      }
      backgroundPosition += backWidth;
    }
  }

  @override
  FutureOr<void> onLoad() async {
    super.onLoad();
    camera.viewfinder.anchor = Anchor.topLeft;

    // 添加組件:背景

    for (int i = 0; background.length < 2; i++) {
      background.add(Background(horizontalAxis: backgroundPosition));
      backgroundPosition += backWidth;
    }

    world.addAll(background);

    //添加組件:狗
    dog = Dog(
      radius: dogRadius,
      originPositionHight: height / 1.105,
      position: Vector2(width / 4, height / 1.105),
    );
    world.add(dog);

    //添加組件:視角
    followTarget = FollowTarget(
      dog: dog,
      offset: Vector2(
        -size.x / 2,
        0,
      ),
    );
    world.add(followTarget);

    world.add(
      Ball(
        radius: dogRadius,
        originPositionHight: height / 1.105,
        position: Vector2(width / 4, height / 1.105),
      ),
    );
    world.add(Ground());
    // 視角跟隨狗
    camera.follow(followTarget, horizontalOnly: true);

    debugMode = true;
  }
}
