
import 'package:flutter/material.dart';
import 'package:za/pages/home.dart';


//my own imports
import 'package:za/pages/login.dart';


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: Colors.cyan
    ),
    home: Login(),
  ));
}
