import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_doan/homepage/homepage.dart';
import 'package:flutter_doan/model/userModel.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../style/color.dart';
import '../widgets/reusable_widgets.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({ Key? key }) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _userNameTextController = TextEditingController();
  TextEditingController _phoneNumberTextController = TextEditingController();
  TextEditingController _addressTextController = TextEditingController();
  TextEditingController _imagesTextController = TextEditingController();
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
              reusableTextField("Enter Email", Icons.email_outlined, false,
              _emailTextController),
              const SizedBox(
                height: 20,
              ),
              reusableTextField("Enter Password", Icons.password_outlined, true,
              _passwordTextController),
              const SizedBox(
                height: 20,
              ),
              reusableTextField("Enter Phone number", Icons.phone_android_outlined, false,
              _phoneNumberTextController),
              const SizedBox(
                height: 20,
              ),
              reusableTextField("Enter address", Icons.home_max_outlined, false,
              _addressTextController),
              const SizedBox(
                height: 20,
              ),
              signInSignUpButton(context, false, (){
                FirebaseAuth.instance.createUserWithEmailAndPassword(
                  email: _emailTextController.text,
                  password: _passwordTextController.text).then((value){
                    postDetailsToFirestore();
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
  void signUp(String email, String password) async{
    if(_formKey.currentState!.validate()){
      await _auth.createUserWithEmailAndPassword(email: email, password: password).then((value) {
        postDetailsToFirestore();

      }).catchError((e){
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }
  	postDetailsToFirestore() async{
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;
    UserModel userModel = UserModel();
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.userName = _userNameTextController.text;
    userModel.address = _addressTextController.text;
    userModel.phoneNumber = _phoneNumberTextController.text;
    userModel.images = _imagesTextController.text;

    await firebaseFirestore.collection("users").doc(user.uid).set(userModel.toMap());
    Fluttertoast.showToast(msg: "Account Create success");

    Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
  }
}