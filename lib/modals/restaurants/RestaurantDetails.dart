/// id : 8
/// name : "Mcdonalds Sector 63"
/// email : "sunill@qconnect.com"
/// phone : "987657890"
/// password : "17aa1eb864dfc173fa7b67c05672591c"
/// address : "McDonald's, Plot No. H-224-I Sector 63, Vishwakarma Rd, Noida, Uttar Pradesh 201301"
/// user_type : 1
/// brand_name : "Mcdonalds"
/// store_type : "Restaurant"
/// branch : "Sector 63"
/// roll_business : "Owner/Partner"
/// restaurant_name : "Mcdonalds Sector 63"
/// restaurent_phone : "987654321"
/// pincode : "201309"
/// city : "Noida"
/// landline_number : "-9876545689"
/// owner_mob_number : "9765456789"
/// owner_name : "Sunil"
/// owner_email : "sunill@qconnect.com"
/// img1 : "202311021725download (2).jfif"
/// img2 : null
/// gender : "NULL"
/// dob : "NULL"
/// newsletter_check : "NULL"
/// sms_check : "NULL"
/// status : "Active"
/// created_at : "2023-11-04 12:42:23"
/// updated_at : "2023-11-04 12:42:23"
/// minimum_order : "NULL"
/// working_hours : "NULL"
/// delivery_time : "NULL"
/// delivery_fee : "NULL"
/// plus_code : "J9FG+R2 Noida, Uttar Pradesh, India"
/// pre_order : "NULL"
/// open_at : ""
/// close_at : "NULL"

class RestaurantDetails {
  RestaurantDetails({
      this.id, 
      this.name, 
      this.email, 
      this.phone, 
      this.password, 
      this.address, 
      this.userType, 
      this.brandName, 
      this.storeType, 
      this.branch, 
      this.rollBusiness, 
      this.restaurantName, 
      this.restaurentPhone, 
      this.pincode, 
      this.city, 
      this.landlineNumber, 
      this.ownerMobNumber, 
      this.ownerName, 
      this.ownerEmail, 
      this.img1, 
      this.img2, 
      this.gender, 
      this.dob, 
      this.newsletterCheck, 
      this.smsCheck, 
      this.status, 
      this.createdAt, 
      this.updatedAt, 
      this.minimumOrder, 
      this.workingHours, 
      this.deliveryTime, 
      this.deliveryFee, 
      this.plusCode, 
      this.preOrder, 
      this.openAt, 
      this.closeAt,});

  RestaurantDetails.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    password = json['password'];
    address = json['address'];
    userType = json['user_type'];
    brandName = json['brand_name'];
    storeType = json['store_type'];
    branch = json['branch'];
    rollBusiness = json['roll_business'];
    restaurantName = json['restaurant_name'];
    restaurentPhone = json['restaurent_phone'];
    pincode = json['pincode'];
    city = json['city'];
    landlineNumber = json['landline_number'];
    ownerMobNumber = json['owner_mob_number'];
    ownerName = json['owner_name'];
    ownerEmail = json['owner_email'];
    img1 = json['img1'];
    img2 = json['img2'];
    gender = json['gender'];
    dob = json['dob'];
    newsletterCheck = json['newsletter_check'];
    smsCheck = json['sms_check'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    minimumOrder = json['minimum_order'];
    workingHours = json['working_hours'];
    deliveryTime = json['delivery_time'];
    deliveryFee = json['delivery_fee'];
    plusCode = json['plus_code'];
    preOrder = json['pre_order'];
    openAt = json['open_at'];
    closeAt = json['close_at'];
  }
  num? id;
  String? name;
  String? email;
  String? phone;
  String? password;
  String? address;
  num? userType;
  String? brandName;
  String? storeType;
  String? branch;
  String? rollBusiness;
  String? restaurantName;
  String? restaurentPhone;
  String? pincode;
  String? city;
  String? landlineNumber;
  String? ownerMobNumber;
  String? ownerName;
  String? ownerEmail;
  String? img1;
  dynamic img2;
  String? gender;
  String? dob;
  String? newsletterCheck;
  String? smsCheck;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? minimumOrder;
  String? workingHours;
  String? deliveryTime;
  String? deliveryFee;
  String? plusCode;
  String? preOrder;
  String? openAt;
  String? closeAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['email'] = email;
    map['phone'] = phone;
    map['password'] = password;
    map['address'] = address;
    map['user_type'] = userType;
    map['brand_name'] = brandName;
    map['store_type'] = storeType;
    map['branch'] = branch;
    map['roll_business'] = rollBusiness;
    map['restaurant_name'] = restaurantName;
    map['restaurent_phone'] = restaurentPhone;
    map['pincode'] = pincode;
    map['city'] = city;
    map['landline_number'] = landlineNumber;
    map['owner_mob_number'] = ownerMobNumber;
    map['owner_name'] = ownerName;
    map['owner_email'] = ownerEmail;
    map['img1'] = img1;
    map['img2'] = img2;
    map['gender'] = gender;
    map['dob'] = dob;
    map['newsletter_check'] = newsletterCheck;
    map['sms_check'] = smsCheck;
    map['status'] = status;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['minimum_order'] = minimumOrder;
    map['working_hours'] = workingHours;
    map['delivery_time'] = deliveryTime;
    map['delivery_fee'] = deliveryFee;
    map['plus_code'] = plusCode;
    map['pre_order'] = preOrder;
    map['open_at'] = openAt;
    map['close_at'] = closeAt;
    return map;
  }

}