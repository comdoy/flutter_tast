class UserOffersModel {
  String? code;
  String? msg;
  UserOffersItme? data;

  UserOffersModel({this.code, this.msg, this.data});

  UserOffersModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    data = json['data'] != null ? UserOffersItme.fromJson(json['data']) : null;
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
class UserOffersItme {
  int? id;
  int? userId;
  int? offersId;

  UserOffersItme({this.id, this.userId, this.offersId});

  UserOffersItme.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    offersId = json['offers_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['offers_id'] = offersId;
    return data;
  }
}
