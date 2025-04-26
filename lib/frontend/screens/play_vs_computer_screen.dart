import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tic_tac_toe/frontend/constants/image_paths.dart';

class PlayVsComputerScreen extends StatefulWidget {
  String? PlayerName;
  int? PlayerSelectedAvatarIndex = 0;
  String? PlayerSelectedSymbol = "x";
  PlayVsComputerScreen({super.key,this.PlayerName = "Player",this.PlayerSelectedAvatarIndex,this.PlayerSelectedSymbol});

  @override
  State<PlayVsComputerScreen> createState() => _PlayVsComputerScreenState();
}

class _PlayVsComputerScreenState extends State<PlayVsComputerScreen> {

  bool isPlayerTurn  = true;
  List<String> displaySymbol = List.filled(9, '');

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
                Text("Tic", style: TextStyle(color: Colors.blue[800], fontSize: 35,fontFamily: "Orbitron")),
                Text("Tac", style: TextStyle(color: Colors.black87, fontSize: 35,fontFamily: "Orbitron")),
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
      body: SafeArea(
          child:Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 5,top: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 210,
                      width: 150,
                      decoration: BoxDecoration(
                          color: isPlayerTurn ? Colors.blue[600] : Colors.blue[800],
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: isPlayerTurn ? Colors.black : Colors.blue,width: 3)
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: CircleAvatar(
                              child: Image.asset(ImagePaths().AVATARS[widget.PlayerSelectedAvatarIndex!],height: 70,),
                              minRadius: 1,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                              widget.PlayerName!,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontFamily: "Poppins",
                                  color: Colors.white,
                                  fontSize : 20,
                                  fontWeight: FontWeight.w800,
                                  fontStyle: FontStyle.italic
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Container(
                              width: 60,
                              decoration: BoxDecoration(
                                  color: Colors.yellow,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: Colors.black,width: 2)
                              ),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 5,bottom: 1),
                                  child: Text(
                                    widget.PlayerSelectedSymbol!,
                                    style: TextStyle(
                                        fontFamily: "Orbitron",
                                        color: widget.PlayerSelectedSymbol == "x" ? Colors.red : Colors.blue,
                                        fontSize : 40,
                                        fontWeight: FontWeight.w800,
                                        fontStyle: FontStyle.italic
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 210,
                      width: 150,
                      decoration: BoxDecoration(
                          color: isPlayerTurn ? Colors.red[400] : Colors.red[200],
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: isPlayerTurn ? Colors.red : Colors.black,width: 3)
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: CircleAvatar(
                              child: Container(
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                                  child: Image.asset(ImagePaths().COMPUTERAVATAR,height: 70)),
                              minRadius: 1,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                              "Computer",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontFamily: "Orbitron",
                                  color: Colors.white,
                                  fontSize : 20,
                                  fontWeight: FontWeight.w800,
                                  fontStyle: FontStyle.italic
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Container(
                              width: 60,
                              decoration: BoxDecoration(
                                  color: Colors.yellow,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: Colors.black,width: 2)
                              ),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 5,bottom: 1),
                                  child: Text(
                                    widget.PlayerSelectedSymbol! == "x" ? "o" : "x",
                                    style: TextStyle(
                                        fontFamily: "Orbitron",
                                        color: widget.PlayerSelectedSymbol == "x" ? Colors.blue : Colors.red,
                                        fontSize : 40,
                                        fontWeight: FontWeight.w800,
                                        fontStyle: FontStyle.italic
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 70,),
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: Container(
                  height: 360,
                  decoration:BoxDecoration(
                    color: Colors.black.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: GridView.builder(
                      itemCount: 9,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 10,  // Add spacing between rows
                        crossAxisSpacing: 10, // Add spacing between columns
                        childAspectRatio: 1,  // Make cells square
                      ),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: (){
                            setSymbolAccordingToTurn(index);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.yellowAccent[100],
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Colors.black54, width: 3),
                            ),
                            child: Center(
                              child: Text(
                                displaySymbol[index],
                                style: TextStyle(
                                  fontFamily: "Orbitron",
                                  fontSize: 60,
                                  color:displaySymbol[index] == "x" ? Colors.red[400] : Colors.blue[800],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              )
            ],
          )
      ),
    );
  }
  //Function to reset the game
  void resetGame(){
    setState(() {
      displaySymbol = List.filled(9, "");
      isPlayerTurn = true;
    });
  }

  //Function to set symbol in the container according to the turn
  void setSymbolAccordingToTurn(int index) {
    // Only process if it's player's turn and cell is empty
    if (isPlayerTurn && displaySymbol[index] == "") {
      setState(() {
        displaySymbol[index] = widget.PlayerSelectedSymbol!;
        if (!checkIfAnyoneWins()) { // Only proceed if game not over
          isPlayerTurn = false;
          Future.delayed(Duration(milliseconds: 500), makeComputerMove);
        }
      });
    }
  }

  //function to move the computer move
  void makeComputerMove() {
    final emptyIndices = [for (var i = 0; i < 9; i++) if (displaySymbol[i] == '') i];

    if (emptyIndices.isNotEmpty) {
      setState(() {
        final randomIndex = emptyIndices[Random().nextInt(emptyIndices.length)];
        displaySymbol[randomIndex] = widget.PlayerSelectedSymbol == "x" ? "o" : "x";
        checkIfAnyoneWins();
        isPlayerTurn = true;
      });
    }
  }

  //function to check if anyone wins or not
  bool checkIfAnyoneWins() {
    final winningCombinations = [
      [0, 1, 2], [3, 4, 5], [6, 7, 8], // for the Rows
      [0, 3, 6], [1, 4, 7], [2, 5, 8], // for the Columns
      [0, 4, 8], [2, 4, 6], // for the Diagonals
    ];

    // Check for the winner condition
    for (var combination in winningCombinations) {
      final a = combination[0];
      final b = combination[1];
      final c = combination[2];

      if (displaySymbol[a].isNotEmpty &&
          displaySymbol[a] == displaySymbol[b] &&
          displaySymbol[b] == displaySymbol[c]) {
        showGameOverDialog(
            displaySymbol[a] == widget.PlayerSelectedSymbol
                ? 'You Win ${widget.PlayerName}!'
                : 'Computer Wins!'
        );
        return true;
      }
    }

    // Check if game is draw or not
    if (!displaySymbol.contains('')) {
      showGameOverDialog('Game Tied!');
      return true;
    }

    return false;
  }

  //Show Game over dialog
  void showGameOverDialog(String message) {
    // Determine which image to show
    String imagePath;
    if (message.contains('You Win')) {
      imagePath = ImagePaths().WIN;
    } else if (message.contains('Computer Wins')) {
      imagePath = ImagePaths().LOSE;
    } else {
      imagePath = ImagePaths().DRAW;
    }

    Future.delayed(Duration.zero, () {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: Colors.yellow[100],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(color: Colors.black, width: 2),
          ),
          title: Center(
            child: Column(
              children: [
                Image.asset(
                  imagePath,
                  height: 100,
                  width: 100,
                ),
                SizedBox(height: 10),
                Text(
                    'Game Over!',
                    style: TextStyle(fontFamily: "Orbitron"),
                ),
              ],
            ),
          ),
          content: Padding(
            padding: const EdgeInsets.only(left: 14),
            child: Text(
              message,
              style: TextStyle(fontSize: 25,fontFamily: "Poppins"),
              textAlign: TextAlign.center,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pushReplacementNamed(context, "/home"),
              child: Text(
                "Back to Home",
                style: TextStyle(color: Colors.red[400],fontFamily: "Poppins"),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                resetGame();
              },
              child: Text(
                "Play Again!",
                style: TextStyle(color: Colors.blue[800],fontFamily: "Poppins"),
              ),
            ),
          ],
        ),
        barrierColor: Colors.black.withOpacity(0.5),
        barrierDismissible: false,
      );
    });
  }
}