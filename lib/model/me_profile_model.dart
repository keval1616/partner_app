class ProfileModel {
  int? id;
  String? firstName;
  String? lastName;
  String? age;
  String? discount;
  int? phoneNumber;
  String? birthDate;
  String? image;
  String? username;
  String? email;
  String? plan;
  String? partnerId;

  ProfileModel(
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
      this.plan,
        this.partnerId
      });

  ProfileModel.fromJson(Map<String, dynamic> json) {
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
    partnerId = json['partner_id'];
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
    data['partner_id'] = this.partnerId;
    return data;
  }
}
