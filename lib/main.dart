import 'package:flutter/material.dart';
import 'package:flutter_doan/fragment/tablefragment/table_booking.dart';
import 'package:flutter_doan/homepage/homepage.dart';
import 'package:flutter_doan/routes.dart';
import 'package:flutter_doan/signin/signin.dart';
import 'package:flutter_doan/style/color.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      routes: routes,
      home: HomePage(),
    );
  }
}
