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
  fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameTable = json['nameTable'];
    description = json['description'];
    image = json['image'];
    price = json['price'];
    cateID = json['cateID'];
    quantity = json['quantity'];
    state = json['state'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nameTable'] = nameTable;
    data['description'] = description;
    data['image'] = image;
    data['price'] = price;
    data['cateID'] = cateID;
    data['quantity'] = quantity;
    data['state'] = state;
    return data;
  }
}
