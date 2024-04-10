import 'package:flame/components.dart';

import 'components.dart';

class FollowTarget extends PositionComponent {
  FollowTarget({
    required this.dog,
    required this.offset,
  });
  final Dog dog;
  final Vector2 offset;

  @override
  void update(double dt) {
    super.update(dt);
    // 視角位置是 狗的位置 + 要偏移的量
    position = dog.position + offset;
  }
}
