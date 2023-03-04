import 'package:flutter/material.dart';
import 'package:flutter_tast/components/model/job_offers_model.dart';
import 'package:flutter_tast/components/widgets/widgets.dart';
import 'package:flutter_tast/views/home/pages/home/components/glass_widget_info.dart';

double height = 22;

class JobOffersCell extends StatelessWidget {
  const JobOffersCell({Key? key, this.model, required this.onTap,this.andtwo=true})
      : super(key: key);
  final OffersperItem? model;
  final void Function() onTap;
  final bool? andtwo;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: informationRelease(context,
          onTap: onTap,
          jobtitle: model?.jobtitle,
          jobsalary: model?.jobsalary,
          jobboon: model?.jobboon,
          jobtime: model?.jobtime,
          jobroute: model?.jobroute,
          jobdeadline: model?.jobdeadline,
          jobcity: model?.jobcity,
          jobimage: model?.jobimage,
          jobpeople: model?.jobpeople,
          jobposition: model?.jobposition,
          jobcompany: model?.jobcompany),
    );
  }

  Widget informationRelease(
    BuildContext context, {
    required void Function() onTap,
    String? jobtitle,
    String? jobsalary,
    String? jobboon,
    String? jobtime,
    String? jobroute,
    String? jobcity,
    String? jobdeadline,
    String? jobpeople,
    String? jobposition,
    String? jobimage,
    String? jobcompany,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: GlassWidgetInfo(
        width: 385,
        height: 142,
        andtwo: andtwo,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(
                  top: 10,
                ),
                child: Flex(
                  direction: Axis.horizontal,
                  children: <Widget>[
                    Expanded(
                      flex: 5,
                      child: Text(
                        jobtitle ?? '-',
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        jobsalary ?? '-',
                        style: TextStyle(color: Colors.cyan[200]),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(
                  top: 10,
                ),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          height: height,
                          margin: const EdgeInsets.only(right: 10),
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          decoration: BoxDecoration(
                            color: Colors.cyan[50],
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text(jobboon ?? '-'),
                        ),
                        Container(
                          height: height,
                          margin: const EdgeInsets.only(right: 10),
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          decoration: BoxDecoration(
                            color: Colors.cyan[50],
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text(jobtime ?? '-'),
                        ),
                        Container(
                          height: height,
                          margin: const EdgeInsets.only(right: 10),
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          decoration: BoxDecoration(
                            color: Colors.cyan[50],
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text(jobroute ?? '-'),
                        ),
                        Container(
                          height: height,
                          margin: const EdgeInsets.only(right: 10),
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          decoration: BoxDecoration(
                            color: Colors.cyan[50],
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text(jobdeadline ?? '-'),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Container(
                          height: height,
                          margin: const EdgeInsets.only(right: 10),
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          decoration: BoxDecoration(
                            color: Colors.cyan[50],
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text(jobcity ?? '-'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SizedBox(
                      child: Row(
                        children: [
                          SizedBox(
                            width: 25,
                            height: 25,
                            child: ImageRect(
                              value: jobimage,
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          Text(
                            " $jobpeople .$jobposition",
                            style: const TextStyle(fontSize: 14),
                          )
                        ],
                      ),
                    ),
                    Text(
                      jobcompany ?? '-',
                      style: TextStyle(color: Colors.cyan[200]),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
