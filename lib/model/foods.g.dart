part of 'foods.dart';

Foods _$FoodsFromJson(Map<String, dynamic> json) => Foods(
      id: json['id'] as String,
      nameFood: json['nameFood'] as String,
      description: json['description'] as String,
      image: json['image'] as String,
      price: (json['price'] as num).toDouble(),
      status: json['status'] as bool,
      trending: json['trending'] as bool,
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
