// ignore_for_file: unnecessary_const, non_constant_identifier_names

import 'package:auto_size_text/auto_size_text.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tast/components/config/config.dart';
import 'package:flutter_tast/components/utils/utilities.dart';
import 'package:flutter_tast/components/widgets/widgets.dart';
import 'package:flutter_tast/components/model/post_press_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

extension _FixAutoLines on String {
  String fixAutoLines() {
    return Characters(this).join('\u{200B}');
  }
}

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key, this.searchid}) : super(key: key);
  final String? searchid;

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String _presstitle = '';
  String _pressTime = '';
  String _pressImage = '';
  String _userImage = '';
  String _pressName = '';
  String _pressText = '';

  Map<String, dynamic>? userInfo;

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    _getjobModelitme();
    //监听登录页面改变的事件
  }

  Dio dio = Dio();
  _getjobModelitme() async {
    var api = '${Config.domain}/press/press_type';
    var repse = await dio.post(api, data: {"id": widget.searchid});
    var pressModel = PostPressModel.fromJson(repse.data);
    setState(() {
      _presstitle = pressModel.data.pressTitle ?? '';
      _pressTime = pressModel.data.pressTime.toString();
      _pressImage = pressModel.data.pressImage ?? '';
      _userImage = pressModel.data.userImage ?? '';
      _pressName = pressModel.data.pressName ?? '';
      _pressText = pressModel.data.pressText ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: const Text("新闻详情"),
        actions: [
          IconButton(
            icon: const Icon(Icons.admin_panel_settings_outlined),
            onPressed: () {},
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          children: [
            Text(
              _presstitle,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        SizedBox(
                          width: 35,
                          height: 35,
                          child: ImageRect(
                            value: _userImage,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(20.0),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            _pressName,
                            style: const TextStyle(fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(IDateUtils.remindTime(_pressTime) ?? '-'),
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 350,
              child: ImagesNetwork(
                value: _pressImage,
                fit: BoxFit.fitWidth,
                and: false,
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 50),
                child: Shimmer.fromColors(
                    baseColor: Colors.red,
                    highlightColor: Colors.yellow,
                    child: Text(
                      _pressText.fixAutoLines(),
                      style: GoogleFonts.acme(fontStyle: FontStyle.italic),
                    ))

                //  AutoSizeText(_pressText.fixAutoLines(),maxLines: 20,),
                ),
          ],
        ),
      ),
    );
  }
}
