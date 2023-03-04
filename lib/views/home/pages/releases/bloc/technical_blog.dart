import 'package:dio/dio.dart';
import 'package:flutter_tast/components/config/api.dart';
import 'package:flutter_tast/components/model/technical_blog_model.dart';
import 'package:flutter_tast/components/widgets/provider_model.dart';

class TechnicalBlogBloc extends ProviderModel {
  Api? _api;
  String? _newid;
  List<Blog>? pressList;
  TechnicalBlogBloc(Api api, String? newid) {
    _api = api;
    _newid = newid;
  }
  Dio dio = Dio();
  Future<List<Blog>?> getTechnical() async {
    loadingg(true);
    pressList = await _api?.getTechnical(_newid);
    loadingg(false);
    return pressList;
  }
}
