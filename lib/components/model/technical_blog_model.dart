// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

TechnicalBlogModel technicalBlogFromJson(String str) => TechnicalBlogModel.fromJson(json.decode(str));

String technicalBlogToJson(TechnicalBlogModel data) => json.encode(data.toJson());

class TechnicalBlogModel {
    TechnicalBlogModel({
        required this.code,
        required this.msg,
        required this.data,
    });

    int code;
    String msg;
    BlogModel data;

    factory TechnicalBlogModel.fromJson(Map<String, dynamic> json) => TechnicalBlogModel(
        code: json["code"],
        msg: json["msg"],
        data: BlogModel.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "msg": msg,
        "data": data.toJson(),
    };
}

class BlogModel {
    BlogModel({
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

    List<Blog> records;
    int total;
    int size;
    int current;
    List<dynamic> orders;
    bool optimizeCountSql;
    bool searchCount;
    dynamic countId;
    dynamic maxLimit;
    int pages;

    factory BlogModel.fromJson(Map<String, dynamic> json) => BlogModel(
        records: List<Blog>.from(json["records"].map((x) => Blog.fromJson(x))),
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

class Blog {
    Blog({
        this.id,
        this.userId,
        this.typeId,
        this.userImage,
        this.pressName,
        this.pressImage,
        this.pressTitle,
        this.pressText,
        this.pressTime,
    });

    int? id;
    int? userId;
    int? typeId;
    String? userImage;
    String? pressName;
    String? pressImage;
    String? pressTitle;
    String? pressText;
    DateTime? pressTime;

    factory Blog.fromJson(Map<String, dynamic> json) => Blog(
        id: json["id"],
        userId: json["user_id"],
        typeId: json["type_id"],
        userImage: json["user_image"],
        pressName: json["press_name"],
        pressImage: json["press_image"],
        pressTitle: json["press_title"],
        pressText: json["press_text"],
        pressTime: DateTime.parse(json["press_time"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "type_id": typeId,
        "user_image": userImage,
        "press_name": pressName,
        "press_image": pressImage,
        "press_title": pressTitle,
        "press_text": pressText,
        "press_time": pressTime!.toIso8601String(),
    };
}
