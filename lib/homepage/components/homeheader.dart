import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_doan/cart/cartpage.dart';
import 'package:flutter_doan/style/size_config.dart';
import 'package:flutter_doan/widgets/icon_btn_with_counter.dart';
import 'package:flutter_doan/widgets/search_field.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SearchField(),
          IconButton(
            onPressed: () => Navigator.pushNamed(context, CartPage.routeName),
            icon: const Icon(Icons.shopping_cart_outlined),
          ),
          // IconBtnWithCounter(
          //   svgSrc: "assets/assets/icons/Cart Icon.svg",
          //   press: () => Navigator.pushNamed(context, CartPage.routeName),
          // ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none_outlined),
          ),
          // IconBtnWithCounter(
          //   svgSrc: "assets/assets/icons/noti.svg",
          //   numOfitem: 3,
          //   press: () {},
          // ),
        ],
      ),
    );
  }
}
