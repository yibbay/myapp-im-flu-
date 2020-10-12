import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_framework/widgets/bottomBar.dart';
import 'package:flutter_framework/ws/ws.dart';
import 'package:widget_chain/widget_chain.dart';
import 'dart:convert';
import 'package:flutter_framework/common/wsMessageListen.dart';
import 'package:flutter_framework/common/Global.dart';

// Response res = await Api.zcts.getPolicyList({"pageNum": 1, "pageSize": 10});

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('会话'),
        ),
        body: SessionList(),
        bottomNavigationBar: BottomBar(0));
  }
}

class SessionList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SessionListState();
  }
}

class SessionListState extends State {
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
    WsManager(WsMessageListen.sessionListen);
    WsMessageListen.sessionListenCallback = (data) {
      setState(() {
        users = data["users"];
        Global.prefs.setString("users", jsonEncode(users));
      });
    };

    if (users.length == 0) {
      return Center(
        child: Text('暂无会话'),
      );
    }
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, int i) {
        Map<String, dynamic> item = users[i];
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
                    Text(item["nickname"]),
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
                  tapIndex = i;
                });
              },
              onTapUp: (TapUpDetails details) {
                Timer(Duration(milliseconds: 500), () {
                  setState(() {
                    tapIndex = null;
                  });
                });
              },
              behavior: HitTestBehavior.opaque,
            )
            .intoContainer(
                decoration: BoxDecoration(
                    color: tapIndex == i ? Colors.grey[300] : Colors.white));
      },
    );
    // ["1231", "11"].buildAllAsWidget((item) => Text(item)).intoListView();
  }

  onRefresh() {}
}

// wsStreamBuilder (dataMap) {
//   List users = dataMap["users"];

//   return users.buildAllAsWidget((item) {
//     return ListTile(
//       title: Text(item["nickname"]),
//     );
//   }).intoListView();
// }
