import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_doan/model/table.dart';
import 'package:flutter_doan/model/tables.dart';
import 'package:flutter_doan/widgets/grid_table.dart';
import 'package:validators/sanitizers.dart';

import '../../utils/filestore.dart';

class TableListFragement extends StatefulWidget {
  static String routeName = "/tables";
  const TableListFragement({Key? key}) : super(key: key);

  @override
  State<TableListFragement> createState() => _TableListFragementState();
}

class _TableListFragementState extends State<TableListFragement> {
  Future<List<Tables>>? tabless;
  @override
  void initState() {
    super.initState();
    tabless = FirestoreUtil.getTables([]);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Tables>>(
        future: tabless,
        builder: ((context, AsyncSnapshot<List<Tables>> snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
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
                  itemCount: snapshot.data?.length ?? 0,
                  itemBuilder: (BuildContext context, int index) {
                    //Map tables = table[index];
                    //bool s = (tables['state']);
                    return GridProduct(
                      table: snapshot.data![index],
                      // Tables(
                      //     description: (tables['description']),
                      //     id: (tables['id']),
                      //     image: tables['image'],
                      //     nameTable: tables['nameTable'],
                      //     price: double.parse(tables['price']),
                      //     tableid: tables['']
                      //     state: s),
                    );
                  },
                ),
                const SizedBox(height: 30),
              ],
            );
          } else {
            return const Center(
              child: Text('error'),
            );
          }
        }));
    // return Column(
    //   children: <Widget>[
    //     const SizedBox(height: 10.0),
    //     const Text(
    //       "Danh sách bàn ăn",
    //       style: TextStyle(
    //         fontSize: 23,
    //         fontWeight: FontWeight.w800,
    //       ),
    //     ),
    //     const SizedBox(height: 10.0),
    //     GridView.builder(
    //       shrinkWrap: true,
    //       primary: false,
    //       physics: const NeverScrollableScrollPhysics(),
    //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //         crossAxisCount: 2,
    //         crossAxisSpacing: 10,
    //         mainAxisSpacing: 10,
    //         childAspectRatio: MediaQuery.of(context).size.width /
    //             (MediaQuery.of(context).size.height / 1.15),
    //       ),
    //       itemCount: table == null ? 0 : table.length,
    //       itemBuilder: (BuildContext context, int index) {
    //         Map tables = table[index];
    //         bool s = (tables['state']);
    //         return GridProduct(
    //             table:
    //             Tables(
    //                 description: (tables['description']),
    //                 id: (tables['id']),
    //                 image: tables['image'],
    //                 nameTable: tables['nameTable'],
    //                 price: double.parse(tables['price']),
    //                 tableid: tables['']
    //                 state: s));
    //       },
    //     ),
    //     const SizedBox(height: 30),
    //   ],
    // );
  }
}
