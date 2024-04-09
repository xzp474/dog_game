import 'dart:ui';

import 'package:flame/components.dart';

class Ball extends CircleComponent {
  Ball({
    required this.originPositionHight,
    required super.position,
    required double radius,
  }) : super(
          radius: radius,
          anchor: Anchor.center,
          paint: Paint()..color = const Color(0xFFFF0000),
        );

  // 初始位置高度
  final double originPositionHight;

  // 加速度
  double speed = 0;

  // 重力加速度，向下為負
  final double gravity = 50;
  // 垂直方向的速度
  double verticalVelocity = -250;

  @override
  void update(double dt) {
    super.update(dt);
    // 橫向移動
    position += (Vector2(5, 0)
          ..normalize()
          ..scale(300)) *
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
