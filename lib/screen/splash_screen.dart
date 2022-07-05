import 'package:flutter/material.dart';

import 'home_screen.dart';

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({Key? key}) : super(key: key);

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
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
    await Future.delayed(Duration(seconds: 3));
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (ctx) => Home_Screen()));
  }
}
