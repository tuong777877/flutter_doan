import 'package:flutter/material.dart';
import 'package:flutter_doan/homepage/homefragment/home_detail_fragment.dart';
import 'package:flutter_doan/style/constants.dart';

class HomeDetail extends StatefulWidget {
  const HomeDetail({Key? key}) : super(key: key);

  @override
  _HomeDetailState createState() => _HomeDetailState();
}

class _HomeDetailState extends State<HomeDetail> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        buildItem(
            "Joe's Linder",
            "123 reviews = S. Oxford 13th",
            "https://images.pexels.com/photos/3676531/pexels-photo-3676531.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
            4.5),
        buildItem(
            "Mama's brunch",
            "98 reviews = S. Gulier 6th",
            "https://images.pexels.com/photos/1147993/pexels-photo-1147993.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
            4.5),
        buildItem(
            "Joe's Linder",
            "123 reviews = S. Oxford 13th",
            "https://images.pexels.com/photos/842571/pexels-photo-842571.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
            4.5),
      ],
    );
  }

  GestureDetector buildItem(
      String title, String subTitle, String url, double rating) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => HomeDetailPage(url)));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 12.0),
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          children: <Widget>[
            Hero(
              tag: url,
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(url),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0),
                    )),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(25.0),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10.0),
                      bottomRight: Radius.circular(10.0)),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 2.0, spreadRadius: 1.0, color: Colors.grey)
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        title,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16.0),
                      ),
                      Text(
                        subTitle,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12.0,
                            color: Colors.grey),
                      ),
                    ],
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.orange,
                    child: Text(
                      rating.toString(),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
