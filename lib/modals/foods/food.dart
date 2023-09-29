
import 'package:json_annotation/json_annotation.dart';

part 'food.g.dart';

@JsonSerializable()
class Foods {
  final int? food_id;
  final String? food_name;
  final String? food_description;
  final String? food_minimum_order;
  final String? food_rating;
  final int? menu_id;
  final String? img;
  final String? food_type;
  final String? price;
  final String? food_reviews_id;

  Foods({
    this.food_id,
    this.food_name,
 this.food_description,
 this.food_minimum_order,
 this.food_rating,
 this.menu_id,
 this.img,
 this.food_type,
 this.price,
 this.food_reviews_id});

  factory Foods.fromJson(Map<String,dynamic> json)=> _$FoodsFromJson(json);
  Map<String,dynamic> toJson()=> _$FoodsToJson(this);
}