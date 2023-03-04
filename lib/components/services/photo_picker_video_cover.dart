import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tast/components/config/config.dart';
import 'package:flutter_tast/components/utils/utils.dart';
import 'package:flutter_tast/components/widgets/Image_rect.dart';
import 'package:image_cropper/image_cropper.dart';
import 'dart:async';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import '../widgets/button.dart';

class MysHomePage extends StatefulWidget {
  const MysHomePage({Key? key}) : super(key: key);

  @override
  _MysHomePageState createState() => _MysHomePageState();
}

class _MysHomePageState extends State<MysHomePage> {
  File? imageFile;
  XFile? _pickedFile;
  CroppedFile? _croppedFile;
  String images = '';
  Map<String, dynamic>? userInfo;
  @override
  void initState() {
    super.initState();
  }

  upload() async {
    FormData formData = FormData.fromMap({
      "file":
          await MultipartFile.fromFile(_croppedFile!.path, filename: 'file.jpg')
    });
    var url = await Dio().post('${Config.domain}/images', data: formData);
    await Storage.setString("images", url.toString());
    Navigator.pop(context, {
      'images': url.toString(),
    });
  }

  @override
  Widget build(BuildContext context) {
    dynamic user = ModalRoute.of(context)?.settings.arguments;
    images = user["image"].toString();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: const Text("上传证件照"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(2),
            child: AspectRatio(
              //防止服务器返回的图片大小不一致导致高度不一致问题
              aspectRatio: 1 / 1,
              child: _croppedFile != null
                  ? Image.file(File(_croppedFile!.path))
                  : SizedBox(
                      height: 300,
                      width: 300,
                      child: ImageRect(
                        value: images,
                        fit: BoxFit.fill,
                      )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 5, right: 5),
            child: btnFlatButtonWidget(
              borderRadius: const BorderRadius.all(
                Radius.circular(8),
              ),
              width: double.infinity,
              onPressed: () async {
                _uploadImage();
              },
              gbColor: const Color.fromARGB(255, 89, 125, 226),
              title: "从相册选择图片",
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 5, right: 5),
            child: btnFlatButtonWidget(
              borderRadius: const BorderRadius.all(
                Radius.circular(8),
              ),
              width: double.infinity,
              onPressed: () async {
                await upload();
              },
              gbColor: const Color.fromARGB(255, 95, 150, 119),
              title: "上传图片",
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _pickImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    imageFile = pickedImage != null ? File(pickedImage.path) : null;
    if (imageFile != null) {}
  }

  Future<void> _uploadImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _pickedFile = pickedFile;
        _cropImage();
      });
    }
  }

  Future<void> _cropImage() async {
    if (_pickedFile != null) {
      final croppedFile = await ImageCropper().cropImage(
        sourcePath: _pickedFile!.path,
        compressFormat: ImageCompressFormat.jpg,
        compressQuality: 100,
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: '剪裁',
              toolbarColor: Colors.black,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          IOSUiSettings(
            title: 'Cropper',
          ),
          WebUiSettings(
            context: context,
            presentStyle: CropperPresentStyle.dialog,
            boundary: const CroppieBoundary(
              width: 520,
              height: 520,
            ),
            viewPort:
                const CroppieViewPort(width: 480, height: 480, type: 'circle'),
            enableExif: true,
            enableZoom: true,
            showZoomer: true,
          ),
        ],
      );
      if (croppedFile != null) {
        setState(() {
          _croppedFile = croppedFile;
        });
      }
    }
  }
}
