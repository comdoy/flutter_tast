import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tast/components/config/config.dart';
import 'package:flutter_tast/components/model/model.dart';
import 'package:flutter_tast/components/services/services.dart';
import 'package:flutter_tast/components/utils/utils.dart';
import 'package:flutter_tast/components/widgets/Image_rect.dart';
import 'package:fluttertoast/fluttertoast.dart';

class EditImage extends StatefulWidget {
  const EditImage({Key? key}) : super(key: key);

  @override
  State<EditImage> createState() => _EditImageState();
}

class _EditImageState extends State<EditImage> {
  @override
  void initState() {
    super.initState();
    localImage();
  }

  String images = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      height: double.infinity,
      child: NetworkImageCell(
        value: images,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 89, 125, 226),
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                child: InkWell(
                    onTap: () async {
                      var res = await Navigator.pushNamed(context, '/myshome',
                          arguments: {"image": images});
                      if (res is Map) {
                        images = res['images'];
                        setState(() {});
                      }
                    },
                    child: const Text(
                      "选择壁纸",
                      style: TextStyle(color: Colors.white),
                    )),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 95, 150, 119),
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                child: InkWell(
                    onTap: submit,
                    child: const Text(
                      "应用壁纸",
                      style: TextStyle(color: Colors.white),
                    )),
              ),
            ],
          ),
        ),
      ),
    ));
  }

  void localImage() async {
    var userInfo = await UserServices.getUserInfo();
    var api = "${Config.domain}/wallpaper";
    var response = await Dio().post(api, data: {"user_id": userInfo["id"]});
    if (response.data["code"] == '0') {
      var wallpaperModels = WallpaperModels.fromJson(response.data);
      images = wallpaperModels.data?.images ?? '';
      setState(() {
        images = images;
      });
    } else {
      Fluttertoast.showToast(
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          msg: "${response.data['msg']}");
    }
  }

  submit() async {
    var userInfo = await UserServices.getUserInfo();
    var api = "${Config.domain}/wallpaper";
    var responsea = await Dio().post(api, data: {"user_id": userInfo["id"]});
    if (responsea.data["code"] == '0') {
      var response = await Dio()
          .put(api, data: {"user_id": userInfo["id"], "images": images});
      if (response.data["code"] == '0') {
        Navigator.pop(context, true);
      } else {
        Fluttertoast.showToast(
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            msg: "${response.data['msg']}");
      }
    } else {
      var api = "${Config.domain}/wallpaper/add_wall";
      var responseb = await Dio()
          .post(api, data: {"user_id": userInfo["id"], "images": images});
      if (responseb.data["code"] == '0') {
        Navigator.pop(context, true);
      } else {
        Fluttertoast.showToast(
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            msg: "${responseb.data['msg']}");
      }
    }
  }
}
