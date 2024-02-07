import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/screens/splash/splash_screen.dart';


class SplashScreen1 extends StatefulWidget {
  SplashScreen1({Key? key, this.title}) : super(key: key);
   static String routeName = "/splash1";
  final String? title;

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen1> {
  bool _isVisible = false;

  _SplashScreenState(){

    new Timer(const Duration(milliseconds: 2000), (){
      setState(() {
        Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => SplashScreen()), (route) => false);
      });
    });

    new Timer(
      Duration(milliseconds: 10),(){
        setState(() {
          _isVisible = true; // Now it is showing fade effect and navigating to Login page
        });
      }
    );

  }

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: new BoxDecoration(
        color: pPrimaryColor,
        /*gradient: new LinearGradient(
          colors: [Theme.of(context).primaryColor, Theme.of(context).primaryColorLight],
          begin: const FractionalOffset(0, 0),
          end: const FractionalOffset(1.0, 0.0),
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp,
        ),*/
      ),
      child: AnimatedOpacity(
        opacity: _isVisible ? 1.0 : 0,
        duration: Duration(milliseconds: 1200),
        child: Center(
          child: Container(
           padding: EdgeInsets.symmetric(horizontal: 15),
              child: Center(
                child:
                Column(
                  mainAxisAlignment :MainAxisAlignment.center,
                  children: [
                SvgPicture.asset('assets/images/Logo_Logo_inverse.svg'),
                //SizedBox(height:5),
                Icon(Icons.stars, size: 30, color: Colors.white,), 
                SizedBox(height:5),
                Text("Le marché financier avec vous partout, à travers nos FCP",textAlign: TextAlign.center,
                style: TextStyle(
                fontSize: 15,
                color: Colors.white,
                //fontWeight: FontWeight.bold,
              ))//put your logo here
              ],
              )
            ),
          ),
        ),
      ),
    );
  }
}