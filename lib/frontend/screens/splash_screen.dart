import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {

  late AnimationController _controller;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 4),
      vsync: this,
    );

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.pushNamed(context, "/home");
      }
    });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[800],
      body: Center(
        child: Lottie.asset(
          'lib/frontend/assets/json/splash_animation_main.json',
          controller: _controller,

          onLoaded: (composition) {
            _controller
              ..duration = composition.duration
              ..forward();

            _controller.addStatusListener((status) {
              if (status == AnimationStatus.completed) {
                Navigator.pushReplacementNamed(context, '/home');
              }
            });

          },
        ),
      ),
    );
  }
}