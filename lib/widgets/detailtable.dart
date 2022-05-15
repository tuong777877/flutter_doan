import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_doan/model/carts.dart';
import 'package:flutter_doan/model/foods.dart';
import 'package:flutter_doan/model/table.dart';
import 'package:flutter_doan/model/tables.dart';
import 'package:flutter_doan/style/style.dart';
import 'package:flutter_doan/widgets/seemore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:quantity_input/quantity_input.dart';

class buildSheetTable2 extends StatefulWidget {
  Tables table;
  buildSheetTable2({required this.table});

  @override
  _buildSheetTable2State createState() => _buildSheetTable2State();
}

class _buildSheetTable2State extends State<buildSheetTable2> {
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      builder: (_, controller) => Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        padding: const EdgeInsets.all(16),
        child: ListView(
          controller: controller,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                buildHeroContainer(),
                const SizedBox(height: 24),
                Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Text('Booking Details', style: heading)),
                buildBookingDetail(),
                buildBookingEndStrip(),
                buildBookingButton(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBookingButton() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 44),
      width: double.infinity,
      child: RaisedButton(
        onPressed: () {
          CartTable cartTB = CartTable();
          if (cartTB.getCartTB().length > 0) {
            Fluttertoast.showToast(
                msg: "Booking fail",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0);
          } else {
            cartTB.addTableToCart(widget.table);
            //cartTB.createTable(widget.table);
            if (kDebugMode) {
              print(cartTB.getCartTB().length.toString());
            }
            Fluttertoast.showToast(
                msg: "Booking success",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0);
          }
        },
        color: Colors.orange[900],
        textColor: Colors.white,
        elevation: 2,
        child: const Text('Book Now'),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22),
        ),
      ),
    );
  }

  Widget buildBookingEndStrip() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Flexible(flex: 2, child: buildMarkerIcon()),
          Flexible(
            flex: 8,
            fit: FlexFit.loose,
            child: Container(
              margin: const EdgeInsets.only(bottom: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [raisedBoxShadow],
                borderRadius: BorderRadius.circular(8),
              ),
              child: ListTile(
                title: Padding(
                    padding: const EdgeInsets.only(bottom: 6),
                    child: Text('Booking Date & Time', style: heading2)),
                subtitle: Text('March 21, 03:30 PM', style: heading1),
                trailing: RaisedButton(
                  onPressed: () {
                    print('object');
                  },
                  color: mainColor,
                  textColor: Colors.white,
                  elevation: 1,
                  child: const Text('Book Now'),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(22),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildBookingDetail() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Flexible(
              child: buildLeftFlex(),
              flex: 2,
            ),
            Flexible(
              child: buildRightFlex(),
              flex: 8,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildRightFlex() {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(bottom: 24),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [raisedBoxShadow],
          borderRadius: BorderRadius.circular(8)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          buildTablePicture(),
          Flexible(
            fit: FlexFit.tight,
            child: buildTableDescriptions(),
          )
        ],
      ),
    );
  }

  Widget buildTableDescriptions() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          decoration: BoxDecoration(
            color: mainColor,
            borderRadius: BorderRadius.circular(22),
          ),
          child: Text('${widget.table.cateID}', style: inverseHeading1),
        ),
        const SizedBox(height: 2),
        Text('${widget.table.nameTable}', style: heading1),
        const SizedBox(height: 2),
        Text(changeState().toString(), style: heading2),
        const SizedBox(height: 2),
        Text('${widget.table.quantity}', style: heading1),
        const SizedBox(height: 2),
        const SizedBox(height: 2),
        Text('1256 users review', style: heading2),
      ],
    );
  }

  Widget buildTablePicture() {
    return Stack(
      alignment: Alignment.center,
      fit: StackFit.loose,
      children: <Widget>[
        Container(width: 120),
        Image.network('${widget.table.image}',
            width: 100, fit: BoxFit.fitWidth),
        Positioned(
          left: 0,
          bottom: 0,
          child: Container(
            height: 36,
            width: 36,
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: mainColor,
              shape: BoxShape.circle,
              boxShadow: [raisedBoxShadow],
            ),
            child: const Center(
              child: Icon(Icons.done_all, color: Colors.white, size: 24),
            ),
          ),
        )
      ],
    );
  }

  Widget buildLeftFlex() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        buildMarkerIcon(),
        const Flexible(
          fit: FlexFit.loose,
          child: VerticalDivider(
            color: Colors.blueGrey,
            thickness: 1.5,
          ),
        ),
      ],
    );
  }

  Widget buildMarkerIcon() {
    return Container(
      height: 56,
      width: 56,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [raisedBoxShadow],
        shape: BoxShape.circle,
      ),
      child: Image.network('${widget.table.image}',
          width: 40, fit: BoxFit.contain),
    );
  }

  Widget buildHeroContainer() {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(boxShadow: [raisedBoxShadow]),
      height: 220,
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                '${widget.table.image}',
                fit: BoxFit.cover,
              )),
          Positioned(
            left: 0,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(.8),
                borderRadius: BorderRadius.circular(36),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              margin: const EdgeInsets.all(8),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text('From \$ ${widget.table.price}', style: heading1),
                    const SizedBox(width: 24),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(26),
                        color: mainColor,
                      ),
                      child: Center(
                          child: Text('${widget.table.nameTable}',
                              style: inverseHeading1)),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  changeState() {
    if (widget.table.state == true) {
      return Row(
        children: [
          const SizedBox(width: 5),
          SizedBox(
            child: Icon(
              widget.table.state ? Icons.circle : Icons.circle,
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
              widget.table.state ? Icons.circle : Icons.circle,
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
