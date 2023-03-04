
import 'package:flutter_tast/components/config/api.dart';
import 'package:flutter_tast/components/model/model.dart';
import 'package:flutter_tast/components/widgets/provider_model.dart';

class UserSearchBloc extends ProviderModel {
  Api? _api;
  UserSearchBloc(Api api) {
    _api = api;
  }
  List<OffersperItem>? searchList;

  ///查询招聘信息
  Future<List<OffersperItem>?> getSearch(String? username) async {
    loadingg(true);
    searchList = await _api?.getSearch(username);
    loadingg(false);
    return searchList;
  }
}
