import 'dart:io';

class Preferentials {
  int id;
  String nameCoupon;
  String description;
  String image;
  double discount;
  DateTime start;
  DateTime end;
  int quantity;
  bool state;

  Preferentials(
      {required this.id,
      required this.nameCoupon,
      required this.description,
      required this.image,
      required this.discount,
      required this.start,
      required this.end,
      required this.quantity,
      required this.state,
      star});
  fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameCoupon = json['nameCoupon'];
    description = json['description'];
    image = json['image'];
    discount = json['discount'];
    start = json['start'];
    end = json['end'];
    quantity = json['quantity'];
    state = json['state'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nameCoupon'] = nameCoupon;
    data['description'] = description;
    data['image'] = image;
    data['discount'] = discount;
    data['start'] = start;
    data['end'] = end;
    data['quantity'] = quantity;
    data['state'] = state;
    return data;
  }
}
