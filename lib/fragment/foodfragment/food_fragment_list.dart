import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_doan/model/food.dart';
import 'package:flutter_doan/model/foods.dart';
import 'package:flutter_doan/widgets/grid_food.dart';
import 'package:flutter_doan/widgets/grid_table.dart';
import 'package:validators/sanitizers.dart';

import '../../utils/filestore.dart';

class FoodlistFragmet extends StatefulWidget {
  const FoodlistFragmet({Key? key}) : super(key: key);

  @override
  State<FoodlistFragmet> createState() => _FoodlistFragmetState();
}

class _FoodlistFragmetState extends State<FoodlistFragmet> {
  Future<List<Foods>>? foodss;
  @override
  void initState() {
    super.initState();
    foodss = FirestoreUtil.getFoods([]);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Foods>>(
        future: foodss,
        builder: ((context, AsyncSnapshot<List<Foods>> snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
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
                  itemCount: snapshot.data?.length ?? 0,
                  itemBuilder: (BuildContext context, int index) {
                    // Map tables = food[index];
                    // final List<Foods> storedocs = [];
                    // bool s = (tables['status']);
                    // bool foodtrend = (tables['trending']);
                    // Uri myUri = Uri.parse(tables['avatar']);
                    // Link mylink = Link(tables['avatar']);
                    return GridFood2(
                      food: snapshot.data![index],
                      // Foods(
                      //     id: tables['id'],
                      //     nameFood: tables['nameFood'],
                      //     description: tables['description'],
                      //     image: tables['image'],
                      //     price: double.parse(tables['price']),
                      //     //cateID: int.parse(tables['cateID']),
                      //     status: s,
                      //     trending: foodtrend),
                    );
                  },
                ),
                const SizedBox(height: 30),
                // StreamBuilder(
                //   stream: FirebaseFirestore.instance.collection('Food').snapshots(),
                //   builder: (context,  AsyncSnapshot<QuerySnapshot> snapshot){
                //     if(snapshot.hasData){
                //       return ListView.builder(
                //         itemCount: snapshot.data!.docs.length,

                //         itemBuilder: (BuildContext context,int index) {
                //           final List<Foods> storedocs = [];
                //           snapshot.data!.docs.map((DocumentSnapshot document) {
                //             Map data = document.data() as Map<String, dynamic>;
                //            storedocs.add(Foods(id: data['Id'], NameFood: data['Name'], Price: (data['Price'] as int).toDouble(), Description: data['Description'], avatar: data['Image'], Status: data['Status']));
                //           }).toList();
                //           return GridFood2(food: Foods(
                //             id: ['Id'].t,
                //             NameFood: data['Name'],
                //             Price: (data['Price'] as int).toDouble(),
                //             Description: data['Description'], avatar: data['Image'],
                //             Status: data['Status']))

                //         }
                //       );
                //     }
                //     else{
                //       return Container();
                //     }
                //   },

                // )
              ],
            );
          } else {
            return const Center(
              child: Text('error'),
            );
          }
        }));
  }
}
