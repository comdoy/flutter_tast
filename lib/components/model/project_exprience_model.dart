class ProjectExperienceModels {
  String? code;
  String? msg;
  ProjectExperienceModel? data;

  ProjectExperienceModels({this.code, this.msg, this.data});

  ProjectExperienceModels.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    data = json['data'] != null ? ProjectExperienceModel.fromJson(json['data']) : null;
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

class ProjectExperienceModel {
  int? id;
  int? userId;
  String? projectname;
  String? role;
  String? schedule;
  String? background;
  String? experience;

  ProjectExperienceModel(
      {this.id,
      this.userId,
      this.projectname,
      this.role,
      this.schedule,
      this.background,
      this.experience});

  ProjectExperienceModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    projectname = json['projectname'];
    role = json['role'];
    schedule = json['schedule'];
    background = json['background'];
    experience = json['experience'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['projectname'] = projectname;
    data['role'] = role;
    data['schedule'] = schedule;
    data['background'] = background;
    data['experience'] = experience;
    return data;
  }
}