class EduscationalModel {
  String? code;
  String? msg;
  EduscationalItmeModel? data;

  EduscationalModel({this.code, this.msg, this.data});

  EduscationalModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    data = json['data'] != null ? EduscationalItmeModel.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['msg'] = msg;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class EduscationalItmeModel {
  int? id;
  String? graduatedschool;
  String? profession;
  String? period;
  String? whether;
  String? education;
  String? experience;
  int? userId;

  EduscationalItmeModel(
      {this.id,
      this.graduatedschool,
      this.profession,
      this.period,
      this.whether,
      this.education,
      this.experience,
      this.userId});

  EduscationalItmeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    graduatedschool = json['graduatedschool'];
    profession = json['profession'];
    period = json['period'];
    whether = json['whether'];
    education = json['education'];
    experience = json['experience'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['graduatedschool'] = graduatedschool;
    data['profession'] = profession;
    data['period'] = period;
    data['whether'] = whether;
    data['education'] = education;
    data['experience'] = experience;
    data['user_id'] = userId;
    return data;
  }
}