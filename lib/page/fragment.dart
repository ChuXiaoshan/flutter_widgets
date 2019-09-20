import 'package:flutter/material.dart';

class MyFragment extends StatefulWidget {
  MyFragment({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyFragmentState createState() => _MyFragmentState();
}

class _MyFragmentState extends State<MyFragment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        title: Text(widget.title),
      ),
      body: Center(
        child: new Text("This is a fragment"),
      ),
    );
  }
}
