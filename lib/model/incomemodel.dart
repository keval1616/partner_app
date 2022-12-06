class IncomeModel {
  int? income;
  int? incomeIncrementRate;
  int? visitedCount;
  int? visitedCountIncrementRate;
  List<UserVisits>? userVisits;

  IncomeModel(
      {this.income,
        this.incomeIncrementRate,
        this.visitedCount,
        this.visitedCountIncrementRate,
        this.userVisits});

  IncomeModel.fromJson(Map<String, dynamic> json) {
    income = json['income'];
    incomeIncrementRate = json['income_increment_rate'];
    visitedCount = json['visited_count'];
    visitedCountIncrementRate = json['visited_count_increment_rate'];
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
    data['income_increment_rate'] = this.incomeIncrementRate;
    data['visited_count'] = this.visitedCount;
    data['visited_count_increment_rate'] = this.visitedCountIncrementRate;
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