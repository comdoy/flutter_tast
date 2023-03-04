// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class Protocol extends StatelessWidget {
  const Protocol() : super();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          '用户协议',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: ListView(
        children: <Widget>[
          Protocol1(),
          const SizedBox(
            height: 30,
          ),
          const Protocol2()
        ],
      ),
    );
  }
}

class Protocol1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        '用户协议',
        style: TextStyle(
            fontSize: 17, color: Colors.black87, fontWeight: FontWeight.w900),
      ),
    );
  }
}

class Protocol2 extends StatelessWidget {
  Widget selectableText(String text) {
    return SelectableText(
      text,
      style: const TextStyle(
        fontSize: 16,
      ),
      cursorRadius: const Radius.circular(3),
      cursorWidth: 5,
      showCursor: true,
      autofocus: false,
    );
  }
  final String text =
      "请你务必审慎阅读、充分理解协议中相关条款内容。你一旦注册我们的应用,即视为你已了解并完全同意 本协议各项内容,包括我们对使用协议随时所做的任 何修改。如你不同意本协议及/或随时对其的修改,请 你立即停止注册及使用我们所提供的全部服务。";
  final String text1 =
      '1.1注册资格用户须具有法定的相应权利能力和行为能 力的自然人、法人或其他组织,能够独立承担法律责 任。您完成注册程序或其他本APP平台同意的方式实 际使用本平台服务时,即视为您确认自己具备主体资 格,能够独立承担法律责任。若因您不具备主体资 格,而导致的一切后果,由您及您的监护人自行承 担。';
  final String text2 =
      '1.2用户在本软件进行浏览等活动时,涉及用户真实姓 名/名称、通信地址、联系电话、电子邮箱等隐私信息 的,本软件将予以严格保密,除非得到用户的授权或 法律另有规定,本软件不向外界披露用户隐私信 息。';
  final String text3 =
      '2.1您注册成功后,即成为本APP平台的会员,将持有 本APP平台唯一编号的账户信息,您可以根据本站规 定改变您的密码。';
  final String text4 =
      '2.2您设置的姓名为真实姓名,不得侵犯或涉嫌侵犯他人合法权益。否则,本APP有权终止向您提供服务, 注销您的账户。账户注销后,相应的会员名将开放给 任意用户注册登记使用。';
  final String text5 =
      '您可以在任何时候通过使用您的本软件的注册用户名 和密码,查询,补充或更正您的本软件帐户中的个人 信息,或要求删除您的本软件帐户中的个人信息。您 在本软件的帐户可以被删除,但这样会导致您不能够 登录本软件及使用本软件的任何服务。若发现任何非 法使用用户帐号或存在安全漏洞的情况,请立即通知 本站并向公安机关报案。因用户未妥善保管其帐号名 称及密码而导致第三人使用帐号而给用户造成的损 失,由用户自行承担';
  final String text6 =
      '用户在注册及使用时应承诺遵守法律法规、社会主义 制度、国家利益、公民合法权益、公共秩序、社会道 德风尚和信息真实性等七条底线,且用户对其发布的 内容(包括但不限于文字、图片等)时,不得有以下 情形:';
  final String text7 =
      '用户以虚假信息骗取帐号名称注册,或其帐号头像、 简介等注册信息存在违法和不良信息的,本公司有权 采取通知限期改正、暂停使用、注销登记等措施。注 册帐号仅限于用户本人使用,严禁将您的帐号允许第 三人使用,否则用户应承担由此产生的全部责任,并 与实际使用人承担连带责任。';
  final String text8 =
      '我们会在您自愿的前提下收集您的个人信息并将这些 信息进行整合,包括但不限于注册帐号时的相关信息 和活动报名信息等。尊重用户个人隐私是我们的一项 基本政策。所以,我们不会公开或向任何第三方透露 用户的注册资料以及用户因享受本软件服务而提供的 任何信息,但以下情形除外:';
  final String text9 =
      '(2)遵守有关法律规定,包括在国家有关机关查询 时,提供用户的注册信息、用户在本站发布的信息内 容及其发布时间、互联网地址或者域名等(3)在紧急 情况下竭力维护用户个人和社会大众的隐私安全;';
  final String text10 =
      '(4)根据本条款相关规定或者认为必要的其他情形。我们可能会与第三方合作向用户提供相关的网络服务,在此情况下,如该第三方同意承担与我们同等的保护用户隐私的责任,则可将用户信息提供给该第三方。';
  final String text11 =
      '本协议是你与我们APP之间的关系,均适用中华人民共和国法律。你与本软件就本服务、本协议或其他有关事项发生的争议,应首先友好协商解决,协商不成时应提请我们软件运营者所在地有管辖权的人民法院通过诉讼解决。本协议的最终解释权归本公司所有。';

  const Protocol2({Key? key}) : super(key: key);
  Widget texts(String texts) {
    return Text(
      texts,
      style: const TextStyle(
        fontSize: 17,
        color: Colors.black87,
        fontWeight: FontWeight.w900,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            selectableText(
              text,
            ),
            const SizedBox(
              height: 10,
            ),
            texts(
              '1.注册',
            ),
            const SizedBox(
              height: 10,
            ),
            selectableText(
              text1,
            ),
            const SizedBox(
              height: 10,
            ),
            selectableText(
              text2,
            ),
            const SizedBox(
              height: 10,
            ),
            texts(
              '2.账户',
            ),
            const SizedBox(
              height: 10,
            ),
            selectableText(
              text3,
            ),
            const SizedBox(
              height: 10,
            ),
            selectableText(
              text4,
            ),
            const SizedBox(
              height: 10,
            ),
            texts(
              '3.用户管理',
            ),
            const SizedBox(
              height: 10,
            ),
            selectableText(
              text5,
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 10,
            ),
            selectableText(
              text6,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              '  (1)违反宪法或法律法规规定的;',style: TextStyle(
                fontSize: 17,
                color: Colors.black87,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              '  (2)危害国家安全，泄露国家秘密,颠覆国家政权, 破坏国家统一的;',
              style: TextStyle(
                fontSize: 17,
                color: Colors.black87,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              '  (3)损害国家荣誉和利益的,损害公共利益的;',
              style: TextStyle(
                fontSize: 17,
                color: Colors.black87,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              '  (4)煽动民族仇恨、民族歧视,破坏民族团结的;',
              style: TextStyle(
                fontSize: 17,
                color: Colors.black87,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              '  (5)破坏国家宗教政策,宣扬邪教和封建迷信的;',
              style: TextStyle(
                fontSize: 17,
                color: Colors.black87,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              '  (6)散布谣言,扰乱社会秩序,破坏社会稳定的;',
              style: TextStyle(
                fontSize: 17,
                color: Colors.black87,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              '  (7)散布淫秽、色情、赌博、暴力、凶杀、恐怖或者 教唆犯罪的;',
              style: TextStyle(
                fontSize: 17,
                color: Colors.black87,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              '  (8)侮辱或者诽谤他人,侵害他人合法权益的;',
              style: TextStyle(
                fontSize: 17,
                color: Colors.black87,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              '  (9)含有法律、行政法规禁止的其他内容或违反***的 其他规定的。',
              style: TextStyle(
                fontSize: 17,
                color: Colors.black87,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            selectableText(
              text7,
            ),
            const SizedBox(
              height: 10,
            ),
            texts(
              '4.用户隐私制度',
            ),
            const SizedBox(
              height: 10,
            ),
            selectableText(
              text8,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              '  (1)事先获得用户的明确授权或许可;',
              style: TextStyle(
                fontSize: 17,
                color: Colors.black87,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            selectableText(
              text9,
            ),
            const SizedBox(
              height: 10,
            ),
            selectableText(
              text10,
            ),
            const SizedBox(
              height: 10,
            ),
            texts(
              '5.免责条款',
            ),
            const SizedBox(
              height: 10,
            ),
            selectableText(
              text11,
            ),
          ],
        ),
      ),
    );
  }
}
