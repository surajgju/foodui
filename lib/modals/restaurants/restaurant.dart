
import 'package:json_annotation/json_annotation.dart';

part 'restaurant.g.dart';

@JsonSerializable()
class Restaurants {

  final String? rest_name;
  final String? rest_owner_name;
  final String? rest_owner_number;
  final String? rest_description;
  final String? rest_address;
  final String? rest_opening_hrs;
  final String? rest_delivery_time;
  final String? rest_minimum_order;
  final String? rest_rating;
  final String? cuisines_id;
  final List? rest_menu_images;

  Restaurants({this.rest_name,
 this.rest_owner_name,
 this.rest_owner_number,
 this.rest_description,
 this.rest_address,
 this.rest_opening_hrs,
 this.rest_delivery_time,
 this.rest_minimum_order,
    this.rest_rating,
    this.cuisines_id,
    this.rest_menu_images
  });

  factory Restaurants.fromJson(Map<String,dynamic> json)=> _$RestaurantsFromJson(json);
  Map<String,dynamic> toJson()=> _$RestaurantsToJson(this);
}