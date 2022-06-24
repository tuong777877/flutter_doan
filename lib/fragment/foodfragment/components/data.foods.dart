import 'package:cloud_firestore/cloud_firestore.dart';


class DatabaseManager {
  final CollectionReference foodsList =
      FirebaseFirestore.instance.collection('Food');

  Future<void> createUserData(
      String nameFood, String image, double price, String id, String description, bool status, bool trending) async {
    return await foodsList
        .doc(id)
        .set({'Name': nameFood, 'Image': image, 'price': price, 'Id': id, 'Description': description, 'Status': status, 'Trending': trending});
  }

  Future updateFoodList(String nameFood, String image, double price, String id, String description, bool status, bool trending) async {
    return await foodsList.doc(id).update({
      'Name': nameFood, 'Image': image, 'price': price, 'Id': id, 'Description': description, 'Status': status, 'Trending': trending
    });
  }

  Future getFoodList() async {
    List itemsList = [];

    try {
      await foodsList.get().then((querySnapshot) {
        querySnapshot.docs.forEach((element) {
          itemsList.add(element.data);
        });
      });
      return itemsList;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}