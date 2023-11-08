/// status : true
/// message : "Records retrieved successfully."
/// data : [{"id":2,"name":"banner_1","slug":"banner-1","image":"202310270713banner01.jpeg","description":"banner one description","is_deleted":0,"created_at":"2023-10-27 07:13:38","updated_at":"2023-10-27 07:13:38"},{"id":3,"name":"banner_2","slug":"banner-2","image":"202310270714banner3.jpg","description":"banner two","is_deleted":0,"created_at":"2023-10-27 07:14:25","updated_at":"2023-10-27 07:14:25"},{"id":4,"name":"banner_3","slug":"banner-3","image":"202310270716banner03.jpeg","description":"banner three","is_deleted":0,"created_at":"2023-10-27 07:16:18","updated_at":"2023-10-27 07:16:18"}]

class BannersMain {
  BannersMain({
      this.status, 
      this.message, 
      this.data,});

  BannersMain.fromJson(dynamic json) {
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

/// id : 2
/// name : "banner_1"
/// slug : "banner-1"
/// image : "202310270713banner01.jpeg"
/// description : "banner one description"
/// is_deleted : 0
/// created_at : "2023-10-27 07:13:38"
/// updated_at : "2023-10-27 07:13:38"

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