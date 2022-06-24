import 'dart:io';

class Tables {
  int id;
  String nameTable;
  String description;
  String image;
  double price;
  int cateID;
  int quantity;
  bool state;

  Tables(
      {required this.id,
      required this.nameTable,
      required this.description,
      required this.image,
      required this.price,
      required this.cateID,
      required this.quantity,
      required this.state});
  
}
