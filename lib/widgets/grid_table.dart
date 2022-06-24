import 'package:flutter/material.dart';
import 'package:flutter_doan/homepage/components/body.dart';
import 'package:flutter_doan/model/tables.dart';
import 'package:flutter_doan/widgets/detailtable.dart';
import 'package:quiver/strings.dart';

class GridProduct extends StatelessWidget {
  Tables table;
  GridProduct({Key? key, required this.table}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black38),
            borderRadius: const BorderRadius.all(Radius.circular(20.0)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(color: Colors.grey.withAlpha(100), blurRadius: 10.0),
            ]),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height / 5,
                  width: MediaQuery.of(context).size.width / 2.22,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child:
                          // Image.asset(
                          //   img,
                          //   fit: BoxFit.cover,
                          // ),
                          Image.network(
                        "${table.image}",
                        fit: BoxFit.cover,
                      )),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "${table.nameTable}",
                    style: const TextStyle(
                      fontSize: 18.75,
                      fontWeight: FontWeight.w900,
                    ),
                    textAlign: TextAlign.left,
                    maxLines: 2,
                  ),
                  Text(
                    "${table.price} VND",
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w900,
                    ),
                    maxLines: 2,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        child: Icon(
                          Icons.table_restaurant_rounded,
                          color: Colors.black54,
                          size: 25,
                        ),
                      ),
                      Text("${table.tableid}"),
                    ],
                  ),
                  table.state != true
                      ? Row(
                          children: [
                            const SizedBox(width: 5),
                            SizedBox(
                              child: Icon(
                                Icons.circle,
                                color: Colors.green.shade700,
                                size: 10,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text("Đang hoạt động"),
                          ],
                        )
                      : Row(
                          children: [
                            const SizedBox(width: 5),
                            SizedBox(
                              child: Icon(
                                Icons.circle,
                                color: Colors.grey.shade800,
                                size: 10,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text("Ngưng hoạt động"),
                          ],
                        )
                ],
              ),
            ),
          ],
        ),
      ),
      onTap: () => showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          isDismissible: false,
          context: context,
          builder: (context) => buildSheetTable2(
                table: table,
              )),
    );
  }
}
