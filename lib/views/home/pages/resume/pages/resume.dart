import 'package:flutter/material.dart';
import 'package:flutter_tast/components/config/api.dart';
import 'package:flutter_tast/components/utils/update_scope.dart';
import 'package:flutter_tast/components/widgets/widgets.dart';
import 'package:flutter_tast/router/applaction.dart';
import 'package:flutter_tast/views/home/pages/resume/bloc/advantage.dart';
import 'package:flutter_tast/views/home/pages/resume/bloc/career_planning.dart';
import 'package:flutter_tast/views/home/pages/resume/bloc/eduscational.dart';
import 'package:flutter_tast/views/home/pages/resume/bloc/information.dart';
import 'package:flutter_tast/views/home/pages/resume/components/components.dart';
import 'package:provider/provider.dart';

class ResumePage extends StatelessWidget {
  const ResumePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UpdateScope scope = UpdateScope();
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          actions: [
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.accessible_forward))
          ],
          title: const Text("个人简历"),
        ),
        body: ChangeNotifierProvider<UpdateScope>.value(
        value: scope,
        child: Consumer<UpdateScope>(
          builder: (_, scope, __){
              return Container(
                  color: const Color.fromARGB(255, 246, 246, 248),
                  child: ListView(children: [
                    ProviderWidget<InformationBloc>(
                        model: InformationBloc(api: Api()),
                        onReady: (model) => model.getUser(),
                        builder: (context, model, child) {
                          return model.loading == true
                              ? const Center(
                                  child: CircularProgressIndicator(),
                                )
                              : PersonalInformationCell(
                                  model: model.resume,
                                  onTap: () {
                                    Application.router
                                        .navigateTo(context, '/editresume')
                                        .then((value) =>
                                            value ? (model).getUser() : '');
                                  },
                                );
                        }),
                    ProviderWidget<AdvantageBloc>(
                      model: AdvantageBloc(Provider.of(context)),
                      onReady: (model) => model.getAdvantage(),
                      builder: (context, model, child) {
                        return model.loading == true
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : AdvantageCell(
                                model: model.advantageModel,
                                onTap: (() {
                                  Application.router
                                      .navigateTo(context, '/editdetails')
                                      .then((value) =>
                                          value ? (model).getAdvantage() : '');
                                }),
                              );
                      },
                    ),
                    ProviderWidget<EduscationalBloc>(
                      model: EduscationalBloc(Provider.of(context)),
                      onReady: (p0) => p0.postEducat(),
                      builder: (context, model, child) {
                        return model.loading == true
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : EducationCell(
                                model: model.eduscationalItmeModel,
                                onTap: () {
                                  Application.router
                                      .navigateTo(context, '/editeducate')
                                      .then((value) =>
                                          value ? (model).postEducat() : '');
                                },
                              );
                      },
                    ),
                    // ProviderWidget<ProjectExperienceBloc>(
                    //   model: ProjectExperienceBloc(Provider.of(context)),
                    //   onReady: (p0) => p0.getProject(),
                    //   builder: (context, model, child) {
                    //     return model.loading == true
                    //         ? Center(
                    //             child: CircularProgressIndicator(),
                    //           )
                    //         : ProjectExperienceCell(
                    //             model: model.projectModel,
                    //             onTap: () {
                    //               Application.router
                    //                   .navigateTo(context, '/editproject')
                    //                   .then((value) =>
                    //                       value ? (model).getProject() : '');
                    //             },
                    //           );
                    //   },
                    // ),
                    ProviderWidget<CareerPlanningBloc>(
                      model: CareerPlanningBloc(Provider.of(context)),
                      onReady: (p0) => p0.getCareer(),
                      builder: (context, model, child) {
                        return model.loading == true
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : PlanningCell(
                                model: model.careerModel,
                                onTap: () {
                                  Application.router
                                      .navigateTo(context, '/editcareer')
                                      .then((value) =>
                                          value ? (model).getCareer() : '');
                                },
                              );
                      },
                    ),
                  ]));
            }
          ),
        ));
  }
}
