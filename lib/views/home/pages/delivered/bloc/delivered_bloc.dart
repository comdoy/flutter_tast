import 'package:flutter_tast/components/config/api.dart';
import 'package:flutter_tast/components/model/delivered_model.dart';
import 'package:flutter_tast/components/widgets/widgets.dart';

class DeliveredBloc extends ProviderModel {
  DeliveredBloc(Api api) {
    _api = api;
  }
  late Api _api;

  List<DeliveredModel>? deliveredModel;

  Future<List<DeliveredModel>> getDeliver() async {
    loadingg(true);
    deliveredModel = await _api.getDeliver();
    loadingg(false);
    return deliveredModel ?? [];
  }
}
