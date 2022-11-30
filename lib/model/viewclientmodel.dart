class ViewClientModel {
  int? visitedCount;
  String? last_visit_date;
  User? user;

  ViewClientModel({this.visitedCount, this.last_visit_date, this.user});

  ViewClientModel.fromJson(Map<String, dynamic> json) {
    visitedCount = json['visited_count'];
    last_visit_date = json['last_visit_date'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['visited_count'] = this.visitedCount;
    data['last_visit_date'] = this.last_visit_date;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? firstName;
  String? lastName;
  int? age;
  String? discount;
  String? phoneNumber;
  String? birthDate;
  String? image;
  String? username;
  String? email;
  String? plan;

  User(
      {this.id,
      this.firstName,
      this.lastName,
      this.age,
      this.discount,
      this.phoneNumber,
      this.birthDate,
      this.image,
      this.username,
      this.email,
      this.plan});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    age = json['age'];
    discount = json['discount'];
    phoneNumber = json['phone_number'];
    birthDate = json['birth_date'];
    image = json['image'];
    username = json['username'];
    email = json['email'];
    plan = json['plan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['age'] = this.age;
    data['discount'] = this.discount;
    data['phone_number'] = this.phoneNumber;
    data['birth_date'] = this.birthDate;
    data['image'] = this.image;
    data['username'] = this.username;
    data['email'] = this.email;
    data['plan'] = this.plan;
    return data;
  }
}
