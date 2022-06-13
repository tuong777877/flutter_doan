import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_doan/enums.dart';
import 'package:flutter_doan/homepage/components/body.dart';
import 'package:flutter_doan/style/coustom_bottom_nav_bar.dart';

class HomePage extends StatelessWidget {
  static String routeName = "/home_screen";
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 200,
          child: ShoppingCart(),
        ),
        Scaffold(
          body: Body(),
          bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
        ),
      ],
    );
  }
}
