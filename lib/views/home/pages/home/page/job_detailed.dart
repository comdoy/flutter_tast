import 'package:flutter/material.dart';
import 'package:flutter_tast/components/widgets/widgets.dart';
import 'package:flutter_tast/views/home/pages/home/bloc/job_detailed_bloc.dart';
import 'package:flutter_tast/views/home/pages/home/components/job_detailed_cell.dart';
import 'package:provider/provider.dart';

class JobDetailedPage extends StatelessWidget {
  const JobDetailedPage({Key? key, this.jobid}) : super(key: key);
  final String? jobid;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          title: const Text("招聘详情"),
        ),
        body: ProviderWidget<JobDetailedBloc>(
            onReady: (e) => e.postDetailed(),
            model: JobDetailedBloc(Provider.of(context), jobid),
            builder: (context, model, child) {
              if (model.userOffersItme != null) {
                return JobDetailedCell(
                  model: model.offersperItem,
                  onPressed: () {
                    context.read<JobDetailedBloc>().putSubmitCV();
                    Navigator.pop(context);
                  },
                  userJudge: true,
                );
              } else {
                return JobDetailedCell(
                  model: model.offersperItem,
                  onPressed: () {
                    context.read<JobDetailedBloc>().putSubmitCV();
                    Navigator.pop(context);
                  },
                  userJudge: false,
                );
              }
            }));
  }
}
