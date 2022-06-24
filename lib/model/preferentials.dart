import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'preferentials.g.dart';

@JsonSerializable()
class Preferentials {
  String id;
  String nameCoupon;
  String description;
  String image;
  double discount;
  DateTime start;
  DateTime end;
  int quantity;
  bool state;
  String voucherid;

  Preferentials(
      this.id,
      this.nameCoupon,
      this.description,
      this.image,
      this.discount,
      this.start,
      this.end,
      this.quantity,
      this.state,
      this.voucherid);

  factory Preferentials.fromJson(Map<String, dynamic> json) =>
      _$PreferentialsFromJson(json);
  // fromJson(Map<String, dynamic> json) {
  //   id = json['id'];
  //   nameCoupon = json['nameCoupon'];
  //   description = json['description'];
  //   image = json['image'];
  //   discount = json['discount'];
  //   start = json['start'];
  //   end = json['end'];
  //   quantity = json['quantity'];
  //   state = json['state'];
  // }
  Map<String, dynamic> toJson() => _$PreferentialsToJson(this);
  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data['id'] = id;
  //   data['nameCoupon'] = nameCoupon;
  //   data['description'] = description;
  //   data['image'] = image;
  //   data['discount'] = discount;
  //   data['start'] = start;
  //   data['end'] = end;
  //   data['quantity'] = quantity;
  //   data['state'] = state;
  //   return data;
  // }
}
