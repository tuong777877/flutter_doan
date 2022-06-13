import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_doan/cart/cartpage.dart';
import 'package:flutter_doan/style/size_config.dart';
import 'package:flutter_doan/widgets/search_field.dart';

class PreferentialHeader extends StatelessWidget {
  const PreferentialHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                "KHUYẾN MÃI".toUpperCase(),
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
              ),
            ),
            Row(
              children: <Widget>[
                IconButton(
                  onPressed: () =>
                      Navigator.pushNamed(context, CartPage.routeName),
                  icon: const Icon(Icons.shopping_cart_outlined),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.notifications_none_outlined),
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}
