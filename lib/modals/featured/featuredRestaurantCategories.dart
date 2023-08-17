import 'package:json_annotation/json_annotation.dart';

part 'featuredRestaurantCategories.g.dart';

@JsonSerializable()
class RestaurantCategoriesItem {
  final String? restaurant_id;
  final bool? in_offers;
  final String? offer_percentage;
  final String? offer_price;
  final bool? isPro;
  final bool? topChoice;

  RestaurantCategoriesItem(
      {this.restaurant_id,
        this.in_offers,
        this.offer_percentage,
        this.offer_price,
      this.isPro,
        this.topChoice
      });

  factory RestaurantCategoriesItem.fromJson(Map<String,dynamic> json) => _$RestaurantCategoriesItemFromJson(json);

  Map<String,dynamic>toJson()=> _$RestaurantCategoriesItemToJson(this);

}