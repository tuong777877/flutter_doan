import 'package:flutter/material.dart';
import 'package:flutter_doan/enums.dart';
import 'package:flutter_doan/fragment/profileUser/accountheader.dart';
import 'package:flutter_doan/homepage/components/homeheader.dart';
import 'package:flutter_doan/style/coustom_bottom_nav_bar.dart';
import 'package:flutter_doan/style/size_config.dart';

class ProfilePage extends StatelessWidget {

  Widget _texrFormField(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(padding: EdgeInsets.symmetric(vertical: 15,),
        child: TextFormField(
          style: TextStyle(
            color: Colors.black
          ),
          decoration: const InputDecoration(
            counterStyle: TextStyle(color: Colors.black),
            focusColor: Colors.black,
            icon: Icon(Icons.email),
            hintText: 'nguyendaoduchuy@gmail.com',
            hintStyle: TextStyle(
              color: Colors.black),
            )
          ),
        ),
        Padding(padding: EdgeInsets.symmetric(vertical: 15,),
        child: TextFormField(
          obscureText: true,
          style: TextStyle(
            color: Colors.black
          ),
          decoration: const InputDecoration(
            counterStyle: TextStyle(color: Colors.black),
            focusColor: Colors.black,
            icon: Icon(Icons.lock),
            hintText: '*******',
            hintStyle: TextStyle(
              color: Colors.black),
            )
          ),
        ),
        Padding(padding: EdgeInsets.symmetric(vertical: 15,),
        child: TextFormField(
          style: TextStyle(
            color: Colors.black
          ),
          decoration: const InputDecoration(
            counterStyle: TextStyle(color: Colors.black),
            focusColor: Colors.black,
            icon: Icon(Icons.phone),
            hintText: '0123456789',
            hintStyle: TextStyle(
              color: Colors.black),
            )
          ),
          
        ),
        Padding(padding: EdgeInsets.symmetric(vertical: 15,),
        child: TextFormField(
          style: TextStyle(
            color: Colors.black
          ),
          decoration: const InputDecoration(
            counterStyle: TextStyle(color: Colors.black),
            focusColor: Colors.black,
            icon: Icon(Icons.home),
            hintText: 'HCM city',
            hintStyle: TextStyle(
              color: Colors.black),
            )
          ),
        ),
        SizedBox(height: 20,),
        Center(
          child: Container(
            height: 55,
            width: 100,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(90, 20, 20, 20),
                  blurRadius: 10,
                  offset: Offset(6,6),

                )
              ]
            ),
            child: Center(
              child: RaisedButton(
                color: Colors.white,
                onPressed: (){},child: Text('Update', style: TextStyle(color: Colors.black,),),
                ),
            ),
          ),
        )
      ],
    );
  }

  const ProfilePage({ Key? key }) : super(key: key);
  static String routeName = "/profile_user";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: const CustomBottomNavBar(selectedMenu: MenuState.home),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
            ),
          Container(
            color: Colors.white,
            height: double.infinity,
            width: double.infinity,
            padding: EdgeInsets.only(top: 250, left: 20, right: 20),
            child: SingleChildScrollView(
              child: _texrFormField(),
              ),
          ),
          Container(
            height: 180,
            color: Colors.white,

          ),
          Container(
            width: double.infinity,
            height: 190,
            margin: EdgeInsets.symmetric(vertical: 40, horizontal: 20,),
            decoration: BoxDecoration(
              color: Color(0xfff6f6f6),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(90, 20, 20, 20),
                  blurRadius: 0.8,
                  offset: Offset(9,9),

                  )
              ]
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 45,
                  child: CircleAvatar(
                    backgroundColor: Colors.grey,
                    radius: 42,
                    backgroundImage: AssetImage('assets/images/ic_vinmart.jpg'),
                  )
                ),
                SizedBox(
                  height: 2,
                ),
                Text('Đức Huy', 
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                  ),
                  ),
                   SizedBox(
                  height: 2,
                ),
                Text('nguyendaoduchuy@gmail.com',
                style: TextStyle(color: Colors.grey[800],),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}