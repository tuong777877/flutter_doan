import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_doan/model/table.dart';
import 'package:flutter_doan/model/tables.dart';
import 'package:flutter_doan/widgets/grid_table.dart';
import 'package:validators/sanitizers.dart';

class TableListFragement extends StatelessWidget {
  static String routeName = "/tables";
  const TableListFragement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 10.0),
        const Text(
          "Danh sách bàn ăn",
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 10.0),
        GridView.builder(
          shrinkWrap: true,
          primary: false,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: MediaQuery.of(context).size.width /
                (MediaQuery.of(context).size.height / 1.15),
          ),
          itemCount: table == null ? 0 : table.length,
          itemBuilder: (BuildContext context, int index) {
            Map tables = table[index];
            bool s = (tables['state']);
            return GridProduct(
                table: Tables(
                    cateID: (tables['cateID']),
                    description: (tables['description']),
                    id: int.parse(tables['id']),
                    image: tables['image'],
                    nameTable: tables['nameTable'],
                    price: double.parse(tables['price']),
                    quantity: tables['quantity'],
                    state: s));
          },
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}
