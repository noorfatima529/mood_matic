import 'package:flutter/material.dart';
import 'package:mood_matic/presentation/screens/home/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../auth/login.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    LoginInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: 15,
          width: 15,
          child: Image.asset('assets/images/mood matic2.png')),
    );
  }

  Future<void> LoginInfo() async {
    SharedPreferences prefes = await SharedPreferences.getInstance();
    bool isLoggedin = prefes.getBool('isLoggedin') ?? false;
    Future.delayed(const Duration(seconds: 3), () {
      if (isLoggedin == true) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Home()));
      }
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Login()));
    });
  }
}
