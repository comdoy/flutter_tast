import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tast/components/config/config.dart';
import 'package:flutter_tast/components/widgets/widgets.dart';
import 'package:flutter_tast/router/applaction.dart';
import 'package:flutter_tast/components/model/technical_blog_model.dart';

class JobNew extends StatefulWidget {
  const JobNew({Key? key}) : super(key: key);

  @override
  State<JobNew> createState() => _JobNewState();
}

class _JobNewState extends State<JobNew> {
  List<Blog> _pressList = [];
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    _getIndustry();
  }


  _getIndustry() async {
    var api = "${Config.domain}/press";
    var response = await dio.get(api);
    var pressModel = TechnicalBlogModel.fromJson(response.data);
    List<Blog> pressList = pressModel.data.records;
    setState(() {
      _pressList = pressList;
    });
  }

  var dio = Dio();


  Widget glassWidgetinfo(double width, double height, Widget? child) {
    return GlassWidget(
      width: width,
      height: height,
      borderRadius: 5,
      blur: 14,
      linearGradientBeginOpacity: 0.5,
      linearGradientEndOpacity: 0.2,
      borderGradientBeginOpacity: 0.5,
      borderGradientEndOpacity: 0.02,
      child: child,
    );
  }


  Widget _industryNew() {
    return Container(
      padding: const EdgeInsets.all(10),
      child: ListView.builder(
          itemCount: _pressList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: InkWell(
                onTap: () {
                  Application.router.navigateTo(
                      context, '/search?id=${_pressList[index].id}');
                },
                child: glassWidgetinfo(
                  380,
                  280,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 40,
                                    height: 40,
                                    child: ClipRRect(
                                      child: Image.network(
                                          '${Config.domain}/${_pressList[index].userImage ?? '-'}'),
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(16.0),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(
                                      _pressList[index].pressName ?? '-',
                                      style: const TextStyle(fontSize: 15),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Text(_pressList[index].pressTime.toString()),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 160,
                        child: Image.network(
                         '${Config.domain}/${_pressList[index].pressImage ?? '-'}',
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, top: 15, bottom: 15),
                        child: Text(
                          _pressList[index].pressTitle ?? '-',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 18),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          actions: [IconButton(onPressed: () {}, icon: const Text("发布"))],
          title: const Text("新闻管理")),
      body: Container(
        color: const Color.fromARGB(255, 241, 240, 240),
        child: _industryNew(),
      ),
    );
  }
}
