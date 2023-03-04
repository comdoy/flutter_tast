import 'package:flutter/material.dart';
import 'package:flutter_tast/components/config/config.dart';
import 'package:flutter_tast/components/model/delivered_model.dart';

class DeliveredCell extends StatelessWidget {
  const DeliveredCell({Key? key, this.itme, this.onTap}) : super(key: key);
  final DeliveredModel? itme;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(width: 0.5))),
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: onTap,
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
                      itme?.jobtitle ?? '-',
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      itme?.jobsalary ?? '-',
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
                        height: 36,
                        margin: const EdgeInsets.only(right: 10),
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        decoration: BoxDecoration(
                          color: Colors.cyan[50],
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(itme?.jobboon ?? '-'),
                      ),
                      Container(
                        height: 36,
                        margin: const EdgeInsets.only(right: 10),
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        decoration: BoxDecoration(
                          color: Colors.cyan[50],
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(itme?.jobtime ?? '-'),
                      ),
                      Container(
                        height: 36,
                        margin: const EdgeInsets.only(right: 10),
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        decoration: BoxDecoration(
                          color: Colors.cyan[50],
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(itme?.jobroute ?? '-'),
                      ),
                      Container(
                        height: 36,
                        margin: const EdgeInsets.only(right: 10),
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        decoration: BoxDecoration(
                          color: Colors.cyan[50],
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(itme?.jobdeadline ?? '-'),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 36,
                        margin: const EdgeInsets.only(right: 10),
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        decoration: BoxDecoration(
                          color: Colors.cyan[50],
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(itme?.jobcity ?? '-'),
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
                          child: ClipRRect(
                            child: Image.network(
                              '${Config.domain}/${itme?.jobimage ?? '-'}',
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        Text(
                          "${itme?.jobpeople??'-'} .${itme?.jobposition??'-'}",
                          style:
                              const TextStyle(color: Colors.grey, fontSize: 14),
                        )
                      ],
                    ),
                  ),
                  Text(
                    itme?.jobcompany ?? '-',
                    style: TextStyle(color: Colors.cyan[200]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
