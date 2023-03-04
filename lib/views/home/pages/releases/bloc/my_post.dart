import 'package:flutter_tast/components/config/api.dart';
import 'package:flutter_tast/components/model/technical_blog_model.dart';
import 'package:flutter_tast/components/widgets/provider_model.dart';

class MyPostBloc extends ProviderModel {
  Api? _api;
  MyPostBloc(Api api) {
    _api = api;
  }
  List<Blog>? technicalBlogModel;
  Future<List<Blog>?> getPost() async {
    loadingg(true);
    technicalBlogModel = await _api?.getPost();
    loadingg(false);
    return technicalBlogModel;
  }
}
