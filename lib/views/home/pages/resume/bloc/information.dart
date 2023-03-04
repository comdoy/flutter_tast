

import 'package:flutter_tast/components/config/api.dart';
import 'package:flutter_tast/components/model/user_home_model.dart';
import 'package:flutter_tast/components/widgets/widgets.dart';

class InformationBloc extends ProviderModel {
  final Api? _api;
  InformationBloc({required  Api api}):_api = api;
  

  UserHomeModel? resumeModel;

  UserHomeModel? get resume => resumeModel;

  void getUser() async {
    loadingg(true);
    resumeModel = await _api?.postUser();
    loadingg(false);
  }
}
