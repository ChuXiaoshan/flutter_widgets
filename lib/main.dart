import 'package:flutter/material.dart';
import 'package:flutter_widgets/page/fragment.dart';
import 'package:flutter_widgets/page/home.dart';
import 'package:flutter_widgets/page/other_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHome(title: 'main'),
      routes: <String, WidgetBuilder>{
        "f_main": (context) => MyHome(title: 'main'),
        "f_fragment": (context) => MyFragment(title: 'fragment'),
        "f_other_page": (context) => OtherPage(title: 'Other page'),
      },
    );
  }
}
