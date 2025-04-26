import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UnderConstructionScreen extends StatelessWidget {
  const UnderConstructionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[100],
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: AppBar(
          backgroundColor: Colors.yellow[100],
          title: Padding(
            padding: const EdgeInsets.only(top: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Tic ", style: TextStyle(color: Colors.blue[800], fontSize: 35,fontFamily: "Orbitron")),
                Text("Tac ", style: TextStyle(color: Colors.black87, fontSize: 35,fontFamily: "Orbitron")),
                Text("Toe", style: TextStyle(color: Colors.red[400], fontSize: 35,fontFamily: "Orbitron")),
              ],
            ),
          ),
          automaticallyImplyLeading: false,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.only(top: 22, left: 15),
            child: IconButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, "/home");
              },
              icon: const Icon(
                CupertinoIcons.home,
                size: 35, // Increased icon size
              ),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            ),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("lib/frontend/assets/images/Under_Construction.png")
        ],
      ),
    );
  }
}
