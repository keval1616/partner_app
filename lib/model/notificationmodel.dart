class NotificationModel {
  int? id;
  String? title;
  String? content;
  String? createdDate;

  NotificationModel({this.id, this.title, this.content, this.createdDate});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    content = json['content'];
    createdDate = json['created_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['content'] = this.content;
    data['created_date'] = this.createdDate;
    return data;
  }
}