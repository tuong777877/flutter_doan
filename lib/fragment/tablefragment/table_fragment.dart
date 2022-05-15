import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_doan/enums.dart';
import 'package:flutter_doan/fragment/tablefragment/components/body.dart';
import 'package:flutter_doan/style/coustom_bottom_nav_bar.dart';

class TableFragement extends StatelessWidget {
  static String routeName = "/tables_screen";
  const TableFragement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      bottomNavigationBar:
          const CustomBottomNavBar(selectedMenu: MenuState.table),
    );
  }
}
