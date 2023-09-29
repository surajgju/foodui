// class FoodCategoriesListing {
//   FoodCategoriesListing({
//       this.status,
//       this.message,
//       this.data,});
//
//   FoodCategoriesListing.fromJson(dynamic json) {
//     status = json['status'];
//     message = json['message'];
//     if (json['data'] != null) {
//       data = [];
//       json['data'].forEach((v) {
//         data?.add(Data.fromJson(v));
//       });
//     }
//   }
//   bool? status;
//   String? message;
//   List<Data>? data;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['status'] = status;
//     map['message'] = message;
//     if (data != null) {
//       map['data'] = data?.map((v) => v.toJson()).toList();
//     }
//     return map;
//   }
//
// }
//
// class Data {
//   Data({
//       this.id,
//       this.userId,
//       this.category,
//       this.status,
//       this.slug,
//       this.img,});
//
//   Data.fromJson(dynamic json) {
//     id = json['id'];
//     userId = json['user_id'];
//     category = json['category'];
//     status = json['status'];
//     slug = json['slug'];
//     img = json['img'];
//   }
//   String? id;
//   String? userId;
//   String? category;
//   String? status;
//   String? slug;
//   String? img;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['id'] = id;
//     map['user_id'] = userId;
//     map['category'] = category;
//     map['status'] = status;
//     map['slug'] = slug;
//     map['img'] = img;
//     return map;
//   }
//
// }