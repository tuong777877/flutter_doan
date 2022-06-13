import 'package:flutter/material.dart';
import 'package:flutter_doan/homepage/components/body.dart';
import 'package:flutter_doan/model/tables.dart';
import 'package:flutter_doan/widgets/detailpreferential.dart';
import 'package:flutter_doan/widgets/detailtable.dart';
import 'package:quiver/strings.dart';

import '../model/preferentials.dart';

class GridPreferential extends StatefulWidget {
  Preferentials pre;

  GridPreferential({
    required this.pre,
  });

  @override
  State<GridPreferential> createState() => _GridPreferentialState();
}

class _GridPreferentialState extends State<GridPreferential> {
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
                        "${widget.pre.image}",
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
                    "${widget.pre.nameCoupon}",
                    style: const TextStyle(
                      fontSize: 18.75,
                      fontWeight: FontWeight.w900,
                    ),
                    textAlign: TextAlign.left,
                    maxLines: 2,
                  ),
                  Text(
                    "${widget.pre.discount} VND",
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
                      Text("${widget.pre.quantity}"),
                    ],
                  ),
                  changeState()
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
          builder: (context) => buildSheetPre(
                pre: widget.pre,
              )),
    );
  }

  changeState() {
    if (widget.pre.state == true) {
      return Row(
        children: [
          const SizedBox(width: 5),
          SizedBox(
            child: Icon(
              widget.pre.state ? Icons.circle : Icons.circle,
              color: Colors.green.shade700,
              size: 10,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          const Text("Đang hoạt động"),
        ],
      );
    } else {
      return Row(
        children: [
          const SizedBox(width: 5),
          SizedBox(
            child: Icon(
              widget.pre.state ? Icons.circle : Icons.circle,
              color: Colors.black54,
              size: 10,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          const Text("ngưng hoạt động"),
        ],
      );
    }
  }
}
