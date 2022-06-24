import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_doan/homepage/homepage.dart';
import 'package:flutter_doan/model/foods.dart';
import 'package:flutter_doan/style/size_config.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final controller = TextEditingController();
  final Stream<QuerySnapshot> _foodStream =
      FirebaseFirestore.instance.collection('foods').snapshots();
  CollectionReference foods = FirebaseFirestore.instance.collection('foods');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            // KeyboardUtil.hideKeyboard(context);
            Navigator.pushReplacementNamed(context, HomePage.routeName);
          },
          child: const Icon(Icons.arrow_back_ios),
        ),
        title: TextFormField(
          autofocus: true,
          controller: controller,
          onChanged: (value) => setState(() {
            controller.text == value;
          }),
          decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(0),
                  vertical: getProportionateScreenWidth(10)),
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              hintText: "Tìm kiếm sản phẩm",
              prefixIcon: const Icon(Icons.search)),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: _foodStream,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('${snapshot.error}'));
            }
            final List<Foods> storedocs = [];
            snapshot.data!.docs.map((DocumentSnapshot document) {
              Map data = document.data() as Map<String, dynamic>;
              storedocs.add(Foods(
                id: data['id'],
                nameFood: data['nameFood'],
                price: (data['price'] as num).toDouble(),
                description: data['description'],
                image: data['image'],
                status: data['status'],
                trending: data['trending'],
              ));
            }).toList();

            return buildGridView(storedocs
                .where((p) => p.nameFood.contains(controller.text))
                .toList());
            // return ListView.builder(
            //   scrollDirection: Axis.vertical,
            //   shrinkWrap: true,
            //   itemCount: storedocs.where((p) => p.NameFood.contains(controller.text.toUpperCase())).toList().length,
            //   itemBuilder: (context, index) {
            //     return Container(
            //       width: 150,
            //       height: 150,
            //       padding: const EdgeInsets.all(5),
            //       child: Image.network(storedocs[index].avatar),
            //     );
            //   },
            // );
          }),
    );
  }

  GridView buildGridView(List<Foods> data) {
    return GridView.builder(
      padding: EdgeInsets.all(5),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.65,
          crossAxisSpacing: 6,
          mainAxisSpacing: 6),
      itemCount: data.length,
      itemBuilder: (context, index) {
        return Container(
          child: GestureDetector(
            // onTap: () async {
            //   Navigator.pushNamed(context, DetailsScreen.routeName, arguments: ProductDetailsArguments(product: data[index]));
            // },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: getProportionateScreenWidth(10)),
                Hero(
                    tag: data[index].id,
                    child: Image.network(data[index].image)),
                Row(
                  children: [
                    Expanded(
                        child: Text(data[index].nameFood,
                            style: const TextStyle(fontSize: 16),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis)),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        child: Text((data[index].price.toString()),
                            style: const TextStyle(fontSize: 16))),
                  ],
                ),
              ],
            ),
          ),
          decoration: const BoxDecoration(
            // gradient: LinearGradient(
            //   colors: [
            //     Colors.orange.withOpacity(0.8),
            //     Colors.grey
            //   ],
            //   begin: Alignment.topLeft,
            //   end: Alignment.bottomRight
            // ),
            color: Colors.white,
          ),
        );
      },
    );
  }
}
