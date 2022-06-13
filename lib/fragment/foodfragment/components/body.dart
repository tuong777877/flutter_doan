import 'package:flutter/cupertino.dart';
import 'package:flutter_doan/fragment/categoryfood/categoryfood_fragment.dart';
import 'package:flutter_doan/fragment/foodfragment/components/foodheader.dart';
import 'package:flutter_doan/fragment/foodfragment/food_fragment_list.dart';
import 'package:flutter_doan/style/size_config.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(5)),
            FoodHeader(),
            SizedBox(height: getProportionateScreenHeight(20)),
            CategoriesFood(),
            FoodlistFragmet(),
          ],
        ),
      ),
    );
  }
}
