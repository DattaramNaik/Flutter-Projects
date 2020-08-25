import 'package:flutter/material.dart';
import 'splashscreen.dart';

void main(){
  runApp(MaterialApp(
    title: "Rate Of Interest Calculator",
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: Colors.indigo,
      brightness: Brightness.dark,
      accentColor: Colors.indigoAccent,
    ),
    home: SplashScreen(),
  ));
}

