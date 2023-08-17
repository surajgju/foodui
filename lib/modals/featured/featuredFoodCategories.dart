import 'package:json_annotation/json_annotation.dart';

part 'featuredFoodCategories.g.dart';

@JsonSerializable()
class FoodCategoriesItem {
  final String? restaurant_id;
  final bool? in_offers;
  final String? food_id;
  final String? offer_percentage;
  final String? offer_price;
  FoodCategoriesItem(
      {this.restaurant_id,
      this.in_offers,
      this.food_id,
      this.offer_percentage,
      this.offer_price});

  factory FoodCategoriesItem.fromJson(Map<String,dynamic> json) => _$FoodCategoriesItemFromJson(json);

  Map<String,dynamic>toJson()=> _$FoodCategoriesItemToJson(this);

}