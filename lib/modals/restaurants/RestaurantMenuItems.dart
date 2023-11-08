class RestaurantMenuItems {
  RestaurantMenuItems({
      this.status, 
      this.message, 
      this.data,});

  RestaurantMenuItems.fromJson(dynamic json) {
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

class Data {
  Data({
      this.id, 
      this.mainCategory, 
      this.categoryId, 
      this.userId, 
      this.productName, 
      this.img, 
      this.description, 
      this.price, 
      this.oldPrice, 
      this.status, 
      this.slug,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    mainCategory = json['main_category'];
    categoryId = json['category_id'];
    userId = json['user_id'];
    productName = json['product_name'];
    img = json['img'];
    description = json['description'];
    price = json['price'];
    oldPrice = json['old_price'];
    status = json['status'];
    slug = json['slug'];
  }
  int? id;
  String? mainCategory;
  String? categoryId;
  String? userId;
  String? productName;
  String? img;
  String? description;
  String? price;
  String? oldPrice;
  String? status;
  String? slug;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['main_category'] = mainCategory;
    map['category_id'] = categoryId;
    map['user_id'] = userId;
    map['product_name'] = productName;
    map['img'] = img;
    map['description'] = description;
    map['price'] = price;
    map['old_price'] = oldPrice;
    map['status'] = status;
    map['slug'] = slug;
    return map;
  }

}