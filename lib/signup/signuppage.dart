import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_doan/homepage/homepage.dart';
import '../style/color.dart';
import '../widgets/reusable_widgets.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({ Key? key }) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _userNameTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Sign Up",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
           hexStringToColor("FC6A21"),
          hexStringToColor("FF6600"),
          hexStringToColor("FF3300")
        ],
        begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: SingleChildScrollView(
            child: Padding(
          padding: EdgeInsets.fromLTRB(20, 120, 20, 0),
          child: Column(
            children: <Widget>[
              logoWidget("assets/images/logofood.png"),
              const SizedBox(
                height: 20,
              ),
              reusableTextField("Enter UserName", 
              Icons.person_outline, false,
              _userNameTextController),
              const SizedBox(
                height: 20,
              ),
              reusableTextField("Enter Email", Icons.person_outline, false,
              _emailTextController),
              const SizedBox(
                height: 20,
              ),
              reusableTextField("Enter Password", Icons.lock_outline, true,
              _passwordTextController),
              const SizedBox(
                height: 20,
              ),
              signInSignUpButton(context, false, (){
                FirebaseAuth.instance.createUserWithEmailAndPassword(
                  email: _emailTextController.text,
                  password: _passwordTextController.text).then((value){
                    print("Create new account!");
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                  }).onError((error, stackTrace) {
                    print("Error ${error.toString()}");
                  });
              })
            ],
          ),
      ))),
    );
  }
}