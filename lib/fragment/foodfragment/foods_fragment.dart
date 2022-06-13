import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_doan/enums.dart';
import 'package:flutter_doan/fragment/categoryfood/categoryfood_fragment.dart';
import 'package:flutter_doan/fragment/foodfragment/components/body.dart';
import 'package:flutter_doan/fragment/foodfragment/food_fragment_list.dart';
import 'package:flutter_doan/style/coustom_bottom_nav_bar.dart';

class FoodHomeFragment extends StatelessWidget {
  static String routeName = "/foods_screen";
  const FoodHomeFragment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.food),
    );
  }
}
