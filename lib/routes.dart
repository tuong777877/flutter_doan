import 'package:flutter/cupertino.dart';
import 'package:flutter_doan/cart/cartpage.dart';
import 'package:flutter_doan/fragment/differencefragment/different_fragment.dart';
import 'package:flutter_doan/fragment/foodfragment/foods_fragment.dart';
import 'package:flutter_doan/fragment/preferentialfragment/preferential_fragment.dart';
import 'package:flutter_doan/fragment/profileUser/profile.dart';
import 'package:flutter_doan/fragment/tablefragment/table_fragment.dart';
import 'package:flutter_doan/homepage/homepage.dart';

final Map<String, WidgetBuilder> routes = {
  // SignInPage.routeName: (context) => const SignInPage(),
  // SignUpPage.routeName: (context) => const SignUpPage(),
  HomePage.routeName: (context) => HomePage(),
  TableFragement.routeName: (context) => const TableFragement(),
  FoodHomeFragment.routeName: (context) => const FoodHomeFragment(),
  CartPage.routeName: (context) => const CartPage(),
  DifferentFragment.routeName: (context) => const DifferentFragment(),
  PreferentialFragment.routeName: (context) => const PreferentialFragment(),
  ProfilePage.routeName:(context) => const ProfilePage()
};
