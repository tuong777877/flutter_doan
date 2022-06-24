import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tables.g.dart';

@JsonSerializable()
class Tables {
  String id;
  String nameTable;
  String description;
  String image;
  double price;
  bool state;
  String tableid;

  Tables(this.id, this.nameTable, this.description, this.image, this.price,
      this.state, this.tableid);

  factory Tables.fromJson(Map<String, dynamic> json) => _$TablesFromJson(json);
  //     {
  //   id = json['id'];
  //   nameTable = json['nameTable'];
  //   description = json['description'];
  //   image = json['image'];
  //   price = json['price'];
  //   state = json['state'];
  // }

  Map<String, dynamic> toJson() => _$TablesToJson(this);
  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data['id'] = id;
  //   data['nameTable'] = nameTable;
  //   data['description'] = description;
  //   data['image'] = image;
  //   data['price'] = price;
  //   data['state'] = state;
  //   return data;
  // }
}
