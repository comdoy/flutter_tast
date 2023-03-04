class WallpaperModels {
  int? code;
  String? msg;
  WallpaperModel? data;

  WallpaperModels({this.code, this.msg, this.data});

  WallpaperModels.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    data = json['data'] != null ? WallpaperModel.fromJson(json['data']) : null;
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

class WallpaperModel {
  int? id;
  int? userId;
  String? images;

  WallpaperModel({this.id, this.userId, this.images});

  WallpaperModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    images = json['images'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['images'] = images;
    return data;
  }
}