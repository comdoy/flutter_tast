import 'package:dio/dio.dart';
import 'package:flutter_tast/components/config/api.dart';
import 'package:flutter_tast/components/config/config.dart';
import 'package:flutter_tast/components/model/model.dart';
import 'package:flutter_tast/components/utils/utils.dart';
import 'package:flutter_tast/components/widgets/provider_model.dart';
import 'package:fluttertoast/fluttertoast.dart';

class JobDetailedBloc extends ProviderModel {
  Api? _api;
  String? jobid;
  JobDetailedBloc(Api api, String? _jobid) {
    _api = api;
    jobid = _jobid;
  }
  OffersItem? offersperItem;
  UserOffersItme? userOffersItme;
  Future<OffersItem?> postDetailed() async {
    loadingg(true);
    offersperItem = await _api?.postDetailed(jobid);
    userOffersItme = await _api?.getUserOffers(jobid);
    loadingg(false);
    return offersperItem;
  }

  void putSubmitCV() async {
    loadingg(true);
    var api = '${Config.domain}/user_offers/job_offers';
    var userInfo = await UserServices.getUserInfo();
    var repse = await Dio()
        .post(api, data: {"offers_id": jobid, "user_id": userInfo["id"]});
    if (repse.data["code"] == "0") {
    } else {
      Fluttertoast.showToast(
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          msg: "${repse.data['msg']}");
    }
    loadingg(false);
  }
}
