class CareerPlanningModels {
  String? code;
  String? msg;
  CareerPlanningModel? data;

  CareerPlanningModels({this.code, this.msg, this.data});

  CareerPlanningModels.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    data = json['data'] != null ? CareerPlanningModel.fromJson(json['data']) : null;
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

class CareerPlanningModel {
  int? id;
  int? userId;
  String? future;
  String? industry;
  String? salary;
  String? target;
  String? planning;

  CareerPlanningModel(
      {this.id,
      this.userId,
      this.future,
      this.industry,
      this.salary,
      this.target,
      this.planning});

  CareerPlanningModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    future = json['future'];
    industry = json['industry'];
    salary = json['salary'];
    target = json['target'];
    planning = json['planning'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['future'] = future;
    data['industry'] = industry;
    data['salary'] = salary;
    data['target'] = target;
    data['planning'] = planning;
    return data;
  }
}