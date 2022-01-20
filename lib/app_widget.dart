import 'package:flutter/material.dart';
import 'package:viacep/home_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Via CEP',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(),
    );
  }
}