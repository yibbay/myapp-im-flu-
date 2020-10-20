import 'dart:convert';
import 'dart:math';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_framework/api/index.dart';
import 'package:flutter_framework/widgets/skeleton.dart';
import 'package:flutter_framework/widgets/bottomBar.dart';
import 'package:widget_chain/widget_chain.dart';
import 'package:flutter_framework/widgets/loadmore.dart';
import 'package:provider/provider.dart';
import 'package:flutter_framework/common/model/mainProvide1.dart';

// Response res = await Api.zcts.getPolicyList({"pageNum": 1, "pageSize": 10});

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true; //要点2
  HomePageState() {
    
  }
  @override
  Widget build(BuildContext context) {
    print('object');
    return FutureBuilder(
      future: Api.user.getUserList({"pageNum": 1, "pageSize": 15}),
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
              Map data = snapshot.data.data;

              return PolicyListView(data);
            }
        }
      },
    );
  }
}

class PolicyListView extends StatefulWidget {
  Map data;
  List listData;
  PolicyListView(data) {
    this.data = data;
    this.listData = data["list"];
  }
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LoadmoreState(
        api: Api.user.getUserList,
        itemBuilder: (itemData) {
          return _ItemBuilder(itemData);
        },
        data: data);
  }
}

class _ItemBuilder extends StatefulWidget {
  Map itemData;
  _ItemBuilder(this.itemData);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ItemBuilderState(itemData);
  }
}

class _ItemBuilderState extends State {
  Map itemData;
  _ItemBuilderState(this.itemData);
  @override
  Widget build(BuildContext context) {
    // CounterProvider counterProvider = Provider.of<CounterProvider>(context);
    // TODO: implement build
    return ListTile(
      title: Text(itemData["name"]),
      onTap: () {
        // counterProvider.increment();
      },
    );
  }
}
