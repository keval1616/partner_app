class GetContectModel {
  int? id;
  String? email;
  List<String>? phoneNumbers;
  String? createdDate;

  GetContectModel({this.id, this.email, this.phoneNumbers, this.createdDate});

  GetContectModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    phoneNumbers = json['phone_numbers'].cast<String>();
    createdDate = json['created_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['phone_numbers'] = this.phoneNumbers;
    data['created_date'] = this.createdDate;
    return data;
  }
}