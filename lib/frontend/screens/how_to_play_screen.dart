import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HowToPlayScreen extends StatelessWidget {
  const HowToPlayScreen({super.key});

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
                Text("Tic", style: TextStyle(color: Colors.blue[800], fontSize: 35,fontFamily: "Orbitron",)),
                Text("Tac", style: TextStyle(color: Colors.black87, fontSize: 35,fontFamily: "Orbitron",)),
                Text("Toe", style: TextStyle(color: Colors.red[400], fontSize: 35,fontFamily: "Orbitron",)),
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
              icon: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12), // Slightly larger border radius
                ),
                child: const Icon(
                  Icons.arrow_back,
                  size: 30, // Increased icon size
                ),
              ),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Card(
                  color: Colors.white.withOpacity(0.8),
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(color: Colors.black.withOpacity(0.2), width: 2),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildInstructionStep(
                          number: 1,
                          title: "Game Objective",
                          description: "Be the first to get 3 of your symbols (X or O) in a row horizontally, vertically, or diagonally.",
                        ),
                        const SizedBox(height: 20),
                        _buildInstructionStep(
                          number: 2,
                          title: "Player Turns",
                          description: "Players alternate turns placing their symbol in an empty square.",
                        ),
                        const SizedBox(height: 20),
                        _buildInstructionStep(
                          number: 3,
                          title: "Winning the Game",
                          description: "The first player to get 3 in a row wins! If all squares fill up with no winner, it's a draw.",
                        ),
                        const SizedBox(height: 20),
                        _buildInstructionStep(
                          number: 4,
                          title: "Controls",
                          description: "Simply tap on any empty square to place your symbol when it's your turn.",
                        ),
                        const SizedBox(height: 30),
                        Center(
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.yellow[200],
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Colors.black.withOpacity(0.3), width: 2),
                            ),
                            child: Text(
                              "Have fun playing!",
                              style: TextStyle(
                                fontFamily: "Poppins",
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInstructionStep({required int number, required String title, required String description}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            color: Colors.blue[800],
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              '$number',
              style: TextStyle(
                fontFamily: "Poppins",
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(width: 15),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontFamily: "Orbitron",
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                description,
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}