import 'package:flutter/material.dart';
import 'package:flutter_doan/cart/components/checkoutcart.dart';
import 'package:flutter_doan/model/carts.dart';
import 'package:flutter_doan/model/items.dart';
import 'package:flutter_doan/model/tableitems.dart';
import 'components/body.dart';

class CartPage extends StatefulWidget {
  static String routeName = "/carts";
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}
// double sum = 0.0;

class _CartPageState extends State<CartPage> {
  // List<Items> cartdetails = Cart().getCart();
  // List<TableItems> cartTBdetails = CartTable().getCartTB();
  // @override
  // void initState() {
  //   super.initState();
  //   sum = 0.0;
  //   for (var item in cartdetails) {
  //     sum = sum + item.quantity * item.food!.Price;
  //   }
  //   for (var itemtable in cartTBdetails) {
  //     sum = sum + itemtable.table!.price;
  //   }
  //   //cartTB = CartTable().getCartTable();
  // }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(
        
      ),
      // bottomNavigationBar: CheckOutCart(
      //   sum: 0,
      // ),
      //bottomNavigationBar: CheckOutCart(sum: sum),
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
