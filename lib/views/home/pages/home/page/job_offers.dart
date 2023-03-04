import 'package:flutter/material.dart';
import 'package:flutter_tast/components/config/api.dart';
import 'package:flutter_tast/components/widgets/widgets.dart';
import 'package:flutter_tast/router/applaction.dart';
import 'package:flutter_tast/views/home/pages/home/bloc/job_offers_bloc.dart';
import 'package:flutter_tast/views/home/pages/home/components/all_job_offers_cell.dart';
import 'package:provider/provider.dart';

double height = 22;

class JobOffers extends StatelessWidget {
  const JobOffers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(3);
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          actions: [
            TextButton(
                onPressed: () {},
                child: const Text(
                  "筛选",
                  style: TextStyle(color: Colors.black, fontSize: 17),
                ))
          ],
          title: GestureDetector(
            onTap: () {
              Application.router.navigateTo(context, "/resume_search");
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 5),
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 245, 245, 245),
                borderRadius: BorderRadius.all(
                  Radius.circular(6),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  Icon(
                    Icons.person_search,
                    size: 22,
                    color: Colors.grey,
                  ),
                  Text(
                    " 搜索",
                    style: TextStyle(color: Colors.grey, fontSize: 17),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: ProviderWidget<JobOffersBloc>(
            onReady: (e) => e.getOffers(),
            model: JobOffersBloc(),
            builder: (context, model, child) {
              print(4);
              return ListView.builder(
                  itemCount: model.jobOffersList?.length,
                  itemBuilder: (context, index) => AllJobOffersCell(
                        model: model.jobOffersList?[index],
                        onTap: () {
                          Application.router.navigateTo(context,
                              '/jobdetailed?id=${model.jobOffersList?[index].id}');
                        },
                      ));
            }));
  }
}
