class JobUserInfoModel {
  String? code;
  String? msg;
  JobUser? data;

  JobUserInfoModel({this.code, this.msg, this.data});

  JobUserInfoModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    data = json['data'] != null ? JobUser.fromJson(json['data']) : null;
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

class JobUser {
  int? id;
  String? recruiterName;
  String? recruiterDetails;
  String? recruiterImage;
  String? recruiterCity;
  String? recruiterPosition;
  String? recruiterPhone;
  String? recruiterAccount;
  String? recruiterPassword;

  JobUser(
      {this.id,
      this.recruiterName,
      this.recruiterDetails,
      this.recruiterImage,
      this.recruiterCity,
      this.recruiterPosition,
      this.recruiterPhone,
      this.recruiterAccount,
      this.recruiterPassword});

  JobUser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    recruiterName = json['recruiter_name'];
    recruiterDetails = json['recruiter_details'];
    recruiterImage = json['recruiter_image'];
    recruiterCity = json['recruiter_city'];
    recruiterPosition = json['recruiter_position'];
    recruiterPhone = json['recruiter_phone'];
    recruiterAccount = json['recruiter_account'];
    recruiterPassword = json['recruiter_password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['recruiter_name'] = recruiterName;
    data['recruiter_details'] = recruiterDetails;
    data['recruiter_image'] = recruiterImage;
    data['recruiter_city'] = recruiterCity;
    data['recruiter_position'] = recruiterPosition;
    data['recruiter_phone'] = recruiterPhone;
    data['recruiter_account'] = recruiterAccount;
    data['recruiter_password'] = recruiterPassword;
    return data;
  }
}