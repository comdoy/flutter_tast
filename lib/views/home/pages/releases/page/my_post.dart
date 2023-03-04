import 'package:flutter/material.dart';
import 'package:flutter_tast/components/widgets/provider_widget.dart';
import 'package:flutter_tast/router/router.dart';
import 'package:flutter_tast/views/home/pages/releases/bloc/my_post.dart';
import 'package:flutter_tast/views/home/pages/releases/components/my_post_cell.dart';
import 'package:provider/provider.dart';

class MyPost extends StatelessWidget {
  const MyPost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderWidget<MyPostBloc>(
        model: MyPostBloc(Provider.of(context)),
        onReady: (model) => model.getPost(),
        builder: (context, model, child) {
          return Scaffold(
            appBar:
                AppBar(elevation: 0, centerTitle: true, title: const Text("我的贴子")),
            body: model.technicalBlogModel?.isNotEmpty??false
                ? ListView.builder(
                    itemCount: model.technicalBlogModel?.length,
                    itemBuilder: ((context, index) {
                      return MyPostCell(
                        model: model.technicalBlogModel?[index],
                        onTap: () {
                          Application.router.navigateTo(context,
                              '/search?id=${model.technicalBlogModel?[index].id}');
                        },
                      );
                    }))
                : Container(
                    alignment: Alignment.center,
                    child: const Text(
                      "您还没有发表动态噢！！！",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  ),
            floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
            floatingActionButton: FloatingActionButton.extended(
                onPressed: () {
                  Application.router
                      .navigateTo(context, '/press?id=1')
                      .then((value) => value ? (model).getPost() : '');
                },
                label: const Text(
                  "发布",
                  style: TextStyle(fontSize: 18),
                )),
          );
        });
  }
}
