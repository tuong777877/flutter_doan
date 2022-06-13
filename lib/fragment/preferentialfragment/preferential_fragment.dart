import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_doan/fragment/preferentialfragment/components/body.dart';
import 'package:flutter_doan/style/coustom_bottom_nav_bar.dart';

import '../../enums.dart';

class PreferentialFragment extends StatelessWidget {
  static String routeName = "/Preferential_screen";
  const PreferentialFragment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      bottomNavigationBar:
          const CustomBottomNavBar(selectedMenu: MenuState.coupon),
    );
  }
}
