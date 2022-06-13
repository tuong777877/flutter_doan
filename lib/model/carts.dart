import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_doan/model/foods.dart';
import 'package:flutter_doan/model/items.dart';
import 'package:flutter_doan/model/tableitems.dart';
import 'package:flutter_doan/model/tables.dart';

class Cart {
  static List<Items> cart = [];
  void addProductToCart(Items item) {
    if (!cart.contains(item)) {
      cart.add(item);
    }
  }

  List<Items> getCart() {
    return cart;
  }
}

class CartTable {
  static List<TableItems> cartTB = [];
  void addTableToCart(TableItems tableitem) {
    if (!cartTB.contains(tableitem)) {
      cartTB.add(tableitem);
    }
    //cart.add(food);
  }

  List<TableItems> getCartTB() {
    return cartTB;
  }
}
