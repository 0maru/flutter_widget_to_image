import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:widget_to_image/convert_wiget_to_image.dart';

class WrapChildrenPage extends StatefulWidget {
  WrapChildrenPage({Key key}) : super(key: key);

  @override
  _WrapChildrenPageState createState() => _WrapChildrenPageState();
}

class _WrapChildrenPageState extends State<WrapChildrenPage> {
  final GlobalKey _globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: RepaintBoundary(
          key: _globalKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              for (var i in [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]) _buildRow(context, i),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final _image = await ConvertWidgetToImage().execute(_globalKey);
          showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: Text('↓生成された画像↓'),
              content: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Image.memory(
                  _image,
                  fit: BoxFit.fitHeight,
                ),
                decoration: BoxDecoration(border: Border.all()),
              ),
            ),
          );
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildRow(BuildContext context, int index) {
    return Container(
      width: double.infinity,
      height: 80,
      child: Text(
        MediaQuery.of(context).size.height < index * 80 ? '範囲外' : '範囲内',
        style: TextStyle(color: Colors.black),
      ),
      decoration: BoxDecoration(
        color: index % 2 == 0 ? Colors.black12 : Colors.white24,
      ),
    );
  }
}
