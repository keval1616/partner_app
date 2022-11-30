class ClientHistoryModel {
  int income=0;
  int visitedCount=0;
  List<UserVisits>? userVisits;

  ClientHistoryModel({this.income=0, this.visitedCount=0, this.userVisits});

  ClientHistoryModel.fromJson(Map<String, dynamic> json) {
    income = json['income'];
    visitedCount = json['visited_count'];
    if (json['user_visits'] != null) {
      userVisits = <UserVisits>[];
      json['user_visits'].forEach((v) {
        userVisits!.add(new UserVisits.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['income'] = this.income;
    data['visited_count'] = this.visitedCount;
    if (this.userVisits != null) {
      data['user_visits'] = this.userVisits!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UserVisits {
  int? id;
  String? firstName;
  String? lastName;
  String? image;
  int? visitCount;

  UserVisits(
      {this.id, this.firstName, this.lastName, this.image, this.visitCount});

  UserVisits.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    image = json['image'];
    visitCount = json['visit_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['image'] = this.image;
    data['visit_count'] = this.visitCount;
    return data;
  }
}