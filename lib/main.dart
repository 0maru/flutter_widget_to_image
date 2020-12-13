import 'package:flutter/material.dart';
import 'package:widget_to_image/pages/normal.dart';
import 'package:widget_to_image/pages/wrap_children.dart';

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
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          ListTile(
            title: Text('normal'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => NormalPage(),
                ),
              );
            },
          ),
          ListTile(
            title: Text('WrapChildrenPage'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => WrapChildrenPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
