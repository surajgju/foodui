/// destination_addresses : ["Unnamed Road, Sector 63, Noida, Uttar Pradesh 201307, India"]
/// origin_addresses : ["C-56/5, Ground floor, Mantec Tower, Near Akasa, Block A, Industrial Area, Sector 62, Noida, Uttar Pradesh 201309, India"]
/// rows : [{"elements":[{"distance":{"text":"3.4 km","value":3375},"duration":{"text":"10 mins","value":572},"status":"OK"}]}]
/// status : "OK"

class DistanceMatrixResponse {
  DistanceMatrixResponse({
      this.destinationAddresses, 
      this.originAddresses, 
      this.rows, 
      this.status,});

  DistanceMatrixResponse.fromJson(dynamic json) {
    destinationAddresses = json['destination_addresses'] != null ? json['destination_addresses'].cast<String>() : [];
    originAddresses = json['origin_addresses'] != null ? json['origin_addresses'].cast<String>() : [];
    if (json['rows'] != null) {
      rows = [];
      json['rows'].forEach((v) {
        rows?.add(Rows.fromJson(v));
      });
    }
    status = json['status'];
  }
  List<String>? destinationAddresses;
  List<String>? originAddresses;
  List<Rows>? rows;
  String? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['destination_addresses'] = destinationAddresses;
    map['origin_addresses'] = originAddresses;
    if (rows != null) {
      map['rows'] = rows?.map((v) => v.toJson()).toList();
    }
    map['status'] = status;
    return map;
  }

}

/// elements : [{"distance":{"text":"3.4 km","value":3375},"duration":{"text":"10 mins","value":572},"status":"OK"}]

class Rows {
  Rows({
      this.elements,});

  Rows.fromJson(dynamic json) {
    if (json['elements'] != null) {
      elements = [];
      json['elements'].forEach((v) {
        elements?.add(Elements.fromJson(v));
      });
    }
  }
  List<Elements>? elements;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (elements != null) {
      map['elements'] = elements?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// distance : {"text":"3.4 km","value":3375}
/// duration : {"text":"10 mins","value":572}
/// status : "OK"

class Elements {
  Elements({
      this.distance, 
      this.duration, 
      this.status,});

  Elements.fromJson(dynamic json) {
    distance = json['distance'] != null ? Distance.fromJson(json['distance']) : null;
    duration = json['duration'] != null ? Duration.fromJson(json['duration']) : null;
    status = json['status'];
  }
  Distance? distance;
  Duration? duration;
  String? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (distance != null) {
      map['distance'] = distance?.toJson();
    }
    if (duration != null) {
      map['duration'] = duration?.toJson();
    }
    map['status'] = status;
    return map;
  }

}

/// text : "10 mins"
/// value : 572

class Duration {
  Duration({
      this.text, 
      this.value,});

  Duration.fromJson(dynamic json) {
    text = json['text'];
    value = json['value'];
  }
  String? text;
  num? value;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['text'] = text;
    map['value'] = value;
    return map;
  }

}

/// text : "3.4 km"
/// value : 3375

class Distance {
  Distance({
      this.text, 
      this.value,});

  Distance.fromJson(dynamic json) {
    text = json['text'];
    value = json['value'];
  }
  String? text;
  num? value;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['text'] = text;
    map['value'] = value;
    return map;
  }

}