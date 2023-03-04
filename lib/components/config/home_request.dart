

import 'package:dio/dio.dart';
import 'package:flutter_tast/components/config/config.dart';
import 'package:flutter_tast/components/model/model.dart';

class HomeRequest {
    ///获取招聘信息
  static Future<List<OffersperItem>?> getOffersper() async {
    var api = '${Config.domain}/job_offers';
    var response = await Dio().get(api);
    var carouseModel = JobOffersModel.fromJson(response.data);
    List<OffersperItem> jobOffersList = carouseModel.data.records;
    return jobOffersList;
  }
  // static Future<List<PressModel>> getPress({
  //   int page = 1,
  //   int pageSize = 20,
  //   String? search,
  // }) async {
  //   try {
  //     var params = {
  //       "pageNum": page,
  //       "pageSize": pageSize,
  //     };
  //     print(params);
  //     params.removeWhere((key, value) => value == null);
  //     var json = await requestClient.get(APIS.press, queryParameters: params);
  //     print(json);
  //     var pageData = PageData.fromJson(json);
  //     return pageData.records?.map((e) => PressModel.fromJson(e)).toList() ??
  //         [];
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
}
