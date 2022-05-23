import 'package:flutter/material.dart';
import 'package:flutter_doan/fragment/differencefragment/different_fragment.dart';
import 'package:flutter_doan/fragment/foodfragment/foods_fragment.dart';
import 'package:flutter_doan/fragment/preferentialfragment/preferential_fragment.dart';
import 'package:flutter_doan/fragment/tablefragment/table_fragment.dart';
import 'package:flutter_doan/homepage/homepage.dart';
import 'package:flutter_doan/model/carts.dart';
import 'package:flutter_doan/model/foods.dart';
import 'package:flutter_doan/model/items.dart';
import 'package:flutter_doan/model/tableitems.dart';
import 'package:flutter_doan/model/tables.dart';
import 'package:flutter_doan/style/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../enums.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    Key? key,
    required this.selectedMenu,
  }) : super(key: key);

  final MenuState selectedMenu;

  @override
  Widget build(BuildContext context) {
    final Color inActiveIconColor = const Color(0xFFB6B6B6);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -15),
            blurRadius: 20,
            color: const Color(0xFFDADADA).withOpacity(0.15),
          ),
        ],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: SafeArea(
          top: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(
                  Icons.home,
                  color: MenuState.home == selectedMenu
                      ? kPrimaryColor
                      : inActiveIconColor,
                ),
                onPressed: () =>
                    Navigator.pushNamed(context, HomePage.routeName),
              ),
              IconButton(
                icon: Icon(
                  Icons.table_bar_rounded,
                  color: MenuState.table == selectedMenu
                      ? kPrimaryColor
                      : inActiveIconColor,
                ),
                onPressed: () =>
                    Navigator.pushNamed(context, TableFragement.routeName),
              ),
              IconButton(
                icon: Icon(
                  Icons.food_bank,
                  color: MenuState.food == selectedMenu
                      ? kPrimaryColor
                      : inActiveIconColor,
                ),
                onPressed: () =>
                    Navigator.pushNamed(context, FoodHomeFragment.routeName),
              ),
              IconButton(
                icon: Icon(
                  Icons.card_giftcard_outlined,
                  color: MenuState.coupon == selectedMenu
                      ? kPrimaryColor
                      : inActiveIconColor,
                ),
                onPressed: () => Navigator.pushNamed(
                    context, PreferentialFragment.routeName),
              ),
              IconButton(
                icon: Icon(
                  Icons.account_circle,
                  color: MenuState.difference == selectedMenu
                      ? kPrimaryColor
                      : inActiveIconColor,
                ),
                onPressed: () =>
                    Navigator.pushNamed(context, DifferentFragment.routeName),
              ),
            ],
          )),
    );
  }
}

class ShoppingCart extends StatelessWidget {
  //Cart cart;
  List<Items> cartdetails = Cart().getCart();
  List<TableItems> cartTBdetails = CartTable().getCartTB();
  ShoppingCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Expanded(
          //height: 150,
          //color: Colors.white,
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: cartTBdetails.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    GestureDetector(
                      child: CartTBSP(
                        tableItems: cartTBdetails[index],
                      ),
                    ),
                    const Divider()
                  ],
                );
              }),
        ),
        Mybutton(),
      ],
    );
  }
}

class CartTBSP extends StatelessWidget {
  TableItems tableItems;

  CartTBSP({Key? key, required this.tableItems}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: <Widget>[
          Text(
            tableItems.table!.nameTable,
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
          ),
          Text(
            "${tableItems.table!.quantity}",
            style: const TextStyle(fontSize: 11, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

class Mybutton extends StatelessWidget {
  get borderRadius => BorderRadius.circular(8.0);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        elevation: 10,
        borderRadius: borderRadius,
        child: InkWell(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.all(0.0),
            height: 60.0, //MediaQuery.of(context).size.width * .08,
            width: 220.0, //MediaQuery.of(context).size.width * .3,
            decoration: BoxDecoration(
              borderRadius: borderRadius,
            ),
            child: Row(
              children: <Widget>[
                LayoutBuilder(builder: (context, constraints) {
                  print(constraints);
                  return Container(
                    height: constraints.maxHeight,
                    width: constraints.maxHeight,
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: borderRadius,
                    ),
                    child: Text(
                      "${Cart().getCart().length} items",
                      style: Theme.of(context).textTheme.caption,
                    ),
                  );
                }),
                const Expanded(
                  child: Text(
                    'Settings',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
