import 'dart:io';

class Foods {
  String id;
  String nameFood;
  String description;
  String image;
  double price;
  //int cateID;
  bool status;
  bool trending;

  Foods(
      {required this.id,
      required this.nameFood,
      required this.description,
      required this.image,
      required this.price,
      //required this.cateID,
      required this.status,
      required this.trending});
  
}
