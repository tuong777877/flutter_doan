part of 'foods.dart';

Foods _$FoodsFromJson(Map<String, dynamic> json) => Foods(
      json['id'] as String,
      json['nameFood'] as String,
      json['description'] as String,
      json['image'] as String,
      (json['price'] as num).toDouble(),
      json['status'] as bool,
      json['trending'] as bool,
    );
Map<String, dynamic> _$FoodsToJson(Foods instance) => <String, dynamic>{
      'id': instance.id,
      'nameFood': instance.nameFood,
      'description': instance.description,
      'image': instance.image,
      'price': instance.price,
      'status': instance.status,
      'trending': instance.trending,
    };
