import 'main.dart';
import 'package:flutter/material.dart';
import 'Calculator.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    super.initState();
    Timer(
      Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (BuildContext context) => Calculator())));
  }
  Widget build(BuildContext context) {
    var _imageapplogo =  new AssetImage("assets/images/page.png");
    var _imageapplogo_url = new Image(image: _imageapplogo,height: 120.0,);
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Container(
        color: Color(0xFF1D1A40),
        child: new Row(
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  _imageapplogo_url,
                  Padding(
                    padding: EdgeInsets.only(
                      top:90,
                      bottom: 10,
                      left: 0,
                      right: 0,
                    ),
                    child: Text(
                      "Interest Calculator",
                      textAlign: TextAlign.center,
                      style: new TextStyle(
                        color: Colors.white,
                        fontSize: 28.0,
                        decoration: TextDecoration.none,


                      ),
                    ),
                  ),
                  Text("Everyone loves it...",
                    textAlign:TextAlign.center,
                    style:new TextStyle(
                      color: Color(0xFF7E7D8E),
                      fontSize: 18.0,
                      decoration: TextDecoration.none,
                    ),
                  ),

                ],
              ),

            ),
          ],
        ),
      ),
    );
  }
}
