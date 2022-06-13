import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_doan/model/carts.dart';
import 'package:flutter_doan/model/items.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddFoodToCart extends StatefulWidget {
  Items item;

  AddFoodToCart({required this.item});

  @override
  _AddFoodToCartState createState() => _AddFoodToCartState();
}

class _AddFoodToCartState extends State<AddFoodToCart> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: RaisedButton(
        child: const Text(
          "ADD TO CART",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        color: Theme.of(context).colorScheme.secondary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        onPressed: () {
          Cart cart = Cart();
          cart.addProductToCart(widget.item);
          if (kDebugMode) {
            print(cart.getCart().length.toString());
          }
          Fluttertoast.showToast(
              msg: "Add to cart",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
        },
      ),
    );
  }
}
