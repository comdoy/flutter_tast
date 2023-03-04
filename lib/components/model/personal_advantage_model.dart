class AdvantageModels {
  String? code;
  String? msg;
  AdvantageModel? data;

  AdvantageModels({this.code, this.msg, this.data});

  AdvantageModels.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    data = json['data'] != null ? AdvantageModel.fromJson(json['data']) : null;
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

class AdvantageModel {
  int? id;
  String? advantagenames;
  String? advantagecontents;
  int? userId;
  String? responsmodule;

  AdvantageModel(
      {this.id,
      this.advantagenames,
      this.advantagecontents,
      this.userId,
      this.responsmodule});

  AdvantageModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    advantagenames = json['advantagenames'];
    advantagecontents = json['advantagecontents'];
    userId = json['user_id'];
    responsmodule = json['responsmodule'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['advantagenames'] = advantagenames;
    data['advantagecontents'] = advantagecontents;
    data['user_id'] = userId;
    data['responsmodule'] = responsmodule;
    return data;
  }
}
