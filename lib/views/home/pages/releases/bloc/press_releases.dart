import 'package:dio/dio.dart';
import 'package:flutter_tast/components/config/config.dart';
import 'package:flutter_tast/components/utils/utils.dart';
import 'package:flutter_tast/components/widgets/provider_model.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PressReleasesBloc extends ProviderModel {
  void postReleases(
    String? pressid,
    String? pressText,
    String? pressImage,
    String? pressTitle,
    String? dateTimes,
  ) async{
    loadingg(true);
    var userInfo = await UserServices.getUserInfo();
    var api = "${Config.domain}/press";
    var response = await Dio().post(api, data: {
      "user_id": userInfo["id"],
      "type_id": pressid,
      "user_image": userInfo["images"],
      "press_name": userInfo["nickname"],
      "press_image": pressImage,
      "press_title": pressTitle,
      "press_text": pressText,
      "press_time": dateTimes,
    });
    if (response.data["code"] == '0') {
    } else {
      Fluttertoast.showToast(
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          msg: "${response.data['msg']}");
    }
    loadingg(false);
  }
}
