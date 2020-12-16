import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_paper_wallet/pages/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color(0xff171821)
    ));
    return MaterialApp(
      title: 'Crypto paper wallet',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Inter',
        primaryColor: Color(0xff171821),
        primarySwatch: Colors.pink,
        backgroundColor: Color(0xff171821),
        brightness: Brightness.dark,
      ),
      home: Homepage()
    );
  }
}
