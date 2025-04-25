import 'package:flutter/material.dart';
import 'package:tic_tac_toe/frontend/screens/local_multiplayer_screen.dart';
import 'package:tic_tac_toe/frontend/screens/play_vs_computer_screen.dart';
import 'package:tic_tac_toe/frontend/screens/select_game_details_screen.dart';
import 'package:tic_tac_toe/frontend/screens/splash_screen.dart';
import 'frontend/screens/home_screen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: "/",
    routes: {
      "/" : (context) => SplashScreen(),
      "/home" : (context) => HomeScreen(),
      '/select_game_details': (context) {
        final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
        return SelectGameDetailsScreen(
          isGameVsComputer: args['isGameVsComputer'],
        );
      },
      '/play_vs_computer' : (context) => PlayVsComputerScreen(),
      '/local_multiplayer' : (context) => LocalMultiplayerScreen()
    },
  ));
}
