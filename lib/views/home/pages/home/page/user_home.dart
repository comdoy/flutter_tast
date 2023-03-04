// ignore_for_file: non_constant_identifier_names, import_of_legacy_library_into_null_safe, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_tast/components/model/hot_product_model.dart';
import 'package:flutter_tast/components/utils/update_scope.dart';
import 'package:flutter_tast/components/widgets/widgets.dart';
import 'package:flutter_tast/views/home/pages/home/bloc/job_offers_bloc.dart';
import 'package:flutter_tast/views/home/pages/home/bloc/user_home_bloc.dart';
import 'package:flutter_tast/views/home/pages/home/bloc/wallpaper_bloc.dart';
import 'package:flutter_tast/views/home/pages/home/components/glass_widget_info.dart';
import 'package:flutter_tast/views/home/pages/home/components/job_offers_cell.dart';
import 'package:flutter_tast/views/home/pages/home/components/user_info_cell.dart';
import 'package:provider/provider.dart';
import 'package:flutter_tast/router/applaction.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _hotProductListWidget() {
      return Container(
        height: 150,
        padding: const EdgeInsets.all(15),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (contxt, index) {
            return Row(
              children: <Widget>[
                _hotProductListWidgets(context, index, () {
                  Application.router
                      .navigateTo(context, '/industry?id=${info[index].newid}');
                })
              ],
            );
          },
          itemCount: info.length,
        ),
      );
    }

    return Scaffold(
      body: ChangeNotifierProvider<UpdateScope>.value(
        value: UpdateScope(),
        child: Consumer<UpdateScope>(
          builder: (_, scope, __){
            return SizedBox(
              height: double.infinity,
              child: ProviderWidget<WallpaperBloc>(
                onReady: (model) => model.getImage(),
                model: WallpaperBloc(),
                builder: (context, model, child) {
                  return model.loading == true
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : NetworkImageCell(
                          value: model.wallpaperModel?.images,
                          child: ListView(
                            children: <Widget>[
                              ProviderWidget<UserHomeBloc>(
                                  onReady: (model) => model.getUser(),
                                  model: UserHomeBloc(Provider.of(context)),
                                  builder: ((context, model, child) {
                                    return model.loading == true
                                        ? const Center(
                                            child: CircularProgressIndicator(),
                                          )
                                        : UserInfoCell(
                                            itme: model.userModel,
                                            onTap: () {
                                              Application.router
                                                  .navigateTo(context, '/editresume')
                                                  .then((value) =>
                                                      value ? (model).getUser() : '');
                                            },
                                            onLoading: () => context
                                                .read<WallpaperBloc>()
                                                .getImage(),
                                          );
                                  })),
                              Inkewakbuttmo(children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: const <Widget>[
                                    Text(
                                      "  基本信息:",
                                    ),
                                    Icon(
                                      Icons.more_vert,
                                      color: Colors.black45,
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Inkewall(
                                      context,
                                      title: "简历",
                                      urlimage:
                                          'https://tenfei01.cfp.cn/creative/icon/512/VCG25i2248570.jpg',
                                      onTap: () {
                                        Application.router
                                            .navigateTo(context, '/resume');
                                        // Navigator.pushNamed(context, '/ing');
                                      },
                                    ),
                                    Inkewall(context,
                                        title: "证书",
                                        urlimage:
                                            'https://tenfei01.cfp.cn/creative/icon/512/VCG25i2248580.jpg',
                                        onTap: () {
                                      Application.router
                                          .navigateTo(context, '/certificate');
                                    }),
                                    Inkewall(context,
                                        title: "已投递",
                                        urlimage:
                                            'https://tenfei03.cfp.cn/creative/icon/512/VCG25i2248582.jpg',
                                        onTap: () {
                                      Application.router
                                          .navigateTo(context, "/delivered");
                                    }),
                                    Inkewall(context,
                                        title: "职业意向",
                                        urlimage:
                                            'https://tenfei02.cfp.cn/creative/icon/512/VCG25i2248571.jpg',
                                        onTap: () {
                                      Application.router
                                          .navigateTo(context, '/editoccupational');
                                    }),
                                    Inkewall(context,
                                        title: "新闻管理",
                                        urlimage:
                                            'https://tenfei01.cfp.cn/creative/icon/512/VCG25i2248570.jpg',
                                        onTap: () {
                                      Application.router
                                          .navigateTo(context, '/user_press');
                                    }),
                                    Inkewall(context,
                                        title: "设置",
                                        urlimage:
                                            'https://alifei04.cfp.cn/creative/icon/512/VCG25i2248558.jpg',
                                        onTap: () {
                                      Application.router
                                          .navigateTo(context, '/install');
                                    })
                                  ],
                                ),
                              ]),
                              // // _seiperWidget(),
                              ProviderWidget<JobOffersBloc>(
                                  onReady: (e) => e.getOffers(),
                                  model: JobOffersBloc(),
                                  builder: (context, model, child) {
                                    model.jobOffersList?.length = 4;
                                    return model.loading == true
                                        ? const Center(
                                            child: CircularProgressIndicator(),
                                          )
                                        :  Container(
                                        height: 314,
                                        padding: const EdgeInsets.all(15),
                                        child: ListView.builder(
                                          itemCount: model.jobOffersList?.length,
                                          itemBuilder: (context, index) =>
                                              JobOffersCell(
                                            model: model.jobOffersList?[index],
                                            // andtwo: true,
                                            onTap: () {
                                              Application.router.navigateTo(context,
                                                  '/jobdetailed?id=${model.jobOffersList?[index].id}');
                                            },
                                          ),
                                        ));
                                  }),

                              InkWell(
                                child: Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: GlassWidgetInfo(
                                    width: double.infinity,
                                    height: 35,
                                    child: TextButton(
                                        onPressed: () {
                                          Application.router
                                              .navigateTo(context, '/jobOffers');
                                        },
                                        child: const Text("查看更多招聘信息")),
                                  ),
                                ),
                              ),
                              _hotProductListWidget(),
                            ],
                          ),
                        );
                },
              ),
            );
          }
        ),
      ),
    );
  }

  Widget Inkewall(BuildContext context,
      {String? urlimage, String? title, String? value, Function()? onTap}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
            child: Column(
              children: <Widget>[
                SizedBox(
                  child: ClipRRect(
                    child: Image.network(urlimage ?? ''),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                  width: 50,
                  height: 50,
                ),
                Text(title ?? ''),
              ],
            ),
            onTap: onTap),
      ],
    );
  }

  Widget Inkewakbuttmo({required List<Widget> children}) {
    return Container(
        padding: const EdgeInsets.all(15),
        child: GlassWidgetInfo(
          width: double.infinity,
          height: 100,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, children: children),
        ));
  }

  Widget _hotProductListWidgets(
      BuildContext context, int indexs, void Function()? onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
          width: 86,
          margin: const EdgeInsets.only(right: 9),
          child: GlassWidgetInfo(
            width: 86,
            height: 130,
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                  width: 60,
                  height: 60,
                  child: ClipRRect(
                    child: Image.network(info[indexs].urlImage),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  info[indexs].endtitle,
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  info[indexs].title,
                  style: const TextStyle(fontSize: 12, color: Colors.white),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          )),
    );
  }
}










// class UserPage extends StatefulWidget {
//   const UserPage({Key? key}) : super(key: key);

//   @override
//   _UserPageState createState() => _UserPageState();
// }

// class _UserPageState extends State<UserPage> {
//   bool isLogin = false;
//   Map<String, dynamic>? userInfo;
//   List<Records> _carouselList = [];
//   List<Recorda> _offersList = [];
//   @override
//   void initState() {
//     // ignore: todo
//     // TODO: implement initState
//     super.initState();
//     _getUserinfo();
//     _getseiperinfo();
//     _getjoboffers();
//     //监听登录页面改变的事件
//     eventBus.on<UserEvent>().listen((event) {
//       print("11111");
//       print(event.str);
//     });
//   }

//   _getUserinfo() async {
//     var isLogin = await UserServices.getUserLoginState();
//     var userInfo = await UserServices.getUserInfo();
//     setState(() {
//       this.userInfo = userInfo;
//       this.isLogin = isLogin;
//       if (userInfo["images"] != null) {
//         images = userInfo["images"].toString();
//       } else {
//         images = '';
//       }
//     });
//   }

//   Dio dio = Dio();
//   _getseiperinfo() async {
//     var api = '${Config.domain}/carousel';
//     var response = await dio.get(api);
//     var carouseModel = carousel_model.fromJson(response.data);
//     List<Records> recordList = carouseModel.data!.records;

//     setState(() {
//       _carouselList = recordList;
//     });
//   }

//   _getjoboffers() async {
//     var api = '${Config.domain}/job_offers';
//     var response = await dio.get(api);

//     var carouseModel = JobOffersModel.fromJson(response.data);
//     carouseModel.data.records.length = 4;
//     List<Recorda> offersList = carouseModel.data.records;
//     setState(() {
//       _offersList = offersList;
//     });
//   }

//   String images = '';

//   String imagess =
//       'https://pic4.zhimg.com/50/v2-6afa72220d29f045c15217aa6b275808_hd.jpg?source=1940ef5c';
//   // Widget _seiperWidget() {
//   //   return Container(
//   //       padding: const EdgeInsets.all(10),
//   //       child: AspectRatio(
//   //         aspectRatio: 5 / 2,
//   //         child: Swiper(
//   //           itemBuilder: (BuildContext context, int index) {
//   //             Records urlimage = _carouselList[index];
//   //             return Container(
//   //               // 用Container实现图片圆角的效果
//   //               decoration: BoxDecoration(
//   //                 image: DecorationImage(
//   //                   image: NetworkImage(urlimage.images ?? ''
//   //                       // imgList[index].urlImage,
//   //                       ), // 图片数组
//   //                   fit: BoxFit.cover,
//   //                 ),
//   //                 borderRadius: const BorderRadius.all(
//   //                   Radius.circular(10.0),
//   //                 ),
//   //               ),
//   //             );
//   //           },
//   //           onTap: (index) {
//   //             print('点击了第$index');
//   //           }, // 点击事件 onTap
//   //           pagination: SwiperPagination(
//   //               // 分页指示器
//   //               alignment:
//   //                   Alignment.bottomCenter, // 位置 Alignment.bottomCenter 底部中间
//   //               margin: const EdgeInsets.fromLTRB(0, 0, 0, 5), // 距离调整
//   //               builder: DotSwiperPaginationBuilder(
//   //                 activeColor: Colors.cyan[200],
//   //                 color: Colors.white,
//   //                 size: 10.w,
//   //                 activeSize: 11.w,
//   //                 space: 20.w,
//   //               )),
//   //           viewportFraction: 1, // 当前视窗展示比例 小于1可见上一个和下一个视窗
//   //           itemCount: _carouselList.length,
//   //           autoplay: true,
//   //         ),
//   //       ));
//   // }

//   Widget _hotProductListWidgets(
//       BuildContext context, int indexs, void Function()? onTap) {
//     return InkWell(
//       onTap: onTap,
//       child: Container(
//           width: 163,
//           margin: const EdgeInsets.only(right: 10),
//           child: glassWidgetinfo(
//             163,
//             220,
//             Column(
//               children: <Widget>[
//                 SizedBox(
//                   height: 5,
//                 ),
//                 SizedBox(
//                   width: 60,
//                   height: 60,
//                   child: ClipRRect(
//                     child: Image.network(info[indexs].urlImage),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 5,
//                 ),
//                 Text(
//                   info[indexs].endtitle,
//                   style: const TextStyle(fontSize: 16, color: Colors.white),
//                   textAlign: TextAlign.center,
//                 ),
//                 SizedBox(
//                   height: 5,
//                 ),
//                 Text(
//                   info[indexs].title,
//                   style: const TextStyle(fontSize: 12, color: Colors.white),
//                   textAlign: TextAlign.center,
//                 )
//               ],
//             ),
//           )),
//     );
//   }

//   Widget _hotProductListWidget() {
//     return Container(
//       height: 340,
//       padding: EdgeInsets.all(20),
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         itemBuilder: (contxt, index) {
//           return Row(
//             children: <Widget>[
//               _hotProductListWidgets(context, index, () {
//                 Application.router
//                     .navigateTo(context, '/industry?id=${info[index].newid}');
//               })
//             ],
//           );
//         },
//         itemCount: info.length,
//       ),
//     );
//   }

//   Widget InformationRelease(
//     BuildContext context, {
//     required void Function() onTap,
//     String? jobtitle,
//     String? jobsalary,
//     String? jobboon,
//     String? jobtime,
//     String? jobroute,
//     String? jobcity,
//     String? jobdeadline,
//     String? jobpeople,
//     String? jobposition,
//     String? jobimage,
//     String? jobcompany,
//   }) {
//     return GestureDetector(
//       onTap: onTap,
//       child: glassWidgetinfo(
//         380,
//         142,
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               padding: const EdgeInsets.only(
//                 top: 10,
//               ),
//               child: Flex(
//                 direction: Axis.horizontal,
//                 children: <Widget>[
//                   Expanded(
//                     flex: 5,
//                     child: Text(
//                       jobtitle ?? '-',
//                       style: const TextStyle(
//                           fontSize: 16, fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                   Expanded(
//                     flex: 1,
//                     child: Text(
//                       jobsalary ?? '-',
//                       style: TextStyle(color: Colors.cyan[200]),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Container(
//               padding: const EdgeInsets.only(
//                 top: 10,
//               ),
//               child: Column(
//                 children: <Widget>[
//                   Row(
//                     children: <Widget>[
//                       Container(
//                         height: 36,
//                         margin: const EdgeInsets.only(right: 10),
//                         padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
//                         decoration: BoxDecoration(
//                           color: Colors.cyan[50],
//                           borderRadius: BorderRadius.circular(5),
//                         ),
//                         child: Text(jobboon ?? '-'),
//                       ),
//                       Container(
//                         height: 36,
//                         margin: const EdgeInsets.only(right: 10),
//                         padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
//                         decoration: BoxDecoration(
//                           color: Colors.cyan[50],
//                           borderRadius: BorderRadius.circular(5),
//                         ),
//                         child: Text(jobtime ?? '-'),
//                       ),
//                       Container(
//                         height: 36,
//                         margin: const EdgeInsets.only(right: 10),
//                         padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
//                         decoration: BoxDecoration(
//                           color: Colors.cyan[50],
//                           borderRadius: BorderRadius.circular(5),
//                         ),
//                         child: Text(jobroute ?? '-'),
//                       ),
//                       Container(
//                         height: 36,
//                         margin: const EdgeInsets.only(right: 10),
//                         padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
//                         decoration: BoxDecoration(
//                           color: Colors.cyan[50],
//                           borderRadius: BorderRadius.circular(5),
//                         ),
//                         child: Text(jobdeadline ?? '-'),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   Row(
//                     children: [
//                       Container(
//                         height: 36,
//                         margin: const EdgeInsets.only(right: 10),
//                         padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
//                         decoration: BoxDecoration(
//                           color: Colors.cyan[50],
//                           borderRadius: BorderRadius.circular(5),
//                         ),
//                         child: Text(jobcity ?? '-'),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top: 10, bottom: 10),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: <Widget>[
//                   SizedBox(
//                     child: Row(
//                       children: [
//                         SizedBox(
//                           width: 25,
//                           height: 25,
//                           child: ClipRRect(
//                             child: Image.network(
//                                 '${Config.domain}/${jobimage ?? '-'}'),
//                             borderRadius: BorderRadius.circular(8),
//                           ),
//                         ),
//                         Text(
//                           " $jobpeople .$jobposition",
//                           style: const TextStyle(fontSize: 14),
//                         )
//                       ],
//                     ),
//                   ),
//                   Text(
//                     jobcompany ?? '-',
//                     style: TextStyle(color: Colors.cyan[200]),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _InformationRelease() {
//     return Container(
//         height: 305,
//         padding: const EdgeInsets.all(10),
//         child: ListView.builder(
//           itemCount: _offersList.length,
//           itemBuilder: (context, index) => InformationRelease(context,
//               onTap: () {
//             Application.router.navigateTo(
//                 context, '/jobdetailed?id=${_offersList[index].id}');
//           },
//               jobtitle: _offersList[index].jobtitle,
//               jobsalary: _offersList[index].jobsalary,
//               jobboon: _offersList[index].jobboon,
//               jobtime: _offersList[index].jobtime,
//               jobroute: _offersList[index].jobroute,
//               jobdeadline: _offersList[index].jobdeadline,
//               jobcity: _offersList[index].jobcity,
//               jobimage: _offersList[index].jobimage,
//               jobpeople: _offersList[index].jobpeople,
//               jobposition: _offersList[index].jobposition,
//               jobcompany: _offersList[index].jobcompany),
//         ));
//   }

//   Widget Inkewall(BuildContext context,
//       {String? urlimage, String? title, String? value, Function()? onTap}) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         InkWell(
//             child: Column(
//               children: <Widget>[
//                 SizedBox(
//                   child: ClipRRect(
//                     child: Image.network(urlimage ?? ''),
//                     borderRadius: const BorderRadius.all(
//                       Radius.circular(10.0),
//                     ),
//                   ),
//                   width: 90,
//                   height: 90,
//                 ),
//                 Text(title ?? ''),
//               ],
//             ),
//             onTap: onTap),
//       ],
//     );
//   }

//   Widget Inkewakbuttmo({required List<Widget> children}) {
//     return Container(
//         height: 130,
//         padding: const EdgeInsets.all(10),
//         child: glassWidgetinfo(
//           380,
//           130,
//           Column(
//               crossAxisAlignment: CrossAxisAlignment.start, children: children),
//         ));
//   }

//   Widget glassWidgetinfo(double width, double height, Widget? child) {
//     return GlassWidget(
//       width: width,
//       height: height,
//       borderRadius: 5,
//       blur: 14,
//       linearGradientBeginOpacity: 0.3,
//       linearGradientEndOpacity: 0.2,
//       borderGradientBeginOpacity: 0.5,
//       borderGradientEndOpacity: 0.02,
//       child: child,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {

//     return Scaffold(
//       body: Container(
//         decoration: const BoxDecoration(
//             //背景图
//             image: DecorationImage(
//           image: AssetImage('assets/images/a.jpg'),
//           fit: BoxFit.cover,
//         )),
//         child: ListView(
//           children: <Widget>[
//             Padding(
//               padding: const EdgeInsets.all(10.0),
//               child: glassWidgetinfo(
//                 380,
//                 100,
//                 Row(
//                   children: <Widget>[
//                     Padding(
//                         padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
//                         child: InkWell(
//                           onTap: () {
//                             Application.router
//                                 .navigateTo(context, '/editresume')
//                                 .then((value) => value ? _getUserinfo() : '');
//                           },
//                           child: SizedBox(
//                             child: ImageRect(
//                               value: images,
//                             ),
//                             // ClipRRect(
//                             //   child: Image.network('${Config.domain}/$images'),
//                             //   borderRadius: BorderRadius.all(
//                             //     Radius.circular(8.0),
//                             //   ),
//                             // ),
//                             width: 98,
//                             height: 90,
//                           ),
//                         )),
//                     !isLogin
//                         ? Expanded(
//                             flex: 1,
//                             child: InkWell(
//                               child: const Text("登录/注册",
//                                   style: TextStyle(color: Colors.white)),
//                               onTap: () {
//                                 Application.router
//                                     .navigateTo(context, '/role_choice');
//                               },
//                             ))
//                         : Expanded(
//                             flex: 1,
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: <Widget>[
//                                 Text("姓名：${userInfo?["nickname"]}",
//                                     style: TextStyle(
//                                         color: Colors.white, fontSize: 32)),
//                                 Text("账号：${userInfo?["username"]}",
//                                     style: TextStyle(
//                                         color: Colors.white, fontSize: 32)),
//                               ],
//                             ),
//                           ),
//                     IconButton(
//                       onPressed: () {
//                         Application.router.navigateTo(context, '/userinfo');
//                       },
//                       icon: const Icon(
//                         Icons.search_sharp,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Inkewakbuttmo(children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: const <Widget>[
//                   Text(
//                     "  基本信息:",
//                   ),
//                   Icon(
//                     Icons.more_vert,
//                     color: Colors.black45,
//                   ),
//                 ],
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   Inkewall(
//                     context,
//                     title: "简历",
//                     urlimage:
//                         'https://tenfei01.cfp.cn/creative/icon/512/VCG25i2248570.jpg',
//                     onTap: () {
//                       Application.router.navigateTo(context, '/resume');
//                       // Navigator.pushNamed(context, '/ing');
//                     },
//                   ),
//                   Inkewall(context,
//                       title: "证书",
//                       urlimage:
//                           'https://tenfei01.cfp.cn/creative/icon/512/VCG25i2248580.jpg',
//                       onTap: () {
//                     Application.router.navigateTo(context, '/certificate');
//                   }),
//                   Inkewall(context,
//                       title: "已投递",
//                       urlimage:
//                           'https://tenfei03.cfp.cn/creative/icon/512/VCG25i2248582.jpg',
//                       onTap: () {
//                     Application.router.navigateTo(context, "/delivered");

//                   }),
//                   Inkewall(context,
//                       title: "职业意向",
//                       urlimage:
//                           'https://tenfei02.cfp.cn/creative/icon/512/VCG25i2248571.jpg',
//                       onTap: () {
//                     Application.router.navigateTo(context, '/editoccupational');
//                   }),
//                   Inkewall(context,
//                       title: "新闻管理",
//                       urlimage:
//                           'https://tenfei01.cfp.cn/creative/icon/512/VCG25i2248570.jpg',
//                       onTap: () {
//                     Application.router.navigateTo(context, '/user_press');
//                   }),
//                   Inkewall(context,
//                       title: "设置",
//                       urlimage:
//                           'https://alifei04.cfp.cn/creative/icon/512/VCG25i2248558.jpg',
//                       onTap: () {
//                     Application.router.navigateTo(context, '/install');
//                   })
//                 ],
//               ),
//             ]),
//             // _seiperWidget(),
//             _hotProductListWidget(),
//             _InformationRelease(),
//             Padding(
//               padding: const EdgeInsets.only(left: 10, right: 10, bottom: 30),
//               child: glassWidgetinfo(
//                 375,
//                 35,
//                 TextButton(
//                     onPressed: () {
//                       Application.router.navigateTo(context, '/userinfo');
//                     },
//                     child: const Text("查看更多招聘信息")),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
