import 'dart:ui' as ui show Image, ImageByteFormat, PictureRecorder;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ImagePainter extends CustomPainter {
  /// Widgetから生成した画像
  final ui.Image image;

  /// 下部に追加するロゴ
  final ui.Image logo;

  ImagePainter(
    this.image, {
    this.logo,
  });

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawImage(image, Offset(0, 0), Paint());

    if (logo != null) {
      canvas.drawImage(logo, Offset(0, image.height.toDouble()), Paint());
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
