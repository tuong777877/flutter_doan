import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_doan/model/carts.dart';
import 'package:flutter_doan/model/table.dart';
import 'package:flutter_doan/model/tableitems.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddTableToCart extends StatefulWidget {
  TableItems tableItem;
  AddTableToCart({required this.tableItem});


  @override
  State<AddTableToCart> createState() => _AddTableToCartState();
}

class _AddTableToCartState extends State<AddTableToCart> {
  bool isEnabled = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 44),
      width: double.infinity,
      child: RaisedButton(
        onPressed: () {
          CartTable cartTB = CartTable();
          if (cartTB.getCartTB().isNotEmpty ||
              widget.tableItem.datetime.isAfter(DateTime.now())) {
            Fluttertoast.showToast(
                msg: "Bạn đang đặt 1 bàn khác",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0);
          }
          else if (widget.tableItem.table?.state == false) {
            setState(() {
              isEnabled = false;
            });
            Fluttertoast.showToast(
                msg: "Bàn hiện đã có người đặt",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0);
          }
           else {
            cartTB.addTableToCart(widget.tableItem);
            if (kDebugMode) {
              print(cartTB.getCartTB().length.toString());
            }
            Fluttertoast.showToast(
                msg: "Booking success",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0);
          }
        },
        color: Colors.orange,
        textColor: Colors.white,
        elevation: 2,
        child: const Text('Book Now'),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22),
        ),
      ),
    );
  }
}
