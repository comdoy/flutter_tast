import 'package:flutter/material.dart';
import 'package:flutter_tast/router/applaction.dart';
import 'package:flutter_tast/views/home/pages/home/bloc/user_search_bloc.dart';
import 'package:flutter_tast/views/home/pages/home/components/all_job_offers_cell.dart';
import 'package:provider/provider.dart';

import '../../../../../components/widgets/widgets.dart';

String username = '';
final TextEditingController _emailController = TextEditingController();

class ResumeSearch extends StatelessWidget {
  const ResumeSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderWidget<UserSearchBloc>(
        onReady: (e) => e.getSearch(username),
        model: UserSearchBloc(Provider.of(context)),
        builder: (context, model, child) {
          return Scaffold(
              appBar: AppBar(
                  elevation: 0,
                  title: Container(
                    decoration: const BoxDecoration(
                      // border: Border.all(width: 0.5),
                      borderRadius: BorderRadius.all(
                        Radius.circular(6),
                      ),
                    ),
                    child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 1),
                          child: Icon(
                            Icons.search,
                            size: 22,
                            color: Colors.grey,
                          ),
                        ),
                        Expanded(
                          child: inputTextEdit(
                            height: 32,
                            contentPadding:
                                const EdgeInsets.fromLTRB(5, 5, 0, 8),
                            onChanged: (value) {
                              username = value;
                            },

                            borderradius:
                                const BorderRadius.all(Radius.circular(6)),
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            hintText: "请输入关键字",
                            marginTop: 0,
                            // autofocus: true,
                          ),
                        ),
                        const Text(
                          "|",
                          style: TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(255, 226, 226, 226)),
                        )
                      ],
                    ),
                  ),
                  actions: [
                    IconButton(
                        onPressed: () {
                          FocusScopeNode currentFocus = FocusScope.of(context);
                          if (!currentFocus.hasPrimaryFocus &&
                              currentFocus.focusedChild != null) {
                            FocusManager.instance.primaryFocus?.unfocus();
                          }
                          context.read<UserSearchBloc>().getSearch(username);
                        },
                        icon: const Text("搜索"))
                  ]),
              body: model.searchList?.length != 0 && username != ''
                  ? ListView.builder(
                      itemCount: model.searchList?.length,
                      itemBuilder: (context, index) => AllJobOffersCell(
                            model: model.searchList?[index],
                            onTap: () {
                              FocusScopeNode currentFocus =
                                  FocusScope.of(context);
                              if (!currentFocus.hasPrimaryFocus &&
                                  currentFocus.focusedChild != null) {
                                FocusManager.instance.primaryFocus?.unfocus();
                              }
                              Application.router.navigateTo(context,
                                  '/jobdetailed?id=${model.searchList?[index].id}');
                            },
                          ))
                  : const Center(
                      child: Text(
                        "没有查询到您想要的资讯",
                        style: TextStyle(fontSize: 20),
                      ),
                    ));
        });
  }
}
