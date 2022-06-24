import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_doan/enums.dart';
import 'package:flutter_doan/signin/signin.dart';
import 'package:flutter_doan/style/coustom_bottom_nav_bar.dart';
import 'package:flutter_doan/style/size_config.dart';

import '../../model/userModal.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);
  static String routeName = "/profile_user";

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  final email = TextEditingController();
  final phone = TextEditingController();
  final city = TextEditingController();
  String name = '';
  List<UserModel> listUsers = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    final User? user = auth.currentUser;
    final uid = user!.uid;
    await users.get().then((value) {
      for (var doc in value.docs) {
        listUsers.add(UserModel(
            uid: doc.get('uid'),
            email: doc.get('email'),
            userName: doc.get('userName'),
            phoneNumber: doc.get('phoneNumber'),
            address: doc.get('address'),
            images: doc.get('images')));
      }
    });

    for (var i = 0; i < listUsers.length; i++) {
      var e = listUsers.elementAt(i);
      print(e);
      if (e.uid == uid) {
        email.text = e.email!.toString();
        phone.text = e.phoneNumber!.toString();
        city.text = e.address!.toString();
        name = e.userName.toString();
      }
    }
  }

  Widget _texrFormField(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: 15,
          ),
          child: TextFormField(
              controller: email,
              style: TextStyle(color: Colors.black),
              decoration: const InputDecoration(
                counterStyle: TextStyle(color: Colors.black),
                focusColor: Colors.black,
                icon: Icon(Icons.email),
                //  hintText: 'nguyendaoduchuy@gmail.com',
                hintStyle: TextStyle(color: Colors.black),
              )),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: 15,
          ),
          child: TextFormField(
              obscureText: true,
              style: TextStyle(color: Colors.black),
              decoration: const InputDecoration(
                counterStyle: TextStyle(color: Colors.black),
                focusColor: Colors.black,
                icon: Icon(Icons.lock),
                hintText: '*******',
                hintStyle: TextStyle(color: Colors.black),
              )),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: 15,
          ),
          child: TextFormField(
              controller: phone,
              style: TextStyle(color: Colors.black),
              decoration: const InputDecoration(
                counterStyle: TextStyle(color: Colors.black),
                focusColor: Colors.black,
                icon: Icon(Icons.phone),
                hintText: '0123456789',
                hintStyle: TextStyle(color: Colors.black),
              )),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: 15,
          ),
          child: TextFormField(
              controller: city,
              style: TextStyle(color: Colors.black),
              decoration: const InputDecoration(
                counterStyle: TextStyle(color: Colors.black),
                focusColor: Colors.black,
                icon: Icon(Icons.home),
                hintText: 'HCM city',
                hintStyle: TextStyle(color: Colors.black),
              )),
        ),
        SizedBox(
          height: 20,
        ),
        Center(
          child: Container(
            height: 55,
            width: 100,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Color.fromARGB(90, 20, 20, 20),
                blurRadius: 10,
                offset: Offset(6, 6),
              )
            ]),
            child: Center(
              child: Row(
                children: [
                  RaisedButton(
                    color: Colors.white,
                    onPressed: () {
                      FirebaseAuth.instance.signOut().then((value) {
                        Navigator.pushReplacementNamed(
                            context, SignInScreen.routeName);
                      });
                    },
                    child: Text(
                      'Log out',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar:
          const CustomBottomNavBar(selectedMenu: MenuState.profile),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20)),
          ),
          Container(
            color: Colors.white,
            height: double.infinity,
            width: double.infinity,
            padding: EdgeInsets.only(top: 250, left: 20, right: 20),
            child: SingleChildScrollView(
              child: _texrFormField(context),
            ),
          ),
          Container(
            height: 180,
            color: Colors.white,
          ),
          Container(
            width: double.infinity,
            height: 190,
            margin: EdgeInsets.symmetric(
              vertical: 40,
              horizontal: 20,
            ),
            decoration: BoxDecoration(
                color: Color(0xfff6f6f6),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(90, 20, 20, 20),
                    blurRadius: 0.8,
                    offset: Offset(9, 9),
                  )
                ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 45,
                    child: CircleAvatar(
                      backgroundColor: Colors.grey,
                      radius: 42,
                      backgroundImage:
                          AssetImage('assets/images/ic_vinmart.jpg'),
                    )),
                SizedBox(
                  height: 2,
                ),
                Text(
                  name,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  email.text,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
