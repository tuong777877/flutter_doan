import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Discovery extends StatefulWidget {
  const Discovery({Key? key}) : super(key: key);

  @override
  State<Discovery> createState() => _DiscoveryState();
}

class _DiscoveryState extends State<Discovery> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 25.0, top: 20.0, right: 5),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const <Widget>[
              Text(
                "Discover",
                style: TextStyle(
                  fontSize: 50.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://images.pexels.com/photos/2787310/pexels-photo-2787310.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260"),
              )
            ],
          ),
          const SizedBox(
            height: 20.0,
          ),
          Container(
            height: 40.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                buildTopChip("healthy", true),
                buildTopChip("italian", false),
                buildTopChip("mexican", false),
                buildTopChip("asian", false),
                buildTopChip("chinese", false),
                buildTopChip("haitian", false),
              ],
            ),
          )
        ],
      ),
    );
  }

  Container buildTopChip(String label, bool isActive) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Chip(
        padding: const EdgeInsets.all(8.0),
        label: Text(
          label,
          style: const TextStyle(color: Colors.white, fontSize: 16.0),
        ),
        backgroundColor: isActive ? Colors.orange : Colors.grey,
      ),
    );
  }
}
