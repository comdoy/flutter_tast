class UserModel {
  int? code;
  String? msg;
 UserHomeModel? data;

  UserModel({this.code, this.msg, this.data});

  UserModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    data = json['data'] != null ? UserHomeModel.fromJson(json['data']) : null;
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

class UserHomeModel {
  int? id;
  String? username;
  String? password;
  String? nickname;
  int? age;
  String? sex;
  String? address;
  String? identity;
  String? educational;
  String? images;
  String? advantagename;
  String? advantagecontent;
  int? recruiterId;

  UserHomeModel(
      {this.id,
      this.username,
      this.password,
      this.nickname,
      this.age,
      this.sex,
      this.address,
      this.identity,
      this.educational,
      this.images,
      this.advantagename,
      this.advantagecontent,
      this.recruiterId});

  UserHomeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    password = json['password'];
    nickname = json['nickname'];
    age = json['age'];
    sex = json['sex'];
    address = json['address'];
    identity = json['identity'];
    educational = json['educational'];
    images = json['images'];
    advantagename = json['advantagename'];
    advantagecontent = json['advantagecontent'];
    recruiterId = json['recruiter_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['password'] = password;
    data['nickname'] = nickname;
    data['age'] = age;
    data['sex'] = sex;
    data['address'] = address;
    data['identity'] = identity;
    data['educational'] = educational;
    data['images'] = images;
    data['advantagename'] = advantagename;
    data['advantagecontent'] = advantagecontent;
    data['recruiter_id'] = recruiterId;
    return data;
  }
}