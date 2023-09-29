class RestaurantCategoriesByFoodItem {
  RestaurantCategoriesByFoodItem({
      this.status, 
      this.message, 
      this.data,});

  RestaurantCategoriesByFoodItem.fromJson(dynamic json) {
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
      this.catName, 
      this.img, 
      this.status,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    catName = json['cat_name'];
    img = json['img'];
    status = json['status'];
  }
  String? id;
  String? catName;
  String? img;
  String? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['cat_name'] = catName;
    map['img'] = img;
    map['status'] = status;
    return map;
  }

}