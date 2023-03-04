class ResumeModel {
  late int? code;
  late String? msg;
  late Data? data;

  ResumeModel({this.code, this.msg, this.data});

  ResumeModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['msg'] = msg;
    if (this.data != null) {
      data['data'] = this.data?.toJson();
    }
    return data;
  }
}

class Data {
  List<Categories>? categories;
  List<Phones>? phones;

  Data({this.categories, this.phones});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories?.add(Categories.fromJson(v));
      });
    }
    if (json['phones'] != null) {
      phones = <Phones>[];
      json['phones'].forEach((v) {
        phones?.add(Phones.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (categories != null) {
      data['categories'] = categories?.map((v) => v.toJson()).toList();
    }
    if (phones != null) {
      data['phones'] = phones?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Categories {
  String? name;
  int? type;

  Categories({this.name, this.type});

  Categories.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['type'] = type;
    return data;
  }
}

class Phones {
  List<Tag>? tag;
  int? id;
  String? title;
  String? price;
  String? desc;
 String? thumb;

  Phones({this.tag, this.id, this.title, this.price, this.desc,this.thumb});

  Phones.fromJson(Map<String, dynamic> json) {
    if (json['tag'] != null) {
      tag = <Tag>[];
      json['tag'].forEach((v) {
        tag?.add(Tag.fromJson(v));
      });
    }
    id = json['id'];
    title = json['title'];
    price = json['price'];
    desc = json['desc'];
    thumb = json['thumb'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (tag != null) {
      data['tag'] = tag?.map((v) => v.toJson()).toList();
    }
    data['id'] = id;
    data['title'] = title;
    data['price'] = price;
    data['desc'] = desc;
    data['thumb'] = thumb;
    return data;
  }
}

class Tag {
  String? name;

  Tag({this.name});

  Tag.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    return data;
  }
}