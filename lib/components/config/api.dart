import 'package:dio/dio.dart';
import 'package:flutter_tast/components/config/config.dart';
import 'package:flutter_tast/components/model/model.dart';
import 'package:flutter_tast/components/services/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Api {
  Dio dio = Dio();

  ///修改个人信息

  ///查看投递记录列表
  Future<List<DeliveredModel>?> getDeliver() async {
    var userInfo = await UserServices.getUserInfo();
    var api = "${Config.domain}/user_offers/user?search=${userInfo['id']}";
    var response = await dio.get(api);
    var deliveredmodel = JobDetailedModel.fromJson(response.data);
    List<DeliveredModel>? jobDeliveredList = deliveredmodel.data.records;
    return jobDeliveredList;
  }

  ///查看个人优势
  Future<AdvantageModel?> getAdvantage() async {
    var userInfo = await UserServices.getUserInfo();
    var api = '${Config.domain}/edit_advantage/advantage';
    var response = await dio.post(api, data: {"user_id": userInfo["id"]});

    var advantageModels = AdvantageModels.fromJson(response.data);
    var advantageModel = advantageModels.data;

    return advantageModel;
  }

  ///查看个人信息
  Future<UserHomeModel?> postUser() async {
    var userInfo = await UserServices.getUserInfo();
    var api = "${Config.domain}/user";
    var response = await dio.post(api, data: {"id": userInfo['id']});
    var userModel = UserModel.fromJson(response.data);
    var userHomeModel = userModel.data;
    return userHomeModel;
  }

  ///查看教育经历
  Future<EduscationalItmeModel?> postEduscat() async {
    var userInfo = await UserServices.getUserInfo();
    var api = '${Config.domain}/edit_educate/educate';
    var response = await dio.post(api, data: {"user_id": userInfo["id"]});
    var eduscateModel = EduscationalModel.fromJson(response.data);
    var eduscateModelItme = eduscateModel.data;
    return eduscateModelItme;
  }

  Future<EduscationalItmeModel?> putEduscat(
    String? graduatedschool,
    String? profession,
    String? period,
    String? whether,
    String? education,
    String? experience,
  ) async {
    var userInfo = await UserServices.getUserInfo();
    var api = '${Config.domain}/edit_educate';
    var response = await dio.put(api, data: {
      "user_id": userInfo["id"],
      "graduatedschool": graduatedschool,
      "profession": profession,
      "period": period,
      "whether": whether,
      "education": education,
      "experience": experience,
    });
    if (response.data["code"] == "0") {
      Fluttertoast.showToast(
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          msg: "修改成功。。。");
    } else {
      Fluttertoast.showToast(
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          msg: "${response.data['msg']}");
    }
    var eduscateModel = EduscationalModel.fromJson(response.data);
    var eduscateModelItme = eduscateModel.data;
    return eduscateModelItme;
  }

  Future<ProjectExperienceModel?> getProject() async {
    var userInfo = await UserServices.getUserInfo();
    var api = '${Config.domain}/edit_project/project';
    var response = await dio.post(api, data: {"user_id": userInfo["id"]});
    var projectModels = ProjectExperienceModels.fromJson(response.data);
    var projectModel = projectModels.data;
    return projectModel;
  }

  Future<CareerPlanningModel?> getCareer() async {
    var userInfo = await UserServices.getUserInfo();
    var api = '${Config.domain}/edit_career/career';
    var response = await Dio().post(api, data: {"user_id": userInfo["id"]});
    var careerModels = CareerPlanningModels.fromJson(response.data);
    var careerModel = careerModels.data;
    return careerModel;
  }

  ///壁纸
  Future<WallpaperModel?> getImage() async {
    var userInfo = await UserServices.getUserInfo();
    var api = "${Config.domain}/wallpaper";
    var response = await Dio().post(api, data: {"user_id": userInfo["id"]});
    var wallpaperModels = WallpaperModels.fromJson(response.data);
    var wallpaperModel = wallpaperModels.data;
    return wallpaperModel;
  }

  ///我的博客
  Future<List<Blog>?> getPost() async {
    var userInfo = await UserServices.getUserInfo();
    var api = "${Config.domain}/press/user_press?search=${userInfo['id']}";
    var response = await dio.get(api);
    var pressModel = TechnicalBlogModel.fromJson(response.data);
    List<Blog>? pressList = pressModel.data.records;
    return pressList;
  }

  ///行业新闻
  Future<List<Blog>?> getTechnical(String? _newid) async {
    var api = "${Config.domain}/press?search=$_newid";
    var response = await dio.get(api);

    var pressModel = TechnicalBlogModel.fromJson(response.data);
    List<Blog>? pressList = pressModel.data.records;
    return pressList;
  }

  ///发布新闻
  void postReleases(String? pressid, String? pressText, String? pressImage,
      String? pressTitle, String? dateTimes) async {
    var userInfo = await UserServices.getUserInfo();
    var api = "${Config.domain}/press";
    var response = await dio.post(api, data: {
      "user_id": userInfo["id"],
      "type_id": pressid,
      "user_image": userInfo["images"],
      "press_name": userInfo["nickname"],
      "press_image": pressImage,
      "press_title": pressTitle,
      "press_text": pressText,
      "press_time": dateTimes,
    });
    if (response.data["code"] == '0') {
    } else {
      Fluttertoast.showToast(
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          msg: "${response.data['msg']}");
    }
  }

  ///获取招聘信息
  Future<List<OffersperItem>?> getOffersper() async {
    var api = '${Config.domain}/job_offers';
    var response = await dio.get(api);
    var carouseModel = JobOffersModel.fromJson(response.data);

    List<OffersperItem> jobOffersList = carouseModel.data.records;
    print(jobOffersList.length);
    return jobOffersList;
  }

  ///招聘详情
  Future<OffersItem?> postDetailed(String? jobid) async {
    var api = '${Config.domain}/job_offers/job_seeker';
    var response = await dio.post(api, data: {"id": jobid});
    var offersModel = SubmitResumeModel.fromJson(response.data);
    var offersItme = offersModel.data;
    return offersItme;
  }

  ///查询招聘信息
  Future<List<OffersperItem>?> getSearch(String? username) async {
    var api = "${Config.domain}/job_offers?search=$username";
    var response = await Dio().get(api);
    var searchModel = JobOffersModel.fromJson(response.data);
    List<OffersperItem> searchList = searchModel.data.records;
    return searchList;
  }

  Future<UserOffersItme?> getUserOffers(String? jobid) async {
    var userInfo = await UserServices.getUserInfo();
    var apis = "${Config.domain}/user_offers/post_offers";
    var responses = await Dio()
        .post(apis, data: {"offers_id": jobid, "user_id": userInfo["id"]});

    if (responses.data["data"] != 'null') {
      var userOffers = UserOffersModel.fromJson(responses.data);
      var userOffersItme = userOffers.data;
      return userOffersItme;
    } else {
      return null;
    }
  }

  ///招聘者
  ///查看用户信息
  Future<JobUser?> getJobUser() async {
    var jobUserInfo = await JobUserServices.getJobUserInfo();
    var api = "${Config.domain}/recruiter";
    var response = await dio.post(api, data: {"id": jobUserInfo["id"]});
    var jobUserModel = JobUserInfoModel.fromJson(response.data);
    var jobUserItme = jobUserModel.data;
    return jobUserItme;
  }
}
