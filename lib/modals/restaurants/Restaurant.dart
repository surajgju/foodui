class Restaurant {
  Restaurant({
      this.id, 
      this.brandName, 
      this.storeType, 
      this.branch, 
      this.rollBusiness, 
      this.phone, 
      this.restaurantName, 
      this.restaurantPin, 
      this.restaurantCity, 
      this.restaurantAddress, 
      this.mobNumber, 
      this.landlineNumber, 
      this.ownerMobNumber, 
      this.ownerName, 
      this.ownerEmail, 
      this.ownerPassword, 
      this.img1, 
      this.img2, 
      this.status,});

  Restaurant.fromJson(dynamic json) {
    id = json['id'];
    brandName = json['brand_name'];
    storeType = json['store_type'];
    branch = json['branch'];
    rollBusiness = json['roll_business'];
    phone = json['phone'];
    restaurantName = json['restaurant_name'];
    restaurantPin = json['restaurant_pin'];
    restaurantCity = json['restaurant_city'];
    restaurantAddress = json['restaurant_address'];
    mobNumber = json['mob_number'];
    landlineNumber = json['landline_number'];
    ownerMobNumber = json['owner_mob_number'];
    ownerName = json['owner_name'];
    ownerEmail = json['owner_email'];
    ownerPassword = json['owner_password'];
    img1 = json['img1'];
    img2 = json['img2'];
    status = json['status'];
  }
  String? id;
  String? brandName;
  String? storeType;
  String? branch;
  String? rollBusiness;
  String? phone;
  String? restaurantName;
  String? restaurantPin;
  String? restaurantCity;
  String? restaurantAddress;
  String? mobNumber;
  String? landlineNumber;
  String? ownerMobNumber;
  String? ownerName;
  String? ownerEmail;
  String? ownerPassword;
  String? img1;
  String? img2;
  String? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['brand_name'] = brandName;
    map['store_type'] = storeType;
    map['branch'] = branch;
    map['roll_business'] = rollBusiness;
    map['phone'] = phone;
    map['restaurant_name'] = restaurantName;
    map['restaurant_pin'] = restaurantPin;
    map['restaurant_city'] = restaurantCity;
    map['restaurant_address'] = restaurantAddress;
    map['mob_number'] = mobNumber;
    map['landline_number'] = landlineNumber;
    map['owner_mob_number'] = ownerMobNumber;
    map['owner_name'] = ownerName;
    map['owner_email'] = ownerEmail;
    map['owner_password'] = ownerPassword;
    map['img1'] = img1;
    map['img2'] = img2;
    map['status'] = status;
    return map;
  }

}