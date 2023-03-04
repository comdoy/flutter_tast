
import 'package:flutter_tast/components/config/api.dart';
import 'package:flutter_tast/components/model/model.dart';
import 'package:flutter_tast/components/widgets/widgets.dart';

class AdvantageBloc extends ProviderModel {
  Api? _api;
  AdvantageBloc(Api api) {
    _api = api;
  }
  AdvantageModel? advantageModel;
  Future<AdvantageModel?> getAdvantage() async {
    loadingg(true);
    advantageModel = await _api?.getAdvantage();
    loadingg(false);
    return advantageModel;
  }
}
