import 'package:flutter_tast/components/config/api.dart';
import 'package:flutter_tast/components/model/project_exprience_model.dart';
import 'package:flutter_tast/components/widgets/provider_model.dart';

class ProjectExperienceBloc extends ProviderModel {
  Api? _api;
  ProjectExperienceBloc(Api api) {
    _api = api;
  }
  ProjectExperienceModel? projectModel;
  Future<ProjectExperienceModel?> getProject() async {
    loadingg(true);
    projectModel = await _api?.getProject();
    loadingg(false);
    return projectModel;
  }
}
