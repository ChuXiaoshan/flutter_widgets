import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyHome extends StatefulWidget {
  MyHome({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHome> {
//  static const eventChannel = const EventChannel('com.cxsplay/testing');
  static const _msgChannel = const BasicMessageChannel("com.cxsplay/test1", StandardMessageCodec());
  static const _methodChannel = const MethodChannel("com.cxsplay/test2");

  int _num1 = 0;
  int _num2 = 0;
  int _num3 = 0;

  @override
  void initState() {
    super.initState();
    _msgChannel.setMessageHandler((message) async {
      setState(() {
        _num1 = message;
      });
      return message;
    });

    _methodChannel.setMethodCallHandler((handler) {
      if (handler.method == "num2Receiver") {
        _num2 = handler.arguments;
        setState(() {});
      }
      return handler.arguments;
    });
  }

  void sendMsg1() {
    _num1++;
    _sendMsg1();
    setState(() {});
  }

  Future<void> _sendMsg1() async {
    await _msgChannel.send(_num1);
  }

  Future<void> invokeNativeAdd() async {
    return _methodChannel.invokeMethod("numberAdd", _num2);
  }

  void addNum2() {
    _num2++;
    invokeNativeAdd();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            new RaisedButton(
              onPressed: sendMsg1,
              child: new Text("msg " + _num1.toString()),
            ),
            new RaisedButton(
              onPressed: addNum2,
              child: new Text("method " + _num2.toString()),
            ),
            new RaisedButton(
//              onPressed: add,
              child: new Text("event " + _num3.toString()),
            ),
          ],
        ),
      ),
    );
  }
}
