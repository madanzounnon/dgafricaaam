import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/routes.dart';
import 'package:shop_app/screens/country/provider/country_provider.dart';
//import 'package:shop_app/screens/profile/profile_screen.dart';
//import 'package:shop_app/screens/splash/splash_screen.dart';
import 'package:shop_app/screens/splash_screen.dart';
import 'package:shop_app/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(    
      create: (context) => CountryProvider(),
      child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme(),
      // home: SplashScreen(),
      // We use routeName so that we dont need to remember the name
      initialRoute: SplashScreen1.routeName,
      routes: routes,
    ),
    );
  }

