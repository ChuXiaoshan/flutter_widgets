import 'package:flutter/material.dart';

class OtherPage extends StatefulWidget {
  OtherPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _OtherPageState createState() => _OtherPageState();
}

class _OtherPageState extends State<OtherPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        title: Text(widget.title),
      ),
      body: Center(
        child: new Text("This is other page."),
      ),
    );
  }
}
