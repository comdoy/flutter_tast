import 'package:flutter_tast/components/config/api.dart';
import 'package:flutter_tast/components/model/career_planning_model.dart';
import 'package:flutter_tast/components/widgets/provider_model.dart';

class CareerPlanningBloc extends ProviderModel {
  Api? _api;
  CareerPlanningBloc(Api api) {
    _api = api;
  }
  CareerPlanningModel? careerModel;
  Future<CareerPlanningModel?> getCareer() async {
    loadingg(true);
    careerModel = await _api?.getCareer();
    loadingg(false);
    return careerModel;
  }
}
