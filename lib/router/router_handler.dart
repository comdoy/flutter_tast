import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tast/components/config/api.dart';
import 'package:flutter_tast/components/services/photo_picker_video_cover.dart';
import 'package:flutter_tast/views/home/pages/home/bloc/job_detailed_bloc.dart';
import 'package:flutter_tast/views/home/pages/installs/page/edit_image.dart';
// import 'package:flutter_tast/views/home/models/job_offers_models.dart';
import 'package:flutter_tast/views/home/pages/job_user/job_basic_info.dart';
import 'package:flutter_tast/views/home/pages/job_user/job_edit_password.dart';
import 'package:flutter_tast/views/home/pages/job_user/job_install.dart';
import 'package:flutter_tast/views/home/pages/job_user/job_manage.dart';
import 'package:flutter_tast/views/home/pages/job_user/job_new.dart';
import 'package:flutter_tast/views/home/pages/job_user/page/job_user_page.dart';
import 'package:flutter_tast/views/home/pages/job_user/post_job.dart';
import 'package:flutter_tast/views/home/pages/logins/job_enroll.dart';
import 'package:flutter_tast/views/home/pages/logins/job_login.dart';
import 'package:flutter_tast/views/home/pages/logins/role_choice.dart';
import 'package:flutter_tast/views/home/pages/releases/bloc/press_releases.dart';
import 'package:flutter_tast/views/home/pages/releases/bloc/technical_blog.dart';
import 'package:flutter_tast/views/home/pages/releases/page/technical%20_blog.dart';
import 'package:flutter_tast/views/home/pages/certificate_pages.dart';
import 'package:flutter_tast/views/home/pages/delivered/page/delivered_page.dart';
import 'package:flutter_tast/views/home/pages/resume/pages/edit_career_planning.dart';
import 'package:flutter_tast/views/home/pages/resume/pages/edit_educational.dart';
import 'package:flutter_tast/views/home/pages/installs/page/edit_password.dart';
import 'package:flutter_tast/views/home/pages/resume/pages/edit_project_background.dart';
import 'package:flutter_tast/views/home/pages/resume/pages/edit_information.dart';
import 'package:flutter_tast/views/home/pages/resume/pages/edit_advantage.dart';
import 'package:flutter_tast/views/home/pages/logins/enroll_page.dart';
import 'package:flutter_tast/views/home/pages/installs/page/install.dart';
import 'package:flutter_tast/views/home/pages/home/page/job_detailed.dart';
import 'package:flutter_tast/views/home/pages/occupational_intent.dart';
import 'package:flutter_tast/views/home/pages/releases/page/press_releases.dart';
import 'package:flutter_tast/views/home/pages/releases/page/search_pwb_textfield.dart';
import 'package:flutter_tast/views/home/pages/releases/page/my_post.dart';
import 'package:flutter_tast/views/home/pages/resume/pages/resume.dart';
import 'package:flutter_tast/views/home/pages/home/page/resume_search.dart';
import 'package:flutter_tast/views/home/pages/home/page/user_home.dart';
import 'package:flutter_tast/views/home/pages/home/page/job_offers.dart';
import 'package:flutter_tast/views/home/pages/logins/login_page.dart';
import 'package:provider/provider.dart';

var jobDetailsHandler = Handler(
  handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    String? jobid = params['id']?.first;
    return Provider<JobDetailedBloc>(
      create: (context) => JobDetailedBloc(Api(), jobid),
      child: JobDetailedPage(
        jobid:jobid
      ),
    );
  },
);

var jobUserInfoHanderl = Handler(
  handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    return const JobUserPage();
  },
);

var rootPageHanderl = Handler(
  handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    return const UserPage();
  },
);

var loginHanderl = Handler(
  handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    return const LoginPage();
  },
);

var enrollHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return const EnrollPage();
});

var jobLoginHanderl = Handler(
  handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    return const JobLogin();
  },
);

var jobEnrollHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return const JobEnroll();
});

var jobOffersHanderl = Handler(
  handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    return const JobOffers();
  },
);
var resumeHanderl = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return const ResumePage();
});
var editResumeHanderl = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return const EditResumePage();
});

var myshomeHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return const MysHomePage();
});
var editResumeDetailsHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return const EditAdvantagePage();
});
var editEducateExperienceHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return const EditEducateExperience();
});
var editCareerPlanningHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return const EditCareerPlanning();
});
var editProjectBackgroundHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return const EditProjectBackground();
});
var certificatePagesHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return const CertificatePages();
});
var occupationalIntentHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return const OccupationalIntent();
});
var installPagesHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return const InstallPage();
});
var editPasswordHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return const EditPassword();
});
var deliveredHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return const Delivered();
});
var technicalBlogHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  String? newid = params['id']?.first;
  return Provider(
    create: ((context) => TechnicalBlogBloc(Api(), newid)),
    child: TechnicalBlog(
      newid: newid,
    ),
  );
});
var pressReleasesHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  String? pressid = params['id']?.first;
  return Provider(
    create: ((context) => PressReleasesBloc()),
    child: PressReleases(
      pressid: pressid,
    ),
  );
});

var myPostHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return const MyPost();
});

var resumeSearchHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return const ResumeSearch();
});

var roleChoiceHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return const RoleChoice();
});

var jobEditPasswordHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return const JobEditPassword();
});

var jobInstallHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return const JobInstallPage();
});

var jobManageHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return const JobManage();
});

var jobNewHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return const JobNew();
});

var jobBasicInfoHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return const JobBasicInfo();
});

var postjobHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return const PostJobs();
});

var searchPageHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  String? searchid = params['id']?.first;
  return SearchPage(
    searchid: searchid,
  );
});

var demoFunctionHandler = Handler(
    type: HandlerType.function,
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      String? message = params["message"]?.first;
      showDialog(
        context: context!,
        builder: (context) {
          return AlertDialog(
            title: const Text(
              "Hey Hey!",
              style: TextStyle(
                color: Color(0xFF00D6F7),
                fontFamily: "Lazer84",
                fontSize: 22.0,
              ),
            ),
            content: Text("$message"),
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0, right: 8.0),
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  child: const Text("OK"),
                ),
              ),
            ],
          );
        },
      );
      return;
    });

var editImageHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return const EditImage();
});
