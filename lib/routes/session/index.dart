import 'package:flutter/material.dart';
import 'package:flutter_framework/widgets/bottomBar.dart';
import 'package:flutter_framework/ws/ws.dart';
import 'package:widget_chain/widget_chain.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:flutter_framework/common/wsMessageListen.dart';
import 'package:flutter_framework/common/prefs.dart';

// Response res = await Api.zcts.getPolicyList({"pageNum": 1, "pageSize": 10});

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
  var prefs;
  List users = [];
  int tapIndex;
  @override
  void initState() {
    
    initUser();
    // TODO: implement initState
    super.initState();
  }

  initUser () async {
    if (prefs == null) {
      prefs = await Db.prefs();
    }
    String usersStr = prefs.getString("users");
    print(usersStr);
    setState(() {
      users = usersStr != null ? jsonDecode(usersStr) : [];
    });
  }

  @override
  Widget build(BuildContext context) {
    WsMessageListen.sessionListenCallback = (data) {
      setState(() {
        print(data["users"]);

        users = data["users"];
        prefs.setString("users", jsonEncode(users));
      });
    };
    WsManager ws = WsManager(WsMessageListen.sessionListen);

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
                return false;
              },
              onTapUp: (TapUpDetails details) {
                setState(() {
                  tapIndex = null;
                });
              },
              behavior: HitTestBehavior.opaque,
            )
            .intoAnimatedContainer(
                duration: Duration(milliseconds: 150),
                decoration: BoxDecoration(color: tapIndex == i ? Colors.grey[300] : Colors.white));
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
