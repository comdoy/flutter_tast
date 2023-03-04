import 'package:flutter/material.dart';
import 'package:flutter_tast/components/widgets/widgets.dart';
import 'package:flutter_tast/views/home/pages/delivered/bloc/delivered_bloc.dart';
import 'package:flutter_tast/views/home/pages/delivered/components/delivered_cell.dart';
import 'package:provider/provider.dart';

class Delivered extends StatelessWidget {
  const Delivered({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(elevation: 0, centerTitle: true, title: const Text("简历投递记录")),
        body: ProviderWidget<DeliveredBloc>(
          model: DeliveredBloc(Provider.of(context)),
          onReady: (model) => model.getDeliver(),
          builder: (context, model, child) {
            if (model.loading) {
              return const LoadingWidget();
            } else { 
              return Container(
                child: model.deliveredModel?.length != 0
                    ? ListView.builder(
                        itemCount: model.deliveredModel?.length,
                        itemBuilder: ((context, index) {
                         
                          return DeliveredCell(
                            itme: model.deliveredModel![index],
                          );
                        }),
                      )
                    : const Center(child: Text("您还没有投递简历。。。",style: TextStyle(fontSize: 20),)),
              );
            }
          },
        ));
  }
}
