part of 'tables.dart';

Tables _$TablesFromJson(Map<String, dynamic> json) => Tables(
      json['id'] as String,
      json['nameTable'] as String,
      json['description'] as String,
      json['image'] as String,
      (json['price'] as num).toDouble(),
      json['state'] as bool,
      json['tableid'] as String,
    );
Map<String, dynamic> _$TablesToJson(Tables instance) => <String, dynamic>{
      'id': instance.id,
      'nameTable': instance.nameTable,
      'description': instance.description,
      'image': instance.image,
      'price': instance.price,
      'state': instance.state,
      'tableid': instance.tableid,
    };
