import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_doan/model/foods.dart';
import 'package:flutter_doan/model/tables.dart';

class Cart {
  static List<Foods> cart = [];
  void addProductToCart(Foods food) {
    if (!cart.contains(food)) {
      cart.add(food);
    }
  }

  List<Foods> getCart() {
    return cart;
  }
}

class CartTable {
  static List<Tables> cartTB = [];
  void addTableToCart(Tables table) {
    if (!cartTB.contains(table)) {
      cartTB.add(table);
    }
    //cart.add(food);
  }

  List<Tables> getCartTB() {
    return cartTB;
  }
}
