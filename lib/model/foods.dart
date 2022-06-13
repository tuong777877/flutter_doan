import 'dart:io';

class Foods {
  int id;
  String NameFood;
  String Description;
  String avatar;
  double Price;
  //int cateID;
  int Quantity;
  bool Status;

  Foods(
      {required this.id,
      required this.NameFood,
      required this.Description,
      required this.avatar,
      required this.Price,
      //required this.cateID,
      required this.Quantity,
      required this.Status});
  fromJson(Map<String, dynamic> json) {
    id = json['id'];
    NameFood = json['NameFood'];
    Description = json['Description'];
    avatar = json['avatar'];
    Price = json['Price'];
    //cateID = json['cateID'];
    Quantity = json['Quantity'];
    Status = json['Status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['NameFood'] = NameFood;
    data['Description'] = Description;
    data['avatar'] = avatar;
    data['Price'] = Price;
    //data['cateID'] = cateID;
    data['Quantity'] = Quantity;
    data['Status'] = Status;
    return data;
  }
}
