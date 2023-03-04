import 'package:flutter_tast/components/config/api.dart';
import 'package:flutter_tast/components/model/eduscational_model.dart';
import 'package:flutter_tast/components/widgets/provider_model.dart';

class EduscationalBloc extends ProviderModel {
  Api? _api;
  EduscationalBloc(Api api) {
    _api = api;
  }
  EduscationalItmeModel? eduscationalItmeModel;
  Future<EduscationalItmeModel?> postEducat() async {
    loadingg(true);

    eduscationalItmeModel = await _api?.postEduscat();
    loadingg(false);

    return eduscationalItmeModel;
  }

}
