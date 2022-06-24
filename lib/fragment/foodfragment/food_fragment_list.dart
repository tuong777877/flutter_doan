import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_doan/fragment/foodfragment/components/data.foods.dart';
import 'package:flutter_doan/model/food.dart';
import 'package:flutter_doan/model/foods.dart';
import 'package:flutter_doan/widgets/grid_food.dart';

class FoodlistFragmet extends StatefulWidget {
  const FoodlistFragmet({Key? key}) : super(key: key);

  @override
  State<FoodlistFragmet> createState() => _FoodlistFragmetState();
}

class _FoodlistFragmetState extends State<FoodlistFragmet> {

  List foodList = [];
  
  @override
  void initState() {
    super.initState();
    fetchDatabaseList();
  }

  fetchDatabaseList() async {
    dynamic resultant = await DatabaseManager().getFoodList();

    if (resultant == null) {
      print('Unable to retrieve');
    } else {
      setState(() {
        foodList = resultant;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
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
          itemCount: foodList.length,
          itemBuilder: (context, index) {
            Map data  = foodList[index];
            bool s = (foodList[index]['Status']);
            bool foodtrend = (foodList[index]['Trending']);
            //Uri myUri = Uri.parse(tables['avatar']);
            //Link mylink = Link(tables['avatar']);
            return GridFood2(
              food: Foods(
                  id: data['Id'],
                  nameFood: data['Name'],
                  description: data['Description'],
                  image: data['Image'],
                  price: double.parse(data['Price']),
                  //cateID: int.parse(tables['cateID']),
                  status: s,
                  trending: foodtrend),
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
  }
}
