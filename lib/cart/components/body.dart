import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_doan/cart/components/checkoutcart.dart';
import 'package:flutter_doan/model/carts.dart';
import 'package:flutter_doan/model/foods.dart';
import 'package:flutter_doan/model/table.dart';
import 'package:flutter_doan/model/tables.dart';
import 'package:flutter_doan/style/constants.dart';
import 'package:flutter_doan/style/size_config.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<Foods> cartdetails = Cart().getCart();
  List<Tables> cartTBdetails = CartTable().getCartTB();
  //late Tables cartTB;
  double sum = 0.0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cartdetails.forEach((food) {
      sum = sum + food.Price;
    });

    //cartTB = CartTable().getCartTable();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          Container(
            height: 150,
            color: Colors.white,
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: cartTBdetails.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      GestureDetector(
                        child: CartTB(
                          table: cartTBdetails[index],
                        ),
                        onTap: () {
                          setState(() {
                            cartTBdetails.removeAt(index);
                            sum = 0.0;
                            for (var table in cartTBdetails) {
                              sum = sum + table.price;
                            }
                          });
                        },
                      ),
                      const Divider()
                    ],
                  );
                }),
          ),
          cartdetails.length > 0
              ? Row(children: [
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: cartdetails.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            GestureDetector(
                              child: CartItem(
                                food: cartdetails[index],
                              ),
                              onTap: () {
                                setState(() {
                                  cartdetails.removeAt(index);
                                  sum = 0.0;
                                  for (var product in cartdetails) {
                                    sum = sum + product.Price;
                                  }
                                });
                              },
                            ),
                            const Divider()
                          ],
                        );
                      },
                    ),
                  )
                ])
              : Row(
                  children: const [
                    Expanded(
                      child: Text("Chua dat mon an"),
                    ),
                  ],
                ),
          CheckOutCart(
            sum: sum,
          )
        ],
      ),
    );
  }
}

class CartItem extends StatelessWidget {
  Foods food;

  CartItem({Key? key, required this.food}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF5F5F5),
      padding: const EdgeInsets.all(16),
      child: Row(children: [
        SizedBox(width: 100, height: 100, child: Image.network(food.avatar)),
        Expanded(child: Text(food.NameFood)),
        Expanded(child: Text(food.Price.toString())),
        const Icon(Icons.delete_outlined)
      ]),
    );
  }
}

class CartTB extends StatelessWidget {
  Tables table;

  CartTB({Key? key, required this.table}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 88,
          child: AspectRatio(
            aspectRatio: 0.88,
            child: Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(10)),
              decoration: BoxDecoration(
                color: Color(0xFFF5F6F9),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.network(table.image),
            ),
          ),
        ),
        SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              table.nameTable,
              style: TextStyle(color: Colors.black, fontSize: 16),
              maxLines: 2,
            ),
            SizedBox(height: 10),
            Text.rich(
              TextSpan(
                text: "\$${table.price}",
                style: const TextStyle(
                    fontWeight: FontWeight.w600, color: kPrimaryColor),
              ),
            )
          ],
        )
      ],
    );
  }
}
