import 'package:flutter/material.dart';
import 'package:flutter_tast/components/model/technical_blog_model.dart';
import 'package:flutter_tast/components/utils/utilities.dart';
import 'package:flutter_tast/components/widgets/widgets.dart';

class TechnicalBlogCell extends StatelessWidget {
  const TechnicalBlogCell({Key? key, this.model, this.onTap}) : super(key: key);
  final Blog? model;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    var time = model?.pressTime.toString();
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(8.0),
            ),
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          SizedBox(
                              width: 40,
                              height: 40,
                              child: ImageRect(
                                value: model?.userImage,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(16.0),
                                ),
                              )),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              model?.pressName ?? '-',
                              style: const TextStyle(fontSize: 15),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(IDateUtils.remindTime(time) ?? '-'),
                  ],
                ),
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 160,
                  child: ImagesNetwork(
                      value: model?.pressImage,
                      fit: BoxFit.fitWidth,
                      and: false)),
              Padding(
                padding: const EdgeInsets.only(
                    left: 10, right: 10, top: 15, bottom: 15),
                child: Text(
                  model?.pressTitle ?? '-',
                  style: const TextStyle(fontSize: 18),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
