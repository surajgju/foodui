/// results : [{"address_components":[{"long_name":"Noida","short_name":"Noida","types":["locality","political"]},{"long_name":"Gautam Buddh Nagar","short_name":"Gautam Buddh Nagar","types":["administrative_area_level_3","political"]},{"long_name":"Uttar Pradesh","short_name":"UP","types":["administrative_area_level_1","political"]},{"long_name":"India","short_name":"IN","types":["country","political"]}],"formatted_address":"Noida, Uttar Pradesh, India","geometry":{"bounds":{"northeast":{"lat":28.6358781,"lng":77.5065566},"southwest":{"lat":28.4085255,"lng":77.29709430000001}},"location":{"lat":28.5355161,"lng":77.3910265},"location_type":"APPROXIMATE","viewport":{"northeast":{"lat":28.6358781,"lng":77.5065566},"southwest":{"lat":28.4085255,"lng":77.29709430000001}}},"partial_match":true,"place_id":"ChIJezVzMaTlDDkRP8B8yDDO_zc","types":["locality","political"]}]
/// status : "OK"

class GeoCodeResponse {
  GeoCodeResponse({
      this.results, 
      this.status,});

  GeoCodeResponse.fromJson(dynamic json) {
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(Results.fromJson(v));
      });
    }
    status = json['status'];
  }
  List<Results>? results;
  String? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (results != null) {
      map['results'] = results?.map((v) => v.toJson()).toList();
    }
    map['status'] = status;
    return map;
  }

}

/// address_components : [{"long_name":"Noida","short_name":"Noida","types":["locality","political"]},{"long_name":"Gautam Buddh Nagar","short_name":"Gautam Buddh Nagar","types":["administrative_area_level_3","political"]},{"long_name":"Uttar Pradesh","short_name":"UP","types":["administrative_area_level_1","political"]},{"long_name":"India","short_name":"IN","types":["country","political"]}]
/// formatted_address : "Noida, Uttar Pradesh, India"
/// geometry : {"bounds":{"northeast":{"lat":28.6358781,"lng":77.5065566},"southwest":{"lat":28.4085255,"lng":77.29709430000001}},"location":{"lat":28.5355161,"lng":77.3910265},"location_type":"APPROXIMATE","viewport":{"northeast":{"lat":28.6358781,"lng":77.5065566},"southwest":{"lat":28.4085255,"lng":77.29709430000001}}}
/// partial_match : true
/// place_id : "ChIJezVzMaTlDDkRP8B8yDDO_zc"
/// types : ["locality","political"]

class Results {
  Results({
      this.addressComponents, 
      this.formattedAddress, 
      this.geometry, 
      this.partialMatch, 
      this.placeId, 
      this.types,});

  Results.fromJson(dynamic json) {
    if (json['address_components'] != null) {
      addressComponents = [];
      json['address_components'].forEach((v) {
        addressComponents?.add(AddressComponents.fromJson(v));
      });
    }
    formattedAddress = json['formatted_address'];
    geometry = json['geometry'] != null ? Geometry.fromJson(json['geometry']) : null;
    partialMatch = json['partial_match'];
    placeId = json['place_id'];
    types = json['types'] != null ? json['types'].cast<String>() : [];
  }
  List<AddressComponents>? addressComponents;
  String? formattedAddress;
  Geometry? geometry;
  bool? partialMatch;
  String? placeId;
  List<String>? types;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (addressComponents != null) {
      map['address_components'] = addressComponents?.map((v) => v.toJson()).toList();
    }
    map['formatted_address'] = formattedAddress;
    if (geometry != null) {
      map['geometry'] = geometry?.toJson();
    }
    map['partial_match'] = partialMatch;
    map['place_id'] = placeId;
    map['types'] = types;
    return map;
  }

}

/// bounds : {"northeast":{"lat":28.6358781,"lng":77.5065566},"southwest":{"lat":28.4085255,"lng":77.29709430000001}}
/// location : {"lat":28.5355161,"lng":77.3910265}
/// location_type : "APPROXIMATE"
/// viewport : {"northeast":{"lat":28.6358781,"lng":77.5065566},"southwest":{"lat":28.4085255,"lng":77.29709430000001}}

class Geometry {
  Geometry({
      this.bounds, 
      this.location, 
      this.locationType, 
      this.viewport,});

  Geometry.fromJson(dynamic json) {
    bounds = json['bounds'] != null ? Bounds.fromJson(json['bounds']) : null;
    location = json['location'] != null ? Location.fromJson(json['location']) : null;
    locationType = json['location_type'];
    viewport = json['viewport'] != null ? Viewport.fromJson(json['viewport']) : null;
  }
  Bounds? bounds;
  Location? location;
  String? locationType;
  Viewport? viewport;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (bounds != null) {
      map['bounds'] = bounds?.toJson();
    }
    if (location != null) {
      map['location'] = location?.toJson();
    }
    map['location_type'] = locationType;
    if (viewport != null) {
      map['viewport'] = viewport?.toJson();
    }
    return map;
  }

}

/// northeast : {"lat":28.6358781,"lng":77.5065566}
/// southwest : {"lat":28.4085255,"lng":77.29709430000001}

class Viewport {
  Viewport({
      this.northeast, 
      this.southwest,});

  Viewport.fromJson(dynamic json) {
    northeast = json['northeast'] != null ? Northeast.fromJson(json['northeast']) : null;
    southwest = json['southwest'] != null ? Southwest.fromJson(json['southwest']) : null;
  }
  Northeast? northeast;
  Southwest? southwest;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (northeast != null) {
      map['northeast'] = northeast?.toJson();
    }
    if (southwest != null) {
      map['southwest'] = southwest?.toJson();
    }
    return map;
  }

}

/// lat : 28.4085255
/// lng : 77.29709430000001

class Southwest {
  Southwest({
      this.lat, 
      this.lng,});

  Southwest.fromJson(dynamic json) {
    lat = json['lat'];
    lng = json['lng'];
  }
  num? lat;
  num? lng;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['lat'] = lat;
    map['lng'] = lng;
    return map;
  }

}

/// lat : 28.6358781
/// lng : 77.5065566

class Northeast {
  Northeast({
      this.lat, 
      this.lng,});

  Northeast.fromJson(dynamic json) {
    lat = json['lat'];
    lng = json['lng'];
  }
  num? lat;
  num? lng;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['lat'] = lat;
    map['lng'] = lng;
    return map;
  }

}

/// lat : 28.5355161
/// lng : 77.3910265

class Location {
  Location({
      this.lat, 
      this.lng,});

  Location.fromJson(dynamic json) {
    lat = json['lat'];
    lng = json['lng'];
  }
  num? lat;
  num? lng;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['lat'] = lat;
    map['lng'] = lng;
    return map;
  }

}

/// northeast : {"lat":28.6358781,"lng":77.5065566}
/// southwest : {"lat":28.4085255,"lng":77.29709430000001}

class Bounds {
  Bounds({
      this.northeast, 
      this.southwest,});

  Bounds.fromJson(dynamic json) {
    northeast = json['northeast'] != null ? Northeast.fromJson(json['northeast']) : null;
    southwest = json['southwest'] != null ? Southwest.fromJson(json['southwest']) : null;
  }
  Northeast? northeast;
  Southwest? southwest;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (northeast != null) {
      map['northeast'] = northeast?.toJson();
    }
    if (southwest != null) {
      map['southwest'] = southwest?.toJson();
    }
    return map;
  }

}





/// long_name : "Noida"
/// short_name : "Noida"
/// types : ["locality","political"]

class AddressComponents {
  AddressComponents({
      this.longName, 
      this.shortName, 
      this.types,});

  AddressComponents.fromJson(dynamic json) {
    longName = json['long_name'];
    shortName = json['short_name'];
    types = json['types'] != null ? json['types'].cast<String>() : [];
  }
  String? longName;
  String? shortName;
  List<String>? types;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['long_name'] = longName;
    map['short_name'] = shortName;
    map['types'] = types;
    return map;
  }

}