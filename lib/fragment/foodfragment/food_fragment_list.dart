import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_doan/model/food.dart';
import 'package:flutter_doan/model/foods.dart';
import 'package:flutter_doan/widgets/grid_food.dart';
import 'package:flutter_doan/widgets/grid_table.dart';
import 'package:validators/sanitizers.dart';

class FoodlistFragmet extends StatelessWidget {
  const FoodlistFragmet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 10.0),
        const Text(
          "Danh sách các món ăn",
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 10.0),
        ListView.builder(
          shrinkWrap: true,
          primary: false,
          physics: const NeverScrollableScrollPhysics(),
          // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //   crossAxisCount: 2,
          //   childAspectRatio: MediaQuery.of(context).size.width /
          //       (MediaQuery.of(context).size.height / 1.25),
          // ),
          itemCount: food == null ? 0 : food.length,
          itemBuilder: (BuildContext context, int index) {
            Map tables = food[index];
            bool s = (tables['Status']);
            //Uri myUri = Uri.parse(tables['avatar']);
            //Link mylink = Link(tables['avatar']);
            return GridFood2(
              food: Foods(
                  id: int.parse(tables['id']),
                  NameFood: tables['NameFood'],
                  Description: tables['Description'],
                  avatar: tables['avatar'],
                  Price: double.parse(tables['Price']),
                  //cateID: int.parse(tables['cateID']),
                  Quantity: (tables['Quantity']),
                  Status: s),
            );
          },
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}
