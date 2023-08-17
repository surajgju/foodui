
import 'package:json_annotation/json_annotation.dart';

part 'food.g.dart';

@JsonSerializable()
class Foods {

  final String? food_name;
  final String? food_description;
  final String? food_minimum_order;
  final String? food_rating;
  final String? cuisines_id;
  final List? food_images;
  final String? food_type;
  final String? food_price;
  final String? food_reviews_id;

  Foods({this.food_name,
 this.food_description,
 this.food_minimum_order,
 this.food_rating,
 this.cuisines_id,
 this.food_images,
 this.food_type,
 this.food_price,
 this.food_reviews_id});

  factory Foods.fromJson(Map<String,dynamic> json)=> _$FoodsFromJson(json);
  Map<String,dynamic> toJson()=> _$FoodsToJson(this);
}