import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tic_tac_toe/frontend/constants/image_paths.dart';

class SelectGameDetailsScreen extends StatefulWidget {
  final bool?  isGameVsComputer;
  const SelectGameDetailsScreen({super.key,this.isGameVsComputer});

  @override
  State<SelectGameDetailsScreen> createState() => _SelectGameDetailsScreenState();
}

class _SelectGameDetailsScreenState extends State<SelectGameDetailsScreen> {
  //For Playing Vs Computer
  int PlayerSelectedAvatarIndex = 0;
  String PlayerSelectedSymbol = "x";

  //For Local Multiplayer
  int PlayerOneSelectedAvatarIndex = 0;
  int PlayerTwoSelectedAvatarIndex = 2;
  String PlayerOneSelectedSymbol = "x";
  String PlayerTwoSelectedSymbol = "o";

  //For Playing Vs Computer
  TextEditingController PlayerName = TextEditingController(text: "Player");
  //For Local Multiplayer
  TextEditingController PlayerOneName = TextEditingController(text: "Player 1");
  TextEditingController PlayerTwoName = TextEditingController(text: "Player 2");

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
      body: SafeArea(
        child: SingleChildScrollView(
          child: widget.isGameVsComputer!
              ? Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 7),
                      child: Text("Your Name   ", style: TextStyle(
                          fontFamily: "Orbitron",
                          fontSize: 22,
                          fontWeight: FontWeight.w700
                      )),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: TextFormField(
                          controller: PlayerName,
                          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w600, fontSize: 18,fontFamily: "Poppins"),
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(10),
                          ],
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(color: Colors.black87)
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(color: Colors.red, width: 2),
                                  borderRadius: BorderRadius.circular(10)
                              )
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 30),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Text("Avatar", style: TextStyle(
                          fontFamily: "Orbitron",
                          fontSize: 22,
                          fontWeight: FontWeight.w700
                      )),
                    ),
                    const SizedBox(width: 20),
                    for (int i = 0; i < ImagePaths().AVATARS.length; i++)
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              PlayerSelectedAvatarIndex = i;
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: PlayerSelectedAvatarIndex == i
                                  ? Border.all(color: Colors.red, width: 2)
                                  : null,
                            ),
                            child: CircleAvatar(
                              child: Image.asset(
                                ImagePaths().AVATARS[i],
                                width: PlayerSelectedAvatarIndex == i ? 50 : 40,
                              ),
                              minRadius: 1,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top : 40), // Reduced padding
                child: Column(
                  children: [
                    Text("Choose A Side", style: TextStyle(
                        fontFamily: "Orbitron",
                        fontSize: 24,
                        fontWeight: FontWeight.w700
                    )),
                    const SizedBox(height: 20), // Added spacing
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                PlayerSelectedSymbol = "x";
                              });
                            },
                            child: Container(
                              width: 150, // Reduced size
                              height: 160, // Reduced size
                              margin: const EdgeInsets.all(10), // Added margin
                              decoration: BoxDecoration(
                                color: Colors.yellow.withOpacity(0.4),
                                borderRadius: BorderRadius.circular(20),
                                border: PlayerSelectedSymbol == "x"
                                    ? Border.all(color: Colors.red, width: 3,)
                                    : null,
                              ),
                              child: Center(
                                child: Text(
                                  "x",
                                  style: TextStyle(
                                    fontFamily: "Orbitron",
                                    color: Colors.red,
                                    fontSize: 100, // Reduced font size
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                PlayerSelectedSymbol = "o";
                              });
                            },
                            child: Container(
                              width: 150,
                              height: 160,
                              margin: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.yellow.withOpacity(0.4),
                                borderRadius: BorderRadius.circular(20),
                                border: PlayerSelectedSymbol == "o"
                                    ? Border.all(color: Colors.red, width: 3)
                                    : null,
                              ),
                              child: Center(
                                child: Text(
                                  "o",
                                  style: TextStyle(
                                    fontFamily: "Orbitron",
                                    color: Colors.blue,
                                    fontSize: 100,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: SizedBox(
                    width: 300,
                    height: 70,
                    child: ElevatedButton(onPressed: (){
                      Navigator.pushReplacementNamed(context, "/play_vs_computer",arguments: {
                        "PlayerName" : PlayerName.text ?? "Player",
                        "PlayerSelectedAvatarIndex" : PlayerSelectedAvatarIndex ?? 0,
                        "PlayerSelectedSymbol" : PlayerSelectedSymbol ?? "x"
                      });
                    }, child: Text("Start Game",
                      style: TextStyle(
                        fontFamily: "Orbitron",
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),style: ElevatedButton.styleFrom(backgroundColor:Colors.red[400],side: BorderSide(color: Colors.black87,strokeAlign: 2,width: 3)),)),
              )
            ],
          )
              : Column(
            children: [
              //Player 1
              Padding(
                padding: const EdgeInsets.only(top: 5,left: 20,right: 20),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 7,left: 10),
                      child: Text("Player 1", style: TextStyle(
                          fontFamily: "Orbitron",
                          fontSize: 22,
                          fontWeight: FontWeight.w700
                      )),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: TextFormField(
                          controller: PlayerOneName,
                          style: TextStyle(fontFamily: "Poppins",color: Colors.black87, fontWeight: FontWeight.w600, fontSize: 18),
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(10),
                          ],
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(color: Colors.black87)
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(color: Colors.red, width: 2),
                                  borderRadius: BorderRadius.circular(10)
                              )
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 14),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Text("Avatar", style: TextStyle(
                          fontFamily: "Orbitron",
                          fontSize: 22,
                          fontWeight: FontWeight.w700
                      )),
                    ),
                    const SizedBox(width: 20),
                    for (int i = 0; i < ImagePaths().AVATARS.length; i++)
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              PlayerOneSelectedAvatarIndex = i;
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: PlayerOneSelectedAvatarIndex == i
                                  ? Border.all(color: Colors.red, width: 2)
                                  : null,
                            ),
                            child: CircleAvatar(
                              child: Image.asset(
                                ImagePaths().AVATARS[i],
                                width: PlayerOneSelectedAvatarIndex == i ? 50 : 40,
                              ),
                              minRadius: 1,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top : 10), // Reduced padding
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 2),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                PlayerOneSelectedSymbol = "x";
                              });
                            },
                            child: Container(
                              width: 80, // Reduced size
                              height: 80, // Reduced size
                              margin: const EdgeInsets.all(10), // Added margin
                              decoration: BoxDecoration(
                                color: Colors.yellow.withOpacity(0.4),
                                borderRadius: BorderRadius.circular(20),
                                border: PlayerOneSelectedSymbol == "x"
                                    ? Border.all(color: Colors.red, width: 3,)
                                    : null,
                              ),
                              child: Center(
                                child: Text(
                                  "x",
                                  style: TextStyle(
                                    fontFamily: "Orbitron",
                                    color: Colors.red,
                                    fontSize: 50, // Reduced font size
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                PlayerOneSelectedSymbol = "o";
                              });
                            },
                            child: Container(
                              width: 80, // Reduced size
                              height: 80, // Reduced size
                              margin: const EdgeInsets.all(10), // Added margin
                              decoration: BoxDecoration(
                                color: Colors.yellow.withOpacity(0.4),
                                borderRadius: BorderRadius.circular(20),
                                border: PlayerOneSelectedSymbol == "o"
                                    ? Border.all(color: Colors.red, width: 3)
                                    : null,
                              ),
                              child: Center(
                                child: Text(
                                  "o",
                                  style: TextStyle(
                                    fontFamily: "Orbitron",
                                    color: Colors.blue,
                                    fontSize: 50, // Reduced font size
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              //Player 2
              Padding(
                padding: const EdgeInsets.only(top: 25,left: 20,right: 20),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 7,left: 10),
                      child: Text("Player 2", style: TextStyle(
                          fontFamily: "Orbitron",
                          fontSize: 22,
                          fontWeight: FontWeight.w700
                      )),
                    ),
                    Expanded( // Added Expanded to prevent overflow
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: TextFormField(
                          controller: PlayerTwoName,
                          style: TextStyle(
                              fontFamily: "Poppins",
                              color: Colors.black87, fontWeight: FontWeight.w600, fontSize: 18),
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(10),
                          ],
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(color: Colors.black87)
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(color: Colors.red, width: 2),
                                  borderRadius: BorderRadius.circular(10)
                              )
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 14),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Text("Avatar", style:TextStyle(
                          fontFamily: "Orbitron",
                          fontSize: 22,
                          fontWeight: FontWeight.w700
                      )),
                    ),
                    const SizedBox(width: 20),
                    for (int i = 0; i < ImagePaths().AVATARS.length; i++)
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              PlayerTwoSelectedAvatarIndex = i;
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: PlayerTwoSelectedAvatarIndex == i
                                  ? Border.all(color: Colors.red, width: 2)
                                  : null,
                            ),
                            child: CircleAvatar(
                              child: Image.asset(
                                ImagePaths().AVATARS[i],
                                width: PlayerTwoSelectedAvatarIndex == i ? 50 : 40,
                              ),
                              minRadius: 1,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top : 10), // Reduced padding
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 2),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                PlayerTwoSelectedSymbol = "x";
                              });
                            },
                            child: Container(
                              width: 80, // Reduced size
                              height: 80, // Reduced size
                              margin: const EdgeInsets.all(10), // Added margin
                              decoration: BoxDecoration(
                                color: Colors.yellow.withOpacity(0.4),
                                borderRadius: BorderRadius.circular(20),
                                border: PlayerTwoSelectedSymbol == "x"
                                    ? Border.all(color: Colors.red, width: 3,)
                                    : null,
                              ),
                              child: Center(
                                child: Text(
                                  "x",
                                  style: TextStyle(
                                    fontFamily: "Orbitron",
                                    color: Colors.red,
                                    fontSize: 50,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                PlayerTwoSelectedSymbol = "o";
                              });
                            },
                            child: Container(
                              width: 80, // Reduced size
                              height: 80, // Reduced size
                              margin: const EdgeInsets.all(10), // Added margin
                              decoration: BoxDecoration(
                                color: Colors.yellow.withOpacity(0.4),
                                borderRadius: BorderRadius.circular(20),
                                border: PlayerTwoSelectedSymbol == "o"
                                    ? Border.all(color: Colors.red, width: 3)
                                    : null,
                              ),
                              child: Center(
                                child: Text(
                                  "o",
                                  style: TextStyle(
                                    fontFamily: "Orbitron",
                                    color: Colors.blue,
                                    fontSize: 50, // Reduced font size
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              //Play Game Button
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: SizedBox(
                    width: 300,
                    height: 70,
                    child: ElevatedButton(onPressed: (){
                      Navigator.pushReplacementNamed(
                        context, "/local_multiplayer",
                        arguments:{
                          "PlayerOneName":PlayerOneName.text,
                          "PlayerOneSelectedAvatarIndex":PlayerOneSelectedAvatarIndex,
                          "PlayerOneSelectedSymbol" : PlayerOneSelectedSymbol,
                          "PlayerTwoName" : PlayerTwoName.text,
                          "PlayerTwoSelectedAvatarIndex": PlayerTwoSelectedAvatarIndex,
                          "PlayerTwoSelectedSymbol" : PlayerTwoSelectedSymbol
                        }
                      );
                    }, child: Text("Start Game",
                      style: TextStyle(
                        fontFamily: "Orbitron",
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),style: ElevatedButton.styleFrom(backgroundColor:Colors.red[400],side: BorderSide(color: Colors.black87,strokeAlign: 2,width: 3)),)),
              )
            ],
          ),
        ),
      ),
    );
  }
}