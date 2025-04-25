import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tic_tac_toe/frontend/constants/user_constants.dart';

class SelectGameDetailsScreen extends StatefulWidget {
  final bool?  isGameVsComputer;
  const SelectGameDetailsScreen({super.key,this.isGameVsComputer});

  @override
  State<SelectGameDetailsScreen> createState() => _SelectGameDetailsScreenState();
}

class _SelectGameDetailsScreenState extends State<SelectGameDetailsScreen> {
  int SelectedAvatarIndex = 0;
  String SelectedUserSymbol = "x";
  int PlayerOneSelectedAvatarIndex = 0;
  int PlayerTwoSelectedAvatarIndex = 2;
  String PlayerOneSelectedSymbol = "x";
  String PlayerTwoSelectedSymbol = "o";

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
                Text("Tic", style: GoogleFonts.orbitron(color: Colors.blue[800], fontSize: 35)),
                Text("Tac", style: GoogleFonts.orbitron(color: Colors.black87, fontSize: 35)),
                Text("Toe", style: GoogleFonts.orbitron(color: Colors.red[400], fontSize: 35)),
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
                  CupertinoIcons.back,
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
                      child: Text("Your Name   ", style: GoogleFonts.orbitron(
                          fontSize: 22,
                          fontWeight: FontWeight.w700
                      )),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: TextFormField(
                          style: GoogleFonts.poppins(color: Colors.black87, fontWeight: FontWeight.w600, fontSize: 18),
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
                      child: Text("Avatar", style: GoogleFonts.orbitron(
                          fontSize: 22,
                          fontWeight: FontWeight.w700
                      )),
                    ),
                    const SizedBox(width: 20),
                    for (int i = 0; i < UserConstants().AVATARS.length; i++)
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              SelectedAvatarIndex = i;
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: SelectedAvatarIndex == i
                                  ? Border.all(color: Colors.red, width: 2)
                                  : null,
                            ),
                            child: CircleAvatar(
                              child: Image.asset(
                                UserConstants().AVATARS[i],
                                width: SelectedAvatarIndex == i ? 50 : 40,
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
                    Text("Choose A Side", style: GoogleFonts.orbitron(
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
                                SelectedUserSymbol = "x";
                              });
                            },
                            child: Container(
                              width: 150, // Reduced size
                              height: 160, // Reduced size
                              margin: const EdgeInsets.all(10), // Added margin
                              decoration: BoxDecoration(
                                color: Colors.yellow.withOpacity(0.4),
                                borderRadius: BorderRadius.circular(20),
                                border: SelectedUserSymbol == "x"
                                    ? Border.all(color: Colors.red, width: 3,)
                                    : null,
                              ),
                              child: Center(
                                child: Text(
                                  "x",
                                  style: GoogleFonts.carterOne(
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
                                SelectedUserSymbol = "o";
                              });
                            },
                            child: Container(
                              width: 150, // Reduced size
                              height: 160, // Reduced size
                              margin: const EdgeInsets.all(10), // Added margin
                              decoration: BoxDecoration(
                                color: Colors.yellow.withOpacity(0.4),
                                borderRadius: BorderRadius.circular(20),
                                border: SelectedUserSymbol == "o"
                                    ? Border.all(color: Colors.red, width: 3)
                                    : null,
                              ),
                              child: Center(
                                child: Text(
                                  "o",
                                  style: GoogleFonts.carterOne(
                                    color: Colors.blue,
                                    fontSize: 100, // Reduced font size
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
                      Navigator.pushReplacementNamed(context, "/play_vs_computer",);
                    }, child: Text("Start Game",
                      style: GoogleFonts.orbitron(
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
                      child: Text("Player 1", style: GoogleFonts.orbitron(
                          fontSize: 22,
                          fontWeight: FontWeight.w700
                      )),
                    ),
                    Expanded( // Added Expanded to prevent overflow
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: TextFormField(
                          style: GoogleFonts.poppins(color: Colors.black87, fontWeight: FontWeight.w600, fontSize: 18),
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
                      child: Text("Avatar", style: GoogleFonts.orbitron(
                          fontSize: 22,
                          fontWeight: FontWeight.w700
                      )),
                    ),
                    const SizedBox(width: 20),
                    for (int i = 0; i < UserConstants().AVATARS.length; i++)
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
                                UserConstants().AVATARS[i],
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
                                  style: GoogleFonts.carterOne(
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
                                  style: GoogleFonts.carterOne(
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
                      child: Text("Player 2", style: GoogleFonts.orbitron(
                          fontSize: 22,
                          fontWeight: FontWeight.w700
                      )),
                    ),
                    Expanded( // Added Expanded to prevent overflow
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: TextFormField(
                          style: GoogleFonts.poppins(color: Colors.black87, fontWeight: FontWeight.w600, fontSize: 18),
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
                      child: Text("Avatar", style: GoogleFonts.orbitron(
                          fontSize: 22,
                          fontWeight: FontWeight.w700
                      )),
                    ),
                    const SizedBox(width: 20),
                    for (int i = 0; i < UserConstants().AVATARS.length; i++)
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
                                UserConstants().AVATARS[i],
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
                                  style: GoogleFonts.carterOne(
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
                                  style: GoogleFonts.carterOne(
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
                      Navigator.pushReplacementNamed(context, "/local_multiplayer");
                    }, child: Text("Start Game",
                      style: GoogleFonts.orbitron(
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