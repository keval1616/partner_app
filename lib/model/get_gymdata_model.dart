class GetGymDataModel {
  int? id;
  String? name;
  Category? category;
  List<Sports>? sports;
  String? description;
  String? ageGroup;
  Null? subscribedPlan;
  String? postalCode;
  String? city;
  String? addressLine1;
  String? addressLine2;
  String? long;
  String? lat;
  String? logo;
  List<Images>? images;
  List<OpeningHours>? openingHours;
  String? createdDate;

  GetGymDataModel(
      {this.id,
      this.name,
      this.category,
      this.sports,
      this.description,
      this.ageGroup,
      this.subscribedPlan,
      this.postalCode,
      this.city,
      this.addressLine1,
      this.addressLine2,
      this.long,
      this.lat,
      this.logo,
      this.images,
      this.openingHours,
      this.createdDate});

  GetGymDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    if (json['sports'] != null) {
      sports = <Sports>[];
      json['sports'].forEach((v) {
        sports!.add(new Sports.fromJson(v));
      });
    }
    description = json['description'];
    ageGroup = json['age_group'];
    subscribedPlan = json['subscribed_plan'];
    postalCode = json['postal_code'];
    city = json['city'];
    addressLine1 = json['address_line1'];
    addressLine2 = json['address_line2'];
    long = json['long'];
    lat = json['lat'];
    logo = json['logo'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
    if (json['opening_hours'] != null) {
      openingHours = <OpeningHours>[];
      json['opening_hours'].forEach((v) {
        openingHours!.add(new OpeningHours.fromJson(v));
      });
    }
    createdDate = json['created_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    if (this.sports != null) {
      data['sports'] = this.sports!.map((v) => v.toJson()).toList();
    }
    data['description'] = this.description;
    data['age_group'] = this.ageGroup;
    data['subscribed_plan'] = this.subscribedPlan;
    data['postal_code'] = this.postalCode;
    data['city'] = this.city;
    data['address_line1'] = this.addressLine1;
    data['address_line2'] = this.addressLine2;
    data['long'] = this.long;
    data['lat'] = this.lat;
    data['logo'] = this.logo;
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    if (this.openingHours != null) {
      data['opening_hours'] =
          this.openingHours!.map((v) => v.toJson()).toList();
    }
    data['created_date'] = this.createdDate;
    return data;
  }
}

class Images {
  int? id;
  String? image;

  Images({this.id, this.image});

  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    return data;
  }
}

class Category {
  int? id;
  String? title;
  List<Null>? image;
  List<Sports>? sports;

  Category({this.id, this.title, this.image, this.sports});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    if (json['sports'] != null) {
      sports = <Sports>[];
      json['sports'].forEach((v) {
        sports!.add(new Sports.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['image'] = this.image;
    if (this.sports != null) {
      data['sports'] = this.sports!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Sports {
  int? id;
  String? name;

  Sports({this.id, this.name});

  Sports.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class OpeningHours {
  int? id;
  String? getWeekdayDisplay;
  String? fromHour;
  String? toHour;

  OpeningHours({this.id, this.getWeekdayDisplay, this.fromHour, this.toHour});

  OpeningHours.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    getWeekdayDisplay = json['get_weekday_display'];
    fromHour = json['from_hour'];
    toHour = json['to_hour'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['get_weekday_display'] = this.getWeekdayDisplay;
    data['from_hour'] = this.fromHour;
    data['to_hour'] = this.toHour;
    return data;
  }
}
