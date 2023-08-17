// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Foods _$FoodsFromJson(Map<String, dynamic> json) => Foods(
      food_name: json['food_name'] as String?,
      food_description: json['food_description'] as String?,
      food_minimum_order: json['food_minimum_order'] as String?,
      food_rating: json['food_rating'] as String?,
      cuisines_id: json['cuisines_id'] as String?,
      food_images: json['food_images'] as List<dynamic>?,
      food_type: json['food_type'] as String?,
      food_price: json['food_price'] as String?,
      food_reviews_id: json['food_reviews_id'] as String?,
    );

Map<String, dynamic> _$FoodsToJson(Foods instance) => <String, dynamic>{
      'food_name': instance.food_name,
      'food_description': instance.food_description,
      'food_minimum_order': instance.food_minimum_order,
      'food_rating': instance.food_rating,
      'cuisines_id': instance.cuisines_id,
      'food_images': instance.food_images,
      'food_type': instance.food_type,
      'food_price': instance.food_price,
      'food_reviews_id': instance.food_reviews_id,
    };
