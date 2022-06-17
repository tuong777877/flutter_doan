import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_doan/homepage/homepage.dart';
import 'package:flutter_doan/signin/signin.dart';
import 'package:flutter_doan/signup/signuppage.dart';
import 'package:lottie/lottie.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({ Key? key }) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {


  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), ()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignInScreen())));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFFF800B), 
            Color(0xFFCE1010)]
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Lottie.asset('assets/animations/splashscreen.json'),
                Padding(padding: EdgeInsets.all(12.0),
                ),
                Text("Welcome to Food Restaurant!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
                )
              ],
            ),
            Padding(padding: EdgeInsets.all(12.0),
            ),
            CircularProgressIndicator()
          ]
        ),
      ),
    );
  }
}