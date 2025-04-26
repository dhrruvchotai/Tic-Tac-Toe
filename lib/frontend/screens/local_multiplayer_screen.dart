import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tic_tac_toe/frontend/constants/image_paths.dart';

class LocalMultiplayerScreen extends StatefulWidget {

  String? PlayerOneName;
  int? PlayerOneSelectedAvatarIndex;
  String? PlayerOneSelectedSymbol;
  String? PlayerTwoName;
  int? PlayerTwoSelectedAvatarIndex;
  String? PlayerTwoSelectedSymbol;

  LocalMultiplayerScreen({super.key,this.PlayerOneName,this.PlayerOneSelectedAvatarIndex = 1,this.PlayerOneSelectedSymbol = "x",this.PlayerTwoName,this.PlayerTwoSelectedAvatarIndex = 2,this.PlayerTwoSelectedSymbol = "o"});

  @override
  State<LocalMultiplayerScreen> createState() => _LocalMultiplayerScreenState();
}

class _LocalMultiplayerScreenState extends State<LocalMultiplayerScreen> {
  bool isPlayerOneTurn = true;
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
        child: Column(
          children: [
            // Player info cards (your existing code)
            Padding(
              padding: const EdgeInsets.only(right: 5, top: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 210,
                    width: 150,
                    decoration: BoxDecoration(
                        color: isPlayerOneTurn ? Colors.blue[300] : Colors.blue[800],
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: isPlayerOneTurn ? Colors.black: Colors.blue,width: 3)
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: CircleAvatar(
                            child: Image.asset(ImagePaths().AVATARS[widget.PlayerOneSelectedAvatarIndex!],height: 70,),
                            minRadius: 1,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(
                            widget.PlayerOneName ?? "Player 1",
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
                                  widget.PlayerOneSelectedSymbol!,
                                  style: TextStyle(
                                      fontFamily: "Orbitron",
                                      color: widget.PlayerOneSelectedSymbol == "x" ? Colors.red : Colors.blue,
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
                        color: isPlayerOneTurn ? Colors.red[400] : Colors.red[200],
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: isPlayerOneTurn ? Colors.red : Colors.black,width: 3)
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: CircleAvatar(
                            child: Image.asset(ImagePaths().AVATARS[widget.PlayerTwoSelectedAvatarIndex!],height: 70,),
                            minRadius: 1,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(
                            widget.PlayerTwoName ?? "Player 2",
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
                                  widget.PlayerTwoSelectedSymbol!,
                                  style: TextStyle(
                                      fontFamily: "Orbitron",
                                      color: widget.PlayerTwoSelectedSymbol == "o" ? Colors.blue : Colors.red,
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
                ],
              ),
            ),
            SizedBox(height: 40),
            // Game board
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: GridView.builder(
                  itemCount: 9,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 1,
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => _handleMove(index),
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
                              color: displaySymbol[index] == "x"
                                  ? Colors.red[400]
                                  : Colors.blue[800],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleMove(int index) {
    if (displaySymbol[index].isEmpty) {
      setState(() {
        displaySymbol[index] = isPlayerOneTurn
            ? widget.PlayerOneSelectedSymbol!
            : widget.PlayerTwoSelectedSymbol!;

        if (!_checkForWinner()) {
          isPlayerOneTurn = !isPlayerOneTurn;
        }
      });
    }
  }

  bool _checkForWinner() {
    final winningCombinations = [
      [0, 1, 2], [3, 4, 5], [6, 7, 8], // rows
      [0, 3, 6], [1, 4, 7], [2, 5, 8], // columns
      [0, 4, 8], [2, 4, 6],             // diagonals
    ];

    for (var combo in winningCombinations) {
      if (displaySymbol[combo[0]].isNotEmpty &&
          displaySymbol[combo[0]] == displaySymbol[combo[1]] &&
          displaySymbol[combo[1]] == displaySymbol[combo[2]]) {
        _showGameOverDialog(displaySymbol[combo[0]] == widget.PlayerOneSelectedSymbol
            ? '${widget.PlayerOneName} Wins!'
            : '${widget.PlayerTwoName} Wins!');
        return true;
      }
    }

    if (!displaySymbol.contains('')) {
      _showGameOverDialog('Game Tied!');
      return true;
    }

    return false;
  }

  void _showGameOverDialog(String message) {
    String imagePath;
    if (message.contains('Player 1 Wins!')) {
      imagePath = ImagePaths().AVATARS[widget.PlayerOneSelectedAvatarIndex!];
    } else if (message.contains('Player 2 Wins')) {
      imagePath = ImagePaths().AVATARS[widget.PlayerTwoSelectedAvatarIndex!];
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
                    style: TextStyle(fontFamily: "Orbitron")
                ),
              ],
            ),
          ),
          content: Padding(
            padding: const EdgeInsets.only(left : 15),
            child: Container(
            width: double.maxFinite,
            child: Text(
                message,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25,fontFamily: "Poppins"))),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pushReplacementNamed(context, "/home"),
              child: Text("Back to Home", style: TextStyle(color: Colors.red[400],fontFamily: "Poppins")),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  displaySymbol = List.filled(9, '');
                  isPlayerOneTurn = true;
                });
              },
              child: Text("Play Again!", style: TextStyle(color: Colors.blue[800],fontFamily: "Poppins")),
            ),
          ],
        ),
        barrierDismissible: false
      );
    });
  }
}