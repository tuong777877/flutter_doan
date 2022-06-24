import 'dart:convert';

class Foods {
  String id;
  String nameFood;
  String description;
  String image;
  double price;
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
  factory Foods.fromJson(Map<String, dynamic> json) => Foods(
        id: json["Id"],
        nameFood: json["Name"],
        description: json["Description"],
        image: json["Image"],
        price: json["Price"],
        status: json["Status"],
        trending: json["Trending"],
    );
    Map<String, dynamic> toJson() => {
        "id": id,
        "Name": nameFood,
        "Description": description,
        "Image": image,
        "Price": price,
        "Status": status,
        "Trending": trending,
    };
  
}
List<Foods> productsFromJson(String str) => List<Foods>.from(json.decode(str).map((x) => Foods.fromJson(x)));
String productsToJson(List<Foods> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));


