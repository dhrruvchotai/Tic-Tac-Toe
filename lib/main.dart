import 'package:flutter/material.dart';
import 'package:tic_tac_toe/frontend/screens/splash_screen.dart';

import 'frontend/screens/home_screen.dart';
import 'frontend/screens/splash_screen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: "/",
    routes: {
      "/" : (context) => SplashScreen(),
      "/home" : (context) => HomeScreen(),
    },
  ));
}
