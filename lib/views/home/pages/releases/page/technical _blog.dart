import 'package:flutter/material.dart';
import 'package:flutter_tast/components/widgets/provider_widget.dart';
import 'package:flutter_tast/components/widgets/widgets.dart';
import 'package:flutter_tast/router/router.dart';
import 'package:flutter_tast/views/home/pages/releases/bloc/technical_blog.dart';
import 'package:flutter_tast/views/home/pages/releases/components/technical_blog_cell.dart';
import 'package:provider/provider.dart';

class TechnicalBlog extends StatelessWidget {
  const TechnicalBlog({Key? key, this.newid}) : super(key: key);
  final String? newid;
  @override
  Widget build(BuildContext context) {
    return ProviderWidget<TechnicalBlogBloc>(
        model: TechnicalBlogBloc(Provider.of(context), newid),
        onReady: (model) => model.getTechnical(),
        builder: (context, model, child) {
          return Scaffold(
            appBar:
                AppBar(elevation: 0, centerTitle: true, title: const Text("行业新闻")),
            body: ListView.builder(
              itemCount: model.pressList?.length,
              itemBuilder: ((context, index) {
                return TechnicalBlogCell(
                  model: model.pressList?[index],
                  onTap: () {
                    Application.router.navigateTo(
                        context, '/search?id=${model.pressList?[index].id}');
                  },
                );
              }),
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
            floatingActionButton: FloatingActionButton.extended(
                onPressed: () {
                  Application.router.navigateTo(context, '/press?id=$newid').then((value) => value?(model).getTechnical():'');
                },
                label: const Text(
                  "发布",
                  style: TextStyle(fontSize: 18),
                )),
          );
        });
  }
}
