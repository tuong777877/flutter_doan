import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_doan/model/categoryfood.dart';

class CategoriesFood extends StatelessWidget {
  const CategoriesFood({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categories = CateFood.init();

    return Padding(
      padding: const EdgeInsets.all(0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Row(
              children: const [
                Expanded(
                    child: Text(
                  'Danh mục',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.green),
                )),
                Text(
                  'Xem thêm',
                  style: TextStyle(fontSize: 16, color: Colors.lightGreen),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 150,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        // onTap: () {
                        //   Navigator.pushNamed(
                        //       context, CategoryDetailPage.routeName,
                        //       arguments: categories[index].cateID);
                        // },
                        child: CategoriesItem(category: categories[index]));
                  }),
            )
          ],
        ),
      ),
    );
  }
}

class CategoriesItem extends StatelessWidget {
  CateFood category;

  CategoriesItem({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 100,
        height: 100,
        padding: const EdgeInsets.all(5),
        child: CircleAvatar(
          radius: 48,
          backgroundColor: Colors.black,
          child: Padding(
            padding: const EdgeInsets.all(8), // Border radius
            child: ClipOval(child: Image.asset(category.image)),
          ),
        )
        //Image.asset(category.image),
        );
  }
}
