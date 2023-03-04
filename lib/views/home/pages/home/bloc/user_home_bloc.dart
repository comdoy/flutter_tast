import 'package:flutter_tast/components/config/api.dart';
import 'package:flutter_tast/components/model/model.dart';
import 'package:flutter_tast/components/model/user_home_model.dart';
import 'package:flutter_tast/components/widgets/provider_model.dart';

class UserHomeBloc extends ProviderModel {
  Api? _api;
  UserHomeBloc(Api api) {
    _api = api;
  }
  UserHomeModel? userModel;
  Future<UserHomeModel?> getUser() async {
    loadingg(true);
    userModel = await _api?.postUser();
    loadingg(false);
    return userModel;
  }
}
