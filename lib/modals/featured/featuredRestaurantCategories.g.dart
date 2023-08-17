// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'featuredRestaurantCategories.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RestaurantCategoriesItem _$RestaurantCategoriesItemFromJson(
        Map<String, dynamic> json) =>
    RestaurantCategoriesItem(
      restaurant_id: json['restaurant_id'] as String?,
      in_offers: json['in_offers'] as bool?,
      offer_percentage: json['offer_percentage'] as String?,
      offer_price: json['offer_price'] as String?,
      isPro: json['isPro'] as bool?,
      topChoice: json['topChoice'] as bool?,
    );

Map<String, dynamic> _$RestaurantCategoriesItemToJson(
        RestaurantCategoriesItem instance) =>
    <String, dynamic>{
      'restaurant_id': instance.restaurant_id,
      'in_offers': instance.in_offers,
      'offer_percentage': instance.offer_percentage,
      'offer_price': instance.offer_price,
      'isPro': instance.isPro,
      'topChoice': instance.topChoice,
    };
