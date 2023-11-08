/// status : true
/// message : "Records retrieved successfully."
/// data : [{"id":1,"name":"Chaats","slug":"chaat","image":"202310270559chaats.png","description":"Savor the explosive flavors of chaat on Qconnect.","is_deleted":0,"created_at":"2023-10-20 07:33:40","updated_at":"2023-10-27 05:59:55"},{"id":2,"name":"Thali","slug":"thali","image":"202310270559thali.png","description":"Experience the diverse flavors of India with our thali offerings on Qconnect.","is_deleted":0,"created_at":"2023-10-20 07:37:26","updated_at":"2023-10-27 05:59:09"},{"id":3,"name":"Biryani","slug":"biryani","image":"202310270557biryani.jpg","description":"Discover the aromatic world of biryani from Qconnect","is_deleted":0,"created_at":"2023-10-20 07:37:46","updated_at":"2023-10-27 05:57:45"},{"id":4,"name":"Curry","slug":"curry","image":"202310270549Curry.jpg","description":"Explore a world of delectable curries on Qconnect.","is_deleted":0,"created_at":"2023-10-27 05:31:18","updated_at":"2023-10-27 05:49:47"},{"id":5,"name":"Burger","slug":"burger","image":"202310270552burger.jpg","description":"Indulge in the ultimate burger experience through Qconnect.","is_deleted":0,"created_at":"2023-10-27 05:31:58","updated_at":"2023-10-27 05:52:57"},{"id":6,"name":"Pizza","slug":"pizza","image":"202310270602pizza.png","description":"Get ready to delight your taste buds with our mouthwatering pizza offerings.","is_deleted":0,"created_at":"2023-10-27 06:02:19","updated_at":"2023-10-27 06:02:19"},{"id":7,"name":"South Indian","slug":"south-indian","image":"202310270603south indian.png","description":"Embark on a culinary adventure with the diverse and flavorful world of South Indian cuisine.","is_deleted":0,"created_at":"2023-10-27 06:03:16","updated_at":"2023-10-27 06:03:16"},{"id":8,"name":"Chinese Continental","slug":"chinese-continental","image":"202310270604chinese continental.png","description":"Experience the best of both worlds with our Chinese and Continental fusion dishes.","is_deleted":0,"created_at":"2023-10-27 06:04:13","updated_at":"2023-10-27 06:04:13"},{"id":9,"name":"Donuts & Bakery","slug":"donuts-bakery","image":"202310270605donuts & bakery.png","description":"Indulge in the sweet and savory delights of our donuts and bakery treats.","is_deleted":0,"created_at":"2023-10-27 06:05:36","updated_at":"2023-10-27 06:05:36"},{"id":10,"name":"Cakes","slug":"cakes","image":"202310270606cakes.png","description":"From elegant wedding cakes to mouthwatering cupcakes, we make every occasion sweeter.","is_deleted":0,"created_at":"2023-10-27 06:06:34","updated_at":"2023-10-27 06:06:34"},{"id":11,"name":"Sweets & Snacks","slug":"sweets-snacks","image":"202310270607sweets & snacks.png","description":"Explore the perfect balance of sweet and savory with our delightful collection of sweets and snacks.","is_deleted":0,"created_at":"2023-10-27 06:07:15","updated_at":"2023-10-27 06:07:15"},{"id":12,"name":"Non Veg","slug":"non-veg","image":"202310270608non veg.png","description":"From succulent meats to mouthwatering seafood, we cater to carnivores with exquisite dishes.","is_deleted":0,"created_at":"2023-10-27 06:08:02","updated_at":"2023-10-27 06:08:02"}]

class FoodCategoriesMain {
  FoodCategoriesMain({
      this.status, 
      this.message, 
      this.data,});

  FoodCategoriesMain.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }
  bool? status;
  String? message;
  List<Data>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 1
/// name : "Chaats"
/// slug : "chaat"
/// image : "202310270559chaats.png"
/// description : "Savor the explosive flavors of chaat on Qconnect."
/// is_deleted : 0
/// created_at : "2023-10-20 07:33:40"
/// updated_at : "2023-10-27 05:59:55"

class Data {
  Data({
      this.id, 
      this.name, 
      this.slug, 
      this.image, 
      this.description, 
      this.isDeleted, 
      this.createdAt, 
      this.updatedAt,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
    description = json['description'];
    isDeleted = json['is_deleted'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  num? id;
  String? name;
  String? slug;
  String? image;
  String? description;
  num? isDeleted;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['slug'] = slug;
    map['image'] = image;
    map['description'] = description;
    map['is_deleted'] = isDeleted;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}