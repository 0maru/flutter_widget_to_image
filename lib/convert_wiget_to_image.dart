import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui show Image, ImageByteFormat, PictureRecorder;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:widget_to_image/image_painter.dart';

class ConvertWidgetToImage {
  Future<Uint8List> execute(GlobalKey widgetGlobalKey) async {
    RenderRepaintBoundary boundary = widgetGlobalKey.currentContext.findRenderObject();
    ui.Image image = await boundary.toImage();
    // ByteData byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    ByteData byteData = await insertLogoImage(image);
    return byteData.buffer.asUint8List();
  }

  Future<ByteData> insertLogoImage(ui.Image image) async {
    final ui.PictureRecorder recorder = ui.PictureRecorder();
    final Canvas canvas = Canvas(recorder);
    final logoImage = await loadLocalImage();
    ImagePainter(image)..paint(canvas, Size.infinite);
    // ロゴを追加する
    ImagePainter(image, logo: logoImage)..paint(canvas, Size.infinite);
    print(image.width);
    print(image.height);
    final ui.Image renderImage = await recorder.endRecording().toImage(
          image.width,
          image.height,
        );
    return renderImage.toByteData(format: ui.ImageByteFormat.png);
  }

  Future<ui.Image> loadLocalImage() async {
    Completer<ImageInfo> completer = Completer();

    /// Image.xxx() の内部で行っていることと同じことをしている
    AssetImage('assets/banner.jpg').resolve(ImageConfiguration()).addListener((ImageStreamListener(
          (ImageInfo info, bool _) => completer.complete(info),
        )));
    ImageInfo imageInfo = await completer.future;
    return imageInfo.image;
  }
}
