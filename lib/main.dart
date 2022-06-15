import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_doan/fragment/differencefragment/splash_page.dart';
import 'package:flutter_doan/fragment/tablefragment/table_booking.dart';
import 'package:flutter_doan/homepage/homepage.dart';
import 'package:flutter_doan/routes.dart';
import 'package:flutter_doan/signin/signin.dart';
import 'package:flutter_doan/style/color.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
void main() async {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = 'pk_test_51L8xcgHalZvwhJhB0VbkdC9uhb298NNfqeqG1T4hbCbW6Fe5vCvgpSeVwTkeH6cFUx4MKoM84y0pO7YuvDmdcnNG006alGpuK3';
  await Stripe.instance.applySettings();
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
      home: SplashPage(),
    );
  }
}
