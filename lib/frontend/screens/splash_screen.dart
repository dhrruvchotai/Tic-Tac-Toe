import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late AnimationController _drawingController;
  late AnimationController _typingController;
  bool _showTic = false;
  bool _showTac = false;
  bool _showToe = false;

  @override
  void initState() {
    super.initState();

    _drawingController = AnimationController(
      duration: Duration(seconds: 7),
      vsync: this,
    );

    _typingController = AnimationController(
      duration: Duration(seconds: 7),
      vsync: this,
    );

    _drawingController.forward();
    _typingController.forward();

    // Animate words sequentially
    Future.delayed(Duration(milliseconds: 1200), () {
      setState(() => _showTic = true);
      Future.delayed(Duration(milliseconds: 1200), () {
        setState(() => _showTac = true);
        Future.delayed(Duration(milliseconds: 1200), () {
          setState(() => _showToe = true);
        });
      });
    });

    Future.delayed(Duration(milliseconds: 6200), () {
      Navigator.pushReplacementNamed(context, '/home');
    });
  }

  @override
  void dispose() {
    _drawingController.dispose();
    _typingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[100],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              'lib/frontend/assets/json/splash_animation_main.json',
              controller: _drawingController,
              onLoaded: (composition) {
                _drawingController
                  ..duration = composition.duration
                  ..forward();
              },
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedOpacity(
                  opacity: _showTic ? 1.0 : 0.0,
                  duration: Duration(milliseconds: 800),
                  child: Text(
                    'Tic ',
                    style: TextStyle(
                      fontFamily: "Orbitron",
                      fontSize: 45.0,
                      fontWeight: FontWeight.w700,
                      color: Colors.blue[800],
                      shadows: [
                        Shadow(
                          blurRadius: 7.0,
                          color: Colors.black38,
                          offset: Offset(2.0, 2.0),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 5),
                AnimatedOpacity(
                  opacity: _showTac ? 1.0 : 0.0,
                  duration: Duration(milliseconds: 800),
                  child: Text(
                    'Tac ',
                    style: TextStyle(
                      fontFamily: "Orbitron",
                      fontSize: 45.0,
                      fontWeight: FontWeight.w700,
                      color: Colors.black87,
                      shadows: [
                        Shadow(
                          blurRadius: 7.0,
                          color: Colors.black38,
                          offset: Offset(2.0, 2.0),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 5),
                AnimatedOpacity(
                  opacity: _showToe ? 1.0 : 0.0,
                  duration: Duration(milliseconds: 800),
                  child: Text(
                    'Toe',
                    style:TextStyle(
                      fontFamily: "Orbitron",
                      fontSize: 45.0,
                      fontWeight: FontWeight.w700,
                      color: Colors.red[400],
                      shadows: [
                        Shadow(
                          blurRadius: 7.0,
                          color: Colors.black38,
                          offset: Offset(2.0, 2.0),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}