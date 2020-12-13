import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:widget_to_image/convert_wiget_to_image.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey _globalKey = GlobalKey();

  Widget _image;

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      key: _globalKey,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 40,
                  child: Text(
                      'ヘッダー ${MediaQuery.of(context).size.width} ${MediaQuery.of(context).size.height}'),
                  decoration: BoxDecoration(border: Border.all()),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 80,
                  child: Text('1行目'),
                  decoration: BoxDecoration(border: Border.all()),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 80,
                  child: Text('2行目'),
                  decoration: BoxDecoration(border: Border.all()),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 80,
                  child: Text('3行目'),
                  decoration: BoxDecoration(border: Border.all()),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 80,
                  child: Text('4行目'),
                  decoration: BoxDecoration(border: Border.all()),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 80,
                  child: Text('5行目'),
                  decoration: BoxDecoration(border: Border.all()),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 80,
                  child: Text('6行目'),
                  decoration: BoxDecoration(border: Border.all()),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 80,
                  child: Text('7行目'),
                  decoration: BoxDecoration(border: Border.all()),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 80,
                  child: Text('8行目'),
                  decoration: BoxDecoration(border: Border.all()),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 80,
                  child: Text('9行目'),
                  decoration: BoxDecoration(border: Border.all()),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 80,
                  child: Text('10行目'),
                  decoration: BoxDecoration(border: Border.all()),
                ),
                SizedBox(height: 300),
                Text('表示範囲外'),
                SizedBox(height: 300),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await ConvertWidgetToImage().execute(_globalKey);
            showDialog(
              context: context,
              builder: (_) => AlertDialog(
                title: Text('↓生成された画像↓'),
                content: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: _image,
                  decoration: BoxDecoration(border: Border.all()),
                ),
              ),
            );
          },
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
