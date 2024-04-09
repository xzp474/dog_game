import 'package:flame/components.dart';
import 'package:flame/flame.dart';

import '../assets.dart';
import '../game_breaker.dart';

class Background extends SpriteComponent with HasGameRef<GameBreaker> {
  Background({required this.horizontalAxis}) : super();

  double horizontalAxis;

  @override
  Future<void> onLoad() async {
    // 確認圖片路徑
    final background = await Flame.images.load(Assets.background);
    sprite = Sprite(background);

    // 根據畫面的高度和圖片原始高度的比例計算高度
    final scaleFactor = gameRef.size.y / sprite!.image.height;
    final adjustedWidth = sprite!.image.width * scaleFactor;

    size = Vector2(adjustedWidth, gameRef.size.y);

    // 確保背景這個物件是從屏幕左上角開始
    position = Vector2(horizontalAxis, 0);
  }
}
