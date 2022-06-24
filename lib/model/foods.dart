import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'foods.g.dart';

@JsonSerializable()
class Foods {
  String id;
  String nameFood;
  String description;
  String image;
  double price;
  //int cateID;
  bool status;
  bool trending;

  // Foods(
  //     this.id,
  //     this.nameFood,
  //     this.description,
  //     this.image,
  //     this.price,
  //     //required this.cateID,
  //     this.status,
  //     this.trending);

  Foods(
      {required this.id,
      required this.nameFood,
      required this.description,
      required this.image,
      required this.price,
      //required this.cateID,
      required this.status,
      required this.trending});

  factory Foods.fromJson(Map<String, dynamic> json) => _$FoodsFromJson(json);

  Map<String, dynamic> toJson() => _$FoodsToJson(this);
}
