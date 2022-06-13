import 'package:flutter/material.dart';
import 'package:flutter_doan/cart/components/checkoutcart.dart';
import 'package:flutter_doan/model/carts.dart';
import 'components/body.dart';

class CartPage extends StatelessWidget {
  static String routeName = "/carts";
  const CartPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
      // bottomNavigationBar: CheckOutCart(
      //   sum: 0,
      // ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Column(
        children: [
          Text(
            "Your Cart",
            style: TextStyle(color: Colors.black),
          ),
          Text(
            "${Cart().getCart().length} items",
            style: Theme.of(context).textTheme.caption,
          ),
        ],
      ),
    );
  }
}
