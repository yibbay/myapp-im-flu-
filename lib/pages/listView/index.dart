import 'package:flutter/material.dart';
import 'package:flutter_framework/api/index.dart';
import 'package:flutter_framework/widgets/skeleton.dart';
import 'package:flutter_framework/widgets/bottomBar.dart';
import 'package:widget_chain/widget_chain.dart';
import 'package:flutter_framework/widgets/loadmore.dart';

// Response res = await Api.zcts.getPolicyList({"pageNum": 1, "pageSize": 10});

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('home'),
        ),
        body: FutureBuilder(
          future: Api.zcts.getPolicyList({"pageNum": 1, "pageSize": 20}),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return new Text(
                    'Press button to start'); //如果_calculation未执行则提示：请点击开始
              case ConnectionState.waiting:
                return Skeleton(); //如果_calculation正在执行则提示：加载中
              default: //如果_calculation执行完毕
                if (snapshot.hasError) {
                  return new Text('Error: ${snapshot.error}')
                      .intoCenter()
                      .intoPadding(padding: EdgeInsets.all(20));
                } //若_calculation执行出现异常
                else {
                  //若_calculation执行正常完成
                  List listData = snapshot.data.data["list"];

                  return Text('fasd');
                }
            }
          },
        ),
        bottomNavigationBar: BottomBar(1));
  }
}




class  _Text extends StatelessWidget {
  String title;
  _Text(this.title);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(title);
  }
}

