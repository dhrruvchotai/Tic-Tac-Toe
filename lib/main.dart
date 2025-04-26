import 'package:flutter/material.dart';
import 'package:tic_tac_toe/frontend/screens/about_screen.dart';
import 'package:tic_tac_toe/frontend/screens/how_to_play_screen.dart';
import 'package:tic_tac_toe/frontend/screens/local_multiplayer_screen.dart';
import 'package:tic_tac_toe/frontend/screens/play_vs_computer_screen.dart';
import 'package:tic_tac_toe/frontend/screens/select_game_details_screen.dart';
import 'package:tic_tac_toe/frontend/screens/splash_screen.dart';
import 'package:tic_tac_toe/frontend/screens/under_construction_screen.dart';
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
      '/play_vs_computer' : (context){
        final args = ModalRoute.of(context)!.settings.arguments as Map<String,dynamic>;
        return PlayVsComputerScreen(
          PlayerName: args["PlayerName"] ?? "Player",
          PlayerSelectedAvatarIndex: args["PlayerSelectedAvatarIndex"],
          PlayerSelectedSymbol: args["PlayerSelectedSymbol"],
        );
      },
      '/local_multiplayer' : (context){
        final args = ModalRoute.of(context)!.settings.arguments as Map<String,dynamic>;
        return LocalMultiplayerScreen(
          PlayerOneName: args["PlayerOneName"],
          PlayerOneSelectedAvatarIndex: args["PlayerOneSelectedAvatarIndex"],
          PlayerOneSelectedSymbol: args["PlayerOneSelectedSymbol"],
          PlayerTwoName: args["PlayerTwoName"],
          PlayerTwoSelectedAvatarIndex: args["PlayerTwoSelectedAvatarIndex"],
          PlayerTwoSelectedSymbol: args["PlayerTwoSelectedSymbol"],
        );
      },
      '/under_construction' : (context) => UnderConstructionScreen(),
      '/how_to_play' : (context) => HowToPlayScreen(),
      '/about' : (Context) => AboutScreen()
    },
  ));
}
