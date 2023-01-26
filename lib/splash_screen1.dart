import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pebble_life/splash_screen2.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 4),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) => ExtendedSplash()
            )
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    var size,height,width;
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      body: Container(
        padding:  EdgeInsets.fromLTRB(0, 0, 0, 43),
        width:  width,
        decoration:  BoxDecoration (
          color:  Color(0xffede8f6),
        ),
        child:
        Column(
          crossAxisAlignment:  CrossAxisAlignment.center,
          children:  [
            Container(
              margin:  EdgeInsets.fromLTRB(0, 0, 0, 87),
              width:  width,
              height:  height*0.6,
              child:
              Center(
                child:
                Image( image: AssetImage('assets/images/splash1.png'),
                  height: height*0.75,
                  width: width*0.8,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              //logo
              margin:  EdgeInsets.fromLTRB(32, 0, 33, 0),
              width:  width,
              decoration:  BoxDecoration (
                color:  Color(0xffede8f6),
              ),

              child:
              Column(
                crossAxisAlignment:  CrossAxisAlignment.center,

                children:  [
                  Container(
                    margin:  EdgeInsets.fromLTRB(0, 0, 4.41, 22.28),
                    width:  width*0.2,
                    height:  height*0.083,
                    child:
                    Image.asset('assets/images/pebblelogo.png',
                      height: height*0.08,
                      width: width*0.2,

                     ),
                  ),
                  Container(
                    width:  310,
                    height:  height*0.1,
                    child:
                    Image.asset('assets/images/text_logo.png',

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

