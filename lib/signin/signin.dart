import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_doan/homepage/homepage.dart';
import 'package:flutter_doan/signup/signuppage.dart';
import '../style/color.dart';
import '../widgets/reusable_widgets.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);
    static String routeName = "/SignInPage";

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          hexStringToColor("FC6A21"),
          hexStringToColor("FF6600"),
          hexStringToColor("FF3300")
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: SingleChildScrollView(
            child: Padding(
          padding: EdgeInsets.fromLTRB(20, MediaQuery.of(context).size.height * 0.2, 20, 0),
          child: Column(
            children: <Widget>[
              logoWidget("assets/images/logofood.png"),
              SizedBox(
                height: 30,
              ),
              reusableTextField("Enter Email", Icons.person_outline, false, _emailTextController),
              SizedBox(
                height: 30,
              ),
              reusableTextField("Enter Password", Icons.lock_outline, true, _passwordTextController),
              SizedBox(
                height: 30,
              ),
              signInSignUpButton(context, true, (){
                FirebaseAuth.instance.signInWithEmailAndPassword(
                  email: _emailTextController.text,
                  password: _passwordTextController.text)
                .then((value) {
                  Navigator.push(context,
                   MaterialPageRoute(builder: (context) => HomePage()));
                }).onError((error, stackTrace) {
                  print("Error ${error.toString()}");
                });
              }),
              SignUpOption()
            ],
          ),
        )),
      ),
    );
  }
  Row SignUpOption(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have account?",
          style: TextStyle(color: Colors.white70)),
        GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen()));
          },
          child: const Text(
            "Sign Up",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        )
        
      ],
    );
  }
}

