import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_doan/model/carts.dart';
import 'package:flutter_doan/model/food.dart';
import 'package:flutter_doan/model/foods.dart';
import 'package:flutter_doan/model/items.dart';
import 'package:flutter_doan/style/addtocart.dart';
import 'package:flutter_doan/widgets/seemore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:quantity_input/quantity_input.dart';
import 'package:quiver/strings.dart';

class buildSheet extends StatefulWidget {
  Foods food;
  buildSheet({required this.food});

  @override
  State<buildSheet> createState() => _buildSheetState();
}

class _buildSheetState extends State<buildSheet> {
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
                      "${widget.food.image}",
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
                          "${widget.food.nameFood}",
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
                          "${widget.food.price}",
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
                  SeeMore(text: "${widget.food.description}"),
                ],
              ),
            ),
            Center(
              child: Align(
                alignment: const Alignment(0.0, -1.0),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      QuantityInput(
                          value: simpleIntInput,
                          onChanged: (value) => setState(() => simpleIntInput =
                              int.parse(value.replaceAll(',', '')))),
                      AddFoodToCart(
                        item:
                            Items(food: widget.food, quantity: simpleIntInput),
                      ),
                    ],
                  ),
                ),
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
