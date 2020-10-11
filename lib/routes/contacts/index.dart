import 'package:flutter/material.dart';
import 'package:flutter_framework/widgets/bottomBar.dart';
import 'package:widget_chain/widget_chain.dart';

// Response res = await Api.zcts.getPolicyList({"pageNum": 1, "pageSize": 10});

class Contacts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('通讯录'),
        ),
        body: Center(child: Text('通讯录'),),
        bottomNavigationBar: BottomBar(1));
  }
}


