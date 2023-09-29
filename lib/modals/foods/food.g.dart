// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Foods _$FoodsFromJson(Map<String, dynamic> json) => Foods(
      food_id : json['food_id'] as int?,
      food_name: json['food_name'] as String?,
      food_description: json['food_description'] as String?,
      food_minimum_order: json['food_minimum_order'] as String?,
      food_rating: json['food_rating'] as String?,
      menu_id: json['menu_id'] as int?,
      img: json['img'] as String?,
      food_type: json['food_type'] as String?,
      price: json['price'] as String?,
      food_reviews_id: json['food_reviews_id'] as String?,
    );

Map<String, dynamic> _$FoodsToJson(Foods instance) => <String, dynamic>{
      'food_id': instance.food_id,
      'food_name': instance.food_name,
      'food_description': instance.food_description,
      'food_minimum_order': instance.food_minimum_order,
      'food_rating': instance.food_rating,
      'menu_id': instance.menu_id,
      'img': instance.img,
      'food_type': instance.food_type,
      'price': instance.price,
      'food_reviews_id': instance.food_reviews_id,
    };
