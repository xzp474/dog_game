import 'dart:ui';

import 'package:flame/components.dart';

class Dog extends CircleComponent {
  Dog({
    required this.originPositionHight,
    required super.position,
    required double radius,
  }) : super(
          radius: radius,
          anchor: Anchor.center,
          paint: Paint()..color = const Color(0xFFFFC800),
        );

  // 初始位置高度
  final double originPositionHight;

  // 加速度
  double speed = 0;

  // 重力加速度，向下為負
  final double gravity = 2000;
  // 垂直方向的速度
  double verticalVelocity = 0;

  void jump() {
    // 向上的速度
    verticalVelocity = -1000;
  }

  void speedUp() {
    speed += 100;
  }

  @override
  void update(double dt) {
    super.update(dt);
    // 橫向移動
    position += (Vector2(5, 0)
          ..normalize()
          ..scale(speed)) *
        dt;

    // 縱向移動
    position.y += verticalVelocity * dt + 0.5 * gravity * dt * dt;

    verticalVelocity += gravity * dt;

    if (position.y > originPositionHight) {
      position.y = originPositionHight;
      verticalVelocity = 0;
    }
  }
}
