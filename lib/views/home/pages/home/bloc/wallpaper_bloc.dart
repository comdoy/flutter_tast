import 'package:dio/dio.dart';
import 'package:flutter_tast/components/config/config.dart';
import 'package:flutter_tast/components/model/model.dart';
import 'package:flutter_tast/components/utils/utils.dart';
import 'package:flutter_tast/components/widgets/provider_model.dart';

class WallpaperBloc extends ProviderModel {
  WallpaperModel? wallpaperModel;
  Future<WallpaperModel?> getImage() async {
    loadingg(true);
    var userInfo = await UserServices.getUserInfo();
    var api = "${Config.domain}/wallpaper";
    var response = await Dio().post(api, data: {"user_id": userInfo["id"]});
    var wallpaperModels = WallpaperModels.fromJson(response.data);
    wallpaperModel = wallpaperModels.data;
    loadingg(false);
    return wallpaperModel;
  }
}
