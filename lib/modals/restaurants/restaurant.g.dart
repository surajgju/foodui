// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Restaurants _$RestaurantsFromJson(Map<String, dynamic> json) => Restaurants(
      rest_name: json['rest_name'] as String?,
      rest_owner_name: json['rest_owner_name'] as String?,
      rest_owner_number: json['rest_owner_number'] as String?,
      rest_description: json['rest_description'] as String?,
      rest_address: json['rest_address'] as String?,
      rest_opening_hrs: json['rest_opening_hrs'] as String?,
      rest_delivery_time: json['rest_delivery_time'] as String?,
      rest_minimum_order: json['rest_minimum_order'] as String?,
      rest_rating: json['rest_rating'] as String?,
      cuisines_id: json['cuisines_id'] as String?,
      rest_menu_images: json['rest_menu_images'] as List<dynamic>?,
    );

Map<String, dynamic> _$RestaurantsToJson(Restaurants instance) =>
    <String, dynamic>{
      'rest_name': instance.rest_name,
      'rest_owner_name': instance.rest_owner_name,
      'rest_owner_number': instance.rest_owner_number,
      'rest_description': instance.rest_description,
      'rest_address': instance.rest_address,
      'rest_opening_hrs': instance.rest_opening_hrs,
      'rest_delivery_time': instance.rest_delivery_time,
      'rest_minimum_order': instance.rest_minimum_order,
      'rest_rating': instance.rest_rating,
      'cuisines_id': instance.cuisines_id,
      'rest_menu_images': instance.rest_menu_images,
    };
