part of 'preferentials.dart';

Preferentials _$PreferentialsFromJson(Map<String, dynamic> json) =>
    Preferentials(
        json['id'] as String,
        json['nameCoupon'] as String,
        json['description'] as String,
        json['image'] as String,
        (json['discount'] as num).toDouble(),
        (json['start'] as Timestamp).toDate(),
        (json['end'] as Timestamp).toDate(),
        (json['quantity'] as num).toInt(),
        json['state'] as bool,
        json['voucherid'] as String);
Map<String, dynamic> _$PreferentialsToJson(Preferentials instance) =>
    <String, dynamic>{
      'nameCoupon': instance.nameCoupon,
      'description': instance.description,
      'image': instance.image,
      'discount': instance.discount,
      'start': instance.start.toIso8601String(),
      'end': instance.end.toIso8601String(),
      'quantity': instance.quantity,
      'state': instance.state,
      'id': instance.id,
      'voucherid': instance.voucherid,
    };
