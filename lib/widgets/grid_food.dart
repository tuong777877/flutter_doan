import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_doan/model/carts.dart';
import 'package:flutter_doan/model/foods.dart';
import 'package:flutter_doan/model/items.dart';
import 'package:flutter_doan/style/addtocart.dart';
import 'package:flutter_doan/widgets/detailfood.dart';
import 'package:fluttertoast/fluttertoast.dart';

// class GridFood extends StatelessWidget {
//   final String namefood;
//   final String img;
//   final double Price;
//   final bool state;
//   final int quantity;
//   final String Des;

//   const GridFood({
//     required this.namefood,
//     required this.img,
//     required this.Price,
//     required this.state,
//     required this.quantity,
//     required this.Des,
//   }) : super();

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       child: ListView(
//         shrinkWrap: true,
//         primary: false,
//         children: <Widget>[
//           Stack(
//             children: <Widget>[
//               SizedBox(
//                 height: MediaQuery.of(context).size.height / 4,
//                 width: MediaQuery.of(context).size.width / 2.2,
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(8.0),
//                   child: Image.asset(
//                     img,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           Container(
//             padding: const EdgeInsets.all(16),
//             child: Column(
//               children: [
//                 Text(
//                   namefood,
//                   style: const TextStyle(
//                     fontSize: 18.75,
//                     fontWeight: FontWeight.w900,
//                   ),
//                   textAlign: TextAlign.left,
//                   maxLines: 2,
//                 ),
//                 Text(
//                   Price.toString() + ' VND',
//                   style: const TextStyle(
//                     fontSize: 12,
//                   ),
//                   maxLines: 2,
//                 ),
//                 Row(
//                   children: [
//                     const SizedBox(
//                       child: Icon(
//                         Icons.table_restaurant_rounded,
//                         color: Colors.black54,
//                         size: 25,
//                       ),
//                     ),
//                     Text(quantity.toString()),
//                   ],
//                 ),
//                 changeState()
//               ],
//             ),
//           ),
//         ],
//       ),
//       onTap: () => showModalBottomSheet(
//           isScrollControlled: true,
//           backgroundColor: Colors.transparent,
//           isDismissible: false,
//           context: context,
//           builder: (context) => const buildSheet()),
//     );
//   }

//   changeState() {
//     if (state == true) {
//       return Row(
//         children: [
//           const SizedBox(width: 5),
//           SizedBox(
//             child: Icon(
//               state ? Icons.circle : Icons.circle,
//               color: Colors.green.shade700,
//               size: 10,
//             ),
//           ),
//           const SizedBox(
//             width: 10,
//           ),
//           const Text("Đang hoạt động"),
//         ],
//       );
//     } else {
//       return Row(
//         children: [
//           const SizedBox(width: 5),
//           SizedBox(
//             child: Icon(
//               state ? Icons.circle : Icons.circle,
//               color: Colors.black54,
//               size: 10,
//             ),
//           ),
//           const SizedBox(
//             width: 10,
//           ),
//           const Text("ngưng hoạt động"),
//         ],
//       );
//     }
//   }
// }

class GridFood2 extends StatefulWidget {
  Foods food;

  GridFood2({
    required this.food,
  });

  @override
  State<GridFood2> createState() => _GridFood2State();
}

class _GridFood2State extends State<GridFood2> {
  ScrollController controller = ScrollController();
  bool closeTopContainer = false;
  double topContainer = 0;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: 160,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(20.0)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 10.0),
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height / 5,
              width: MediaQuery.of(context).size.width / 2.5,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                child: Image(
                  image: NetworkImage(widget.food.image.toString()),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Image.network(
            //   widget.avatar,
            //   height: double.infinity,
            // )
            // Image.asset(
            //   "assets/images/${post["image"]}",
            //   height: double.infinity,
            // )
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    widget.food.nameFood,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "${widget.food.price.toInt()} VNĐ",
                    style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  changeState(),
                  IconButton(
                    onPressed: () {
                      AddFoodToCart(
                        item: Items(food: widget.food, quantity: 1),
                      );
                    },
                    icon: const Icon(
                      Icons.add_circle,
                      size: 25,
                      color: Colors.black,
                    ),
                  ),
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
          builder: (context) => buildSheet(
                food: widget.food,
              )),
    );
  }

  changeState() {
    if (widget.food.status == true) {
      return Row(
        children: [
          const SizedBox(width: 5),
          SizedBox(
            child: Icon(
              widget.food.status ? Icons.circle : Icons.circle,
              color: Colors.green.shade700,
              size: 10,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          const Text("Còn món"),
        ],
      );
    } else {
      return Row(
        children: [
          const SizedBox(width: 5),
          SizedBox(
            child: Icon(
              widget.food.status ? Icons.circle : Icons.circle,
              color: Colors.black54,
              size: 10,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          const Text("Hết món"),
        ],
      );
    }
  }

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      double value = controller.offset / 119;

      setState(() {
        topContainer = value;
        closeTopContainer = controller.offset > 50;
      });
    });
  }
}
