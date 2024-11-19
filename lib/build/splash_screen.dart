import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import '../navigation/my_routes.dart';
import '../utils/app_utils.dart';
import '../utils/log.dart';
import '../utils/session_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  GetIt locator = GetIt.instance;

  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFBFEAF5),
              Color(0xFFEEF6F7),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Image.asset(
            "assets/images/insight-users.png",
            width: 300, // Adjust size as needed
            height: 300,
          ),
        ),
      ),
    );
  }



  _navigateTo(String destination) {
    Timer(const Duration(milliseconds: 1200), () {
      Navigator.pushReplacementNamed(context, destination);
    });
  }


  Future<void> checkLoginStatus() async {
    await locator.get<SessionManager>().init();
    await locator.get<SessionManager>().isLoggedIn().then((value) async {
      if (value!) {
        _navigateTo(MyRoutes.homePage);
      } else {
        Navigator.pushReplacementNamed(context, MyRoutes.homePage);
      }
    });
  }

}
