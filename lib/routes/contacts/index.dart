import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_framework/routes/index.dart';
import 'package:flutter_framework/widgets/bottomBar.dart';
import 'package:flutter_framework/ws/ws.dart';
import 'package:provider/provider.dart';
import 'package:widget_chain/widget_chain.dart';
import 'dart:convert';
import 'package:flutter_framework/common/wsMessageListen.dart';
import 'package:flutter_framework/common/Global.dart';
import 'package:flutter_framework/common/model/mainProvide1.dart';

// Response res = await Api.zcts.getPolicyList({"pageNum": 1, "pageSize": 10});

class Contacts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ContactsList();
  }
}

class ContactsList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ContactsListState();
  }
}

class ContactsListState extends State {
  List users = [];
  int tapIndex;
  @override
  void initState() {
    String usersStr = Global.prefs.getString("users");
    users = usersStr != null ? jsonDecode(usersStr) : [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List usersData = Provider.of<UserModle>(context).users;
    print(usersData);
    WsMessageListen.sessionListenCallback = (data) {
      setState(() {
        users = data["users"];
        Global.prefs.setString("users", jsonEncode(users));
      });
    };
    WsManager(WsMessageListen.sessionListen);

    if (users.length == 0) {
      return Center(
        child: Text('暂无好友,'),
      );
    }
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, int i) {
        Map<String, dynamic> item = users[i];

        return _ItemBuild(item);
      },
    );
    // ["1231", "11"].buildAllAsWidget((item) => Text(item)).intoListView();
  }

  onRefresh() {}
}

class _ItemBuild extends StatefulWidget {
  Map itemData;
  _ItemBuild(this.itemData);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ItemBuildState(itemData);
  }
}

class _ItemBuildState extends State {
  Map itemData;
  bool isTaping = false;
  _ItemBuildState(this.itemData);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Flex(
      direction: Axis.horizontal,
      children: [
        Image(
                image: NetworkImage(
                    "https://www.cotroncloud.com/images/wyzl-sz.png"),
                fit: BoxFit.fill,
                width: 60.0,
                height: 60.0)
            .intoClipRRect(
          borderRadius: BorderRadius.circular(4),
        ),
        Expanded(
          flex: 1,
          child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Text(itemData['nickname']),
                Text(
                  "Flutter 输入框的高度随内容增加自适应,且换行 - 简书",
                  overflow: TextOverflow.ellipsis,
                ),
              ])
              // .intoDecoratedBox(decoration: BoxDecoration(gradient: LinearGradient(colors:[Colors.red,Colors.orange[700]])))
              .intoPadding(padding: EdgeInsets.fromLTRB(10, 0, 0, 0)),
        ),
      ],
    )
        .intoPadding(padding: EdgeInsets.fromLTRB(20, 10, 20, 10))
        // .intoDecoratedBox(decoration: BoxDecoration(gradient: LinearGradient(colors:[Colors.red,Colors.orange[700]])))
        .intoGestureDetector(
          onTapDown: (TapDownDetails details) {
            setState(() {
              isTaping = true;
            });
          },
          onTapUp: (TapUpDetails details) {
            Timer(Duration(milliseconds: 500), () {
              setState(() {
                isTaping = false;
              });
            });
          },
          behavior: HitTestBehavior.opaque,
        )
        .intoContainer(
            decoration: BoxDecoration(
                color: isTaping ? Colors.grey[300] : Colors.white));
  }
}
