import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tast/components/config/config.dart';
import 'package:flutter_tast/components/services/job_user_info.dart';
import 'package:flutter_tast/components/widgets/widgets.dart';
import 'package:flutter_tast/router/applaction.dart';
import 'package:flutter_tast/components/model/job_offers_model.dart';
import 'package:flutter_tast/components/model/technical_blog_model.dart';
import 'package:flutter_tast/views/home/pages/home/components/job_offers_cell.dart';
import 'package:flutter_tast/views/home/pages/job_user/bloc/jod_user_info.dart';
import 'package:flutter_tast/views/home/pages/job_user/components/function_cell.dart';
import 'package:flutter_tast/views/home/pages/job_user/components/job_user_info_cell.dart';
import 'package:provider/provider.dart';

import '../../home/bloc/job_offers_bloc.dart';

double height = 80;

class JobUserPage extends StatelessWidget {
  const JobUserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Image.asset('assets/images/c.png'),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Application.router.navigateTo(context, '/job_install');
                },
                icon: const Icon(Icons.settings))
          ],
          elevation: 0,
          centerTitle: true,
          title: const Text("招聘者用户中心")),
      body: ColoredBox(
        color: const Color.fromARGB(255, 220, 220, 220),
        child: ListView(children: [
          ProviderWidget<JobUserInfoBloc>(
              onReady: (p0) => p0.getJobUser(),
              model: JobUserInfoBloc(Provider.of(context)),
              builder: (context, model, child) {
                return JobUserInfoCell(
                  itme: model.jobUserModel,
                  userOnTap: () {
                    Application.router
                        .navigateTo(context, '/job_basic_info')
                        .then((value) => value ? (model).getJobUser() : '');
                  },
                  loginOnTap: () {
                    Application.router.navigateTo(context, '/role_choice');
                  },
                  onPressed: () {
                    Application.router.navigateTo(context, '/jobOffers');
                  },
                  lodingOnTap: () {
                    context.read<JobUserInfoBloc>().getJobUser();
                  },
                );
              }),
          ProviderWidget<JobOffersBloc>(
              onReady: (e) => e.getOffers(),
              model: JobOffersBloc(),
              builder: (context, model, child) {
                model.jobOffersList?.length = 4;
                return model.loading == true
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Container(
                        height: 305,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: ListView.builder(
                          itemCount: model.jobOffersList?.length,
                          itemBuilder: (context, index) => JobOffersCell(
                            model: model.jobOffersList?[index],
                            andtwo: false,
                            onTap: () {
                              Application.router.navigateTo(context,
                                  '/jobdetailed?id=${model.jobOffersList?[index].id}');
                            },
                          ),
                        ));
              }),
          const FunctionCell()
        ]),
      ),
    );
  }
}

class JobUserPages extends StatefulWidget {
  const JobUserPages({Key? key}) : super(key: key);

  @override
  State<JobUserPages> createState() => _JobUserPageState();
}

class _JobUserPageState extends State<JobUserPages> {
  bool isLogin = false;
  Map<String, dynamic>? userInfo;
  List<OffersperItem> _offersList = [];
  List<Blog> _pressList = [];
  String images =
      'https://pic4.zhimg.com/50/v2-6afa72220d29f045c15217aa6b275808_hd.jpg?source=1940ef5c';
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    _getUserinfo();
    _getjoboffers();
    _getIndustry();
    //监听登录页面改变的事件
  }

  _getUserinfo() async {
    var isLogin = await JobUserServices.getUserLoginState();
    var userInfo = await JobUserServices.getJobUserInfo();
    setState(() {
      this.userInfo = userInfo;
      this.isLogin = isLogin;
      if (userInfo["recruiter_image"] != null) {
        images = userInfo["recruiter_image"].toString();
      } else {
        images =
            "https://pic4.zhimg.com/50/v2-6afa72220d29f045c15217aa6b275808_hd.jpg?source=1940ef5c";
      }
    });
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
  _getjoboffers() async {
    var api = '${Config.domain}/job_offers';
    var response = await dio.get(api);

    var carouseModel = JobOffersModel.fromJson(response.data);
    // carouseModel.data.records.length = 4;
    List<OffersperItem> offersList = carouseModel.data.records;
    setState(() {
      _offersList = offersList;
    });
  }

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

  Widget informationRelease(
    BuildContext context, {
    required void Function() onTap,
    String? jobtitle,
    String? jobsalary,
    String? jobboon,
    String? jobtime,
    String? jobroute,
    String? jobcity,
    String? jobdeadline,
    String? jobpeople,
    String? jobposition,
    String? jobimage,
    String? jobcompany,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: glassWidgetinfo(
        380,
        142,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(
                top: 10,
              ),
              child: Flex(
                direction: Axis.horizontal,
                children: <Widget>[
                  Expanded(
                    flex: 5,
                    child: Text(
                      jobtitle ?? '-',
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      jobsalary ?? '-',
                      style: TextStyle(color: Colors.cyan[200]),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                top: 10,
              ),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        height: 22,
                        margin: const EdgeInsets.only(right: 10),
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        decoration: BoxDecoration(
                          color: Colors.cyan[50],
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(jobboon ?? '-'),
                      ),
                      Container(
                        height: 22,
                        margin: const EdgeInsets.only(right: 10),
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        decoration: BoxDecoration(
                          color: Colors.cyan[50],
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(jobtime ?? '-'),
                      ),
                      Container(
                        height: 22,
                        margin: const EdgeInsets.only(right: 10),
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        decoration: BoxDecoration(
                          color: Colors.cyan[50],
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(jobroute ?? '-'),
                      ),
                      Container(
                        height: 22,
                        margin: const EdgeInsets.only(right: 10),
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        decoration: BoxDecoration(
                          color: Colors.cyan[50],
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(jobdeadline ?? '-'),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 22,
                        margin: const EdgeInsets.only(right: 10),
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        decoration: BoxDecoration(
                          color: Colors.cyan[50],
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(jobcity ?? '-'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(
                    child: Row(
                      children: [
                        SizedBox(
                          width: 25,
                          height: 25,
                          child: ClipRRect(
                            child: Image.network(
                                '${Config.domain}/${jobimage ?? '-'}'),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        Text(
                          " $jobpeople .$jobposition",
                          style: const TextStyle(fontSize: 14),
                        )
                      ],
                    ),
                  ),
                  Text(
                    jobcompany ?? '-',
                    style: TextStyle(color: Colors.cyan[200]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _informationRelease() {
    return Container(
        height: 305,
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: _offersList.length,
          itemBuilder: (context, index) => informationRelease(context,
              onTap: () {
            Application.router.navigateTo(
                context, '/jobdetailed?id=${_offersList[index].id}');
          },
              jobtitle: _offersList[index].jobtitle,
              jobsalary: _offersList[index].jobsalary,
              jobboon: _offersList[index].jobboon,
              jobtime: _offersList[index].jobtime,
              jobroute: _offersList[index].jobroute,
              jobdeadline: _offersList[index].jobdeadline,
              jobcity: _offersList[index].jobcity,
              jobimage: _offersList[index].jobimage,
              jobpeople: _offersList[index].jobpeople,
              jobposition: _offersList[index].jobposition,
              jobcompany: _offersList[index].jobcompany),
        ));
  }

  Widget _industryNew() {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 600,
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
                  _pressList[index].pressTitle!.length > 19 ? 302 : 280,
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
                          maxLines: 2,
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

  double height = 80;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Image.asset('assets/images/c.png'),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Application.router.navigateTo(context, '/job_install');
                },
                icon: const Icon(Icons.settings))
          ],
          elevation: 0,
          centerTitle: true,
          title: const Text("招聘者用户中心")),
      body: Container(
        color: const Color.fromARGB(255, 241, 240, 240),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: glassWidgetinfo(
                380,
                100,
                Row(
                  children: <Widget>[
                    Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: InkWell(
                          onTap: () {
                            Application.router
                                .navigateTo(context, '/job_basic_info')
                                .then((value) => value ? _getUserinfo() : '');
                          },
                          child: SizedBox(
                            child: ClipRRect(
                              child: Image.network('${Config.domain}/$images'),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(8.0),
                              ),
                            ),
                            width: 60,
                            height: 60,
                          ),
                        )),
                    !isLogin
                        ? Expanded(
                            flex: 1,
                            child: InkWell(
                              child: const Text("登录/注册",
                                  style: TextStyle(color: Colors.black)),
                              onTap: () {
                                Application.router
                                    .navigateTo(context, '/role_choice');
                              },
                            ))
                        : Expanded(
                            flex: 1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text("姓名：${userInfo?["recruiter_name"]}",
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 18)),
                                Text("账号：${userInfo?["recruiter_account"]}",
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 18)),
                              ],
                            ),
                          ),
                    IconButton(
                      onPressed: () {
                        Application.router.navigateTo(context, '/userinfo');
                      },
                      icon: const Icon(
                        Icons.search_sharp,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            _informationRelease(),
            Padding(
              padding: const EdgeInsets.only(
                  left: 10, right: 10, top: 10, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: height,
                    width: height,
                    child: TextButton(
                        style: ButtonStyle(
                          overlayColor: MaterialStateProperty.all(
                              const Color.fromARGB(255, 175, 231, 239)),
                          //设置边框
                          side: MaterialStateProperty.all(
                              const BorderSide(color: Colors.grey, width: 0.5)),
                        ),
                        onPressed: () {
                          Application.router.navigateTo(context, '/job_manage');
                        },
                        child: Column(
                          children: const [
                            SizedBox(
                              height: 5,
                            ),
                            Icon(
                              Icons.folder_shared,
                              color: Colors.black,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "招聘管理",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ],
                        )),
                  ),
                  SizedBox(
                    height: height,
                    width: height,
                    child: TextButton(
                        style: ButtonStyle(
                          overlayColor: MaterialStateProperty.all(
                              const Color.fromARGB(255, 175, 231, 239)),
                          //设置边框
                          side: MaterialStateProperty.all(
                              const BorderSide(color: Colors.grey, width: 0.5)),
                        ),
                        onPressed: () {
                          Application.router.navigateTo(context, '/userinfo');
                        },
                        child: Column(
                          children: const [
                            SizedBox(
                              height: 5,
                            ),
                            Icon(
                              Icons.location_city,
                              color: Colors.black,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "求职申请",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ],
                        )),
                  ),
                  SizedBox(
                    height: height,
                    width: height,
                    child: TextButton(
                        style: ButtonStyle(
                          overlayColor: MaterialStateProperty.all(
                              const Color.fromARGB(255, 175, 231, 239)),
                          //设置边框
                          side: MaterialStateProperty.all(
                              const BorderSide(color: Colors.grey, width: 0.5)),
                        ),
                        onPressed: () {
                          Application.router.navigateTo(context, '/job_new');
                        },
                        child: Column(
                          children: const [
                            SizedBox(
                              height: 5,
                            ),
                            Icon(
                              Icons.local_library,
                              color: Colors.black,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "新闻管理",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ],
                        )),
                  ),
                  SizedBox(
                    height: height,
                    width: height,
                    child: TextButton(
                        style: ButtonStyle(
                          overlayColor: MaterialStateProperty.all(
                              const Color.fromARGB(255, 175, 231, 239)),
                          //设置边框
                          side: MaterialStateProperty.all(
                              const BorderSide(color: Colors.grey, width: 0.5)),
                        ),
                        onPressed: () {
                          Application.router
                              .navigateTo(context, '/job_basic_info');
                        },
                        child: Column(
                          children: const [
                            SizedBox(
                              height: 5,
                            ),
                            Icon(
                              Icons.account_circle,
                              color: Colors.black,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "基本信息",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ],
                        )),
                  ),
                ],
              ),
            ),
            _industryNew(),
          ],
        ),
      ),
    );
  }
}
