import 'package:flutter_tast/components/config/api.dart';
import 'package:flutter_tast/components/model/model.dart';
import 'package:flutter_tast/components/widgets/provider_model.dart';

class JobUserInfoBloc extends ProviderModel {
  Api? _api;
  JobUserInfoBloc(Api api) {
    _api = api;
  }
  JobUser? jobUserModel;
  Future<JobUser?> getJobUser() async {
    loadingg(true);
    jobUserModel = await _api?.getJobUser();
    loadingg(false);
    return jobUserModel;
  }
}
