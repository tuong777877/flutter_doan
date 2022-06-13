import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_doan/model/carts.dart';
import 'package:flutter_doan/model/food.dart';
import 'package:flutter_doan/model/foods.dart';
import 'package:flutter_doan/model/items.dart';
import 'package:flutter_doan/model/preferentials.dart';
import 'package:flutter_doan/style/addtocart.dart';
import 'package:flutter_doan/widgets/seemore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:quantity_input/quantity_input.dart';
import 'package:quiver/strings.dart';

class buildSheetPre extends StatefulWidget {
  Preferentials pre;
  buildSheetPre({required this.pre});

  @override
  State<buildSheetPre> createState() => _buildSheetPreState();
}

class _buildSheetPreState extends State<buildSheetPre> {
  int simpleIntInput = 1;

  int steppedIntInput = 1;

  double simpleDoubleInput = 1;

  double steppedDoubleInput = 1;

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.9,
      //minChildSize: 0.5,
      maxChildSize: 0.9,

      builder: (_, controller) => Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        //padding: const EdgeInsets.all(16),
        child: ListView(
          controller: controller,
          children: [
            Stack(
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height / 3.2,
                  width: MediaQuery.of(context).size.width,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      "${widget.pre.image}",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    child: Column(
                      children: <Widget>[
                        Text(
                          "${widget.pre.nameCoupon}",
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                          ),
                          maxLines: 2,
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                        Text(
                          "${widget.pre.discount}",
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                          maxLines: 2,
                        ),
                      ],
                    ),
                  ),
                  RawMaterialButton(
                    onPressed: () {},
                    fillColor: Colors.white,
                    shape: const CircleBorder(),
                    elevation: 4.0,
                    child: const Padding(
                      padding: EdgeInsets.all(5),
                      child: Icon(
                        Icons.favorite_border,
                        color: Colors.red,
                        size: 17,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 50,
            ),
            const SizedBox(height: 20.0),
            Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    "Product Description",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                    ),
                    maxLines: 2,
                  ),
                  const SizedBox(height: 10.0),
                  SeeMore(text: "${widget.pre.description}"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget buildBottombutton() {
  //   return BottomNavigationBar(type: bottom.fixed, items: const []);
  // }
}
