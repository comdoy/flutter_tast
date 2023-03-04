// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

JobOffersModel jobOffersFromJson(String str) => JobOffersModel.fromJson(json.decode(str));

String jobOffersToJson(JobOffersModel data) => json.encode(data.toJson());

class JobOffersModel {
    JobOffersModel({
        required this.code,
        required this.msg,
        required this.data,
    });

    int code;
    String msg;
    Offers data;

    factory JobOffersModel.fromJson(Map<String, dynamic> json) => JobOffersModel(
        code: json["code"],
        msg: json["msg"],
        data: Offers.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "msg": msg,
        "data": data.toJson(),
    };
}

class Offers {
    Offers({
        required this.records,
        required this.total,
        required this.size,
        required this.current,
        required this.orders,
        required this.optimizeCountSql,
        required this.searchCount,
        this.countId,
        this.maxLimit,
        required this.pages,
    });

    List<OffersperItem> records;
    int total;
    int size;
    int current;
    List<dynamic> orders;
    bool optimizeCountSql;
    bool searchCount;
    dynamic countId;
    dynamic maxLimit;
    int pages;

    factory Offers.fromJson(Map<String, dynamic> json) => Offers(
        records: List<OffersperItem>.from(json["records"].map((x) => OffersperItem.fromJson(x))),
        total: json["total"],
        size: json["size"],
        current: json["current"],
        orders: List<dynamic>.from(json["orders"].map((x) => x)),
        optimizeCountSql: json["optimizeCountSql"],
        searchCount: json["searchCount"],
        countId: json["countId"],
        maxLimit: json["maxLimit"],
        pages: json["pages"],
    );

    Map<String, dynamic> toJson() => {
        "records": List<dynamic>.from(records.map((x) => x.toJson())),
        "total": total,
        "size": size,
        "current": current,
        "orders": List<dynamic>.from(orders.map((x) => x)),
        "optimizeCountSql": optimizeCountSql,
        "searchCount": searchCount,
        "countId": countId,
        "maxLimit": maxLimit,
        "pages": pages,
    };
}

class OffersperItem {
    OffersperItem({
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

    factory OffersperItem.fromJson(Map<String, dynamic> json) => OffersperItem(
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
