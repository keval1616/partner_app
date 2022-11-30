class SocialMediaDataModel {
  int? id;
  String? facebook;
  String? instagram;
  String? twitter;
  String? whatsapp;
  String? createdDate;

  SocialMediaDataModel(
      {this.id,
        this.facebook,
        this.instagram,
        this.twitter,
        this.whatsapp,
        this.createdDate});

  SocialMediaDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    facebook = json['facebook'];
    instagram = json['instagram'];
    twitter = json['twitter'];
    whatsapp = json['whatsapp'];
    createdDate = json['created_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['facebook'] = this.facebook;
    data['instagram'] = this.instagram;
    data['twitter'] = this.twitter;
    data['whatsapp'] = this.whatsapp;
    data['created_date'] = this.createdDate;
    return data;
  }
}