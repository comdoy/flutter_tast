import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import './router_handler.dart';

class Routes {
  //配置类

//  这边是配置路由
  static String root = '/'; //根目录

  static String jobUserInfo = "/job_user";

  static String login = "/login";
  static String enroll = "/enroll";

  static String jobLogin = "/job_login";
  static String jobEnroll = "/job_enroll";

  static String jobOffers = "/jobOffers";
  static String jobdetailed = "/jobdetailed";
  static String resume = "/resume";
  static String editresume = "/editresume";
  static String demoSimple = "/demo";
  static String demoSimpleFixedTrans = "/demo/fixedtrans";
  static String demoFunc = "/demo/func";
  static String deepLink = "/message";
  static String username = "/username";
  static String myshome = "/myshome";
  static String editdetails = "/editdetails";
  static String editeducate = "/editeducate";
  static String editcareer = "/editcareer";
  static String editproject = "/editproject";
  static String certificate = "/certificate";
  static String editoccupational = "/editoccupational";
  static String install = "/install";
  static String editpassword = "/editpassword";
  static String delivered = "/delivered";
  static String technicalBlog = "/industry";
  static String press = "/press";
  static String search = "/search";
  static String myPost = "/user_press";
  static String resumeSearch = "/resume_search";
  static String roleChoice = "/role_choice";
  static String jobEditPassword = "/job_edit";
  static String jobInstall = "/job_install";
  static String jobManage = "/job_manage";
  static String jobNew = "/job_new";
  static String jobBasicInfo = "/job_basic_info";
  static String postJobs = "/post_jobs";
  static String editImage = "/edit_image";
  //静态方法
  static void configureRoutes(FluroRouter router) {
    //路由配置
    //找不到路由
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      // ignore: avoid_print
      print('页面找不到报错了');
      return;
    });
    //整体配置--对应路由的页面  handler的值是跳转另一个页面后要处理的内容

    router.define(root, handler: rootPageHanderl);

    router.define(jobUserInfo,
        handler: jobUserInfoHanderl, transitionType: TransitionType.fadeIn);

    router.define(login,
        handler: loginHanderl, transitionType: TransitionType.fadeIn);

    router.define(enroll,
        handler: enrollHandler, transitionType: TransitionType.inFromLeft);

    router.define(jobLogin,
        handler: jobLoginHanderl, transitionType: TransitionType.fadeIn);

    router.define(jobEnroll,
        handler: jobEnrollHandler, transitionType: TransitionType.inFromLeft);

    router.define(jobdetailed,
        handler: jobDetailsHandler, transitionType: TransitionType.inFromRight);

    router.define(jobOffers,
        handler: jobOffersHanderl, transitionType: TransitionType.inFromRight);

    router.define(resume,
        handler: resumeHanderl, transitionType: TransitionType.inFromRight);

    router.define(editresume,
        handler: editResumeHanderl, transitionType: TransitionType.inFromRight);

    router.define(demoFunc, handler: demoFunctionHandler);
    router.define(editdetails,
        handler: editResumeDetailsHandler,
        transitionType: TransitionType.inFromRight);
    router.define(editeducate,
        handler: editEducateExperienceHandler,
        transitionType: TransitionType.inFromLeft);
    router.define(editcareer,
        handler: editCareerPlanningHandler,
        transitionType: TransitionType.inFromRight);
    router.define(editproject,
        handler: editProjectBackgroundHandler,
        transitionType: TransitionType.inFromRight);
    router.define(certificate,
        handler: certificatePagesHandler,
        transitionType: TransitionType.inFromRight);
    router.define(editoccupational,
        handler: occupationalIntentHandler,
        transitionType: TransitionType.inFromRight);
    router.define(install,
        handler: installPagesHandler,
        transitionType: TransitionType.inFromRight);
    router.define(myshome,
        handler: myshomeHandler, transitionType: TransitionType.inFromLeft);
    router.define(editpassword,
        handler: editPasswordHandler,
        transitionType: TransitionType.inFromLeft);

    router.define(press,
        handler: pressReleasesHandler,
        transitionType: TransitionType.inFromLeft);

    router.define(delivered,
        handler: deliveredHandler, transitionType: TransitionType.inFromLeft);

    router.define(search,
        handler: searchPageHandler, transitionType: TransitionType.inFromLeft);

    router.define(myPost,
        handler: myPostHandler, transitionType: TransitionType.inFromLeft);

    router.define(resumeSearch,
        handler: resumeSearchHandler,
        transitionType: TransitionType.inFromLeft);

    router.define(roleChoice,
        handler: roleChoiceHandler, transitionType: TransitionType.inFromLeft);

    router.define(jobEditPassword,
        handler: jobEditPasswordHandler,
        transitionType: TransitionType.inFromLeft);

    router.define(jobInstall,
        handler: jobInstallHandler, transitionType: TransitionType.inFromLeft);

    router.define(jobManage,
        handler: jobManageHandler, transitionType: TransitionType.inFromLeft);

    router.define(jobNew,
        handler: jobNewHandler, transitionType: TransitionType.inFromLeft);
    router.define(jobBasicInfo,
        handler: jobBasicInfoHandler,
        transitionType: TransitionType.inFromLeft);

    router.define(technicalBlog,
        handler: technicalBlogHandler,
        transitionType: TransitionType.inFromLeft);
    router.define(postJobs,
        handler: postjobHandler, transitionType: TransitionType.inFromLeft);
 router.define(editImage,
        handler: editImageHandler, transitionType: TransitionType.inFromLeft);
    // router.define(searchpage, handler: searchpageHanderl);
  }
}
