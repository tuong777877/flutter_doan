import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_doan/cart/components/checkoutcart.dart';
import 'package:flutter_doan/model/carts.dart';
import 'package:flutter_doan/model/foods.dart';
import 'package:flutter_doan/model/items.dart';
import 'package:flutter_doan/model/table.dart';
import 'package:flutter_doan/model/tableitems.dart';
import 'package:flutter_doan/model/tables.dart';
import 'package:flutter_doan/style/constants.dart';
import 'package:flutter_doan/style/size_config.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<Items> cartdetails = Cart().getCart();
  List<TableItems> cartTBdetails = CartTable().getCartTB();
  //late Tables cartTB;
  double sum = 0.0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cartdetails.forEach((item) {
      sum = sum + item.quantity * item.food!.Price;
    });
    cartTBdetails.forEach((itemtable) {
      sum = sum + itemtable.table!.price;
    });
    //cartTB = CartTable().getCartTable();
  }
 
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.only(top: 25),),
            Text('Bàn đã đặt',
            ),
            Column(
              children: [
                SizedBox(
                  child: Container(
                    color: Colors.white,
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: cartTBdetails.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              GestureDetector(
                                child: CartTB(
                                  tableItem: cartTBdetails[index],
                                ),
                                onTap: () {
                                  setState(() {
                                    cartTBdetails.removeAt(index);
                                    sum = 0.0;
                                    for (var itemtable in cartTBdetails){
                                         sum = sum + itemtable.table!.price;     
                                      }   
                                    for (var item in cartdetails) {
                                              sum = sum + item.food!.Price;
                                          }
                                  });
                                },
                              ),
                              const Divider()
                            ],
                          );
                        }),
                  ),
                ),
                cartdetails.length > 0
                ? Row(children: [
                    Expanded(
                      child: SizedBox(
                        height: 380,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: cartdetails.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                GestureDetector(
                                  child: CartItem(
                                    item: cartdetails[index],
                                  ),
                                  onTap: () {
                                    setState(() {
                                      cartdetails.removeAt(index);
                                      sum = 0.0;
                                      for (var item in cartdetails) {
                                          sum = sum + item.food!.Price;
                                      }
                                      for (var itemTB in cartTBdetails){
                                        sum = sum + itemTB.table!.price;
                                      }
                                    });
                                  },
                                ),
                                const Divider()
                              ],
                            );
                          },
                        ),
                      ),
                    )
                  ])
                : Row(
                    children: const [
                      Expanded(
                        child: Text("Chưa đặt món!"),
                      ),
                    ],
                  ),
            CheckOutCart(
              sum: sum,
            )
              ],
            ),
            
          ],
        ),
      ),
    );
  }
}

class CartItem extends StatelessWidget {
  Items item;

  CartItem({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF5F5F5),
      padding: const EdgeInsets.all(16),
      child: Row(children: [
        SizedBox(
            width: 100, height: 100, child: Image.network(item.food!.avatar)),
        Expanded(child: Text(item.food!.NameFood)),
        Expanded(child: Text(item.food!.Price.toString())),
        Expanded(child: Text(item.quantity.toString())),
        const Icon(Icons.delete_outlined)
      ]),
    );
  }
}

class CartTB extends StatelessWidget {
  TableItems tableItem;

  CartTB({Key? key, required this.tableItem}) : super(key: key);

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
              child: Image.network(tableItem.table!.image),
            ),
          ),
        ),
        SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              tableItem.datetime.toString(),
              style: TextStyle(color: Colors.black, fontSize: 16),
              maxLines: 2,
            ),
            Text(
              tableItem.table!.nameTable,
              style: TextStyle(color: Colors.black, fontSize: 16),
              maxLines: 2,
            ),
            SizedBox(height: 10),
            Text.rich(
              TextSpan(
                text: "\$${tableItem.table!.price}",
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
