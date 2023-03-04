import 'package:flutter_tast/components/config/api.dart';
import 'package:flutter_tast/views/home/pages/home/bloc/job_offers_bloc.dart';
import 'package:flutter_tast/views/home/pages/home/bloc/user_home_bloc.dart';
import 'package:flutter_tast/views/home/pages/releases/bloc/press_releases.dart';
import 'package:flutter_tast/views/home/pages/resume/bloc/edit_advantage.dart';
import 'package:flutter_tast/views/home/pages/resume/bloc/edit_eduscational.dart';
import 'package:flutter_tast/views/home/pages/resume/bloc/edit_information.dart';
import 'package:flutter_tast/views/home/pages/resume/bloc/edit_project.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'views/home/pages/resume/bloc/edit_career_planning.dart';

List<SingleChildStatelessWidget> providers = [
  Provider<Api>(create: ((_) => Api())),
  ChangeNotifierProvider<EditResumeBloc>(create: ((context) => EditResumeBloc(Api())),),
  ChangeNotifierProvider<EditEduscationalBloc>(create: ((context) => EditEduscationalBloc()),),
  ChangeNotifierProvider<EditAdvantageBloc>(create: ((context) => EditAdvantageBloc()),),

  ChangeNotifierProvider<EditProjectBloc>(create: ((context) => EditProjectBloc()),),
  ChangeNotifierProvider<EditCareerPlanningBloc>(create: ((context) => EditCareerPlanningBloc()),),
  ChangeNotifierProvider<UserHomeBloc>(create: ((context) => UserHomeBloc(Api())),),
  ChangeNotifierProvider<PressReleasesBloc>(create: ((context) => PressReleasesBloc()),),
  // ChangeNotifierProvider<InformationBloc>(create: ((context) => InformationBloc(Provider.of(context))))
];
