import 'package:flutter/material.dart';

import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    gotoHome();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Image.network(
        'https://cdn.pixabay.com/photo/2018/02/17/00/06/school-3158985_640.png',
        height: 300,
      )),
    );
  }

  Future<void> gotoHome() async {
    await Future.delayed( const Duration(seconds: 3));
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (ctx) =>const HomeScreen()));
  }
}
