// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

SubmitResumeModel submitResumeFromJson(String str) => SubmitResumeModel.fromJson(json.decode(str));

String submitResumeToJson(SubmitResumeModel data) => json.encode(data.toJson());

class SubmitResumeModel {
    SubmitResumeModel({
        required this.code,
        required this.msg,
        required this.data,
    });

    String code;
    String msg;
    OffersItem data;

    factory SubmitResumeModel.fromJson(Map<String, dynamic> json) => SubmitResumeModel(
        code: json["code"],
        msg: json["msg"],
        data:  OffersItem.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "msg": msg,
        "data": data.toJson(),
    };
}

class  OffersItem {
     OffersItem({
        this.id,
        this.userId,
        this.jobtitle,
        this.jobtime,
        this.jobdeadline,
        this.jobroute,
        this.jobcity,
        this.jobpeople,
        this.jobimage,
        this.jobcompany,
        this.jobsalary,
        this.jobboon,
        this.recruiterId,
        this.jobposition,
    });

    int? id;
    int? userId;
    String? jobtitle;
    String? jobtime;
    String? jobdeadline;
    String? jobroute;
    String? jobcity;
    String? jobpeople;
    String? jobimage;
    String? jobcompany;
    String? jobsalary;
    String? jobboon;
    int? recruiterId;
    String? jobposition;

    factory  OffersItem.fromJson(Map<String, dynamic> json) =>  OffersItem(
        id: json["id"],
        userId: json["user_id"],
        jobtitle: json["jobtitle"],
        jobtime: json["jobtime"],
        jobdeadline: json["jobdeadline"],
        jobroute: json["jobroute"],
        jobcity: json["jobcity"],
        jobpeople: json["jobpeople"],
        jobimage: json["jobimage"],
        jobcompany: json["jobcompany"],
        jobsalary: json["jobsalary"],
        jobboon: json["jobboon"],
        recruiterId: json["recruiter_id"],
        jobposition: json["jobposition"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "jobtitle": jobtitle,
        "jobtime": jobtime,
        "jobdeadline": jobdeadline,
        "jobroute": jobroute,
        "jobcity": jobcity,
        "jobpeople": jobpeople,
        "jobimage": jobimage,
        "jobcompany": jobcompany,
        "jobsalary": jobsalary,
        "jobboon": jobboon,
        "recruiter_id": recruiterId,
        "jobposition": jobposition,
    };
}
