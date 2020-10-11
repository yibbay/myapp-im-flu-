import 'package:flutter/material.dart';
import 'package:widget_chain/widget_chain.dart';
import 'package:dio/dio.dart';

class Loadmore extends State {
  List listData = [];
  num total = 0;
  var api;
  Map<String, dynamic> search = {"pageNum": 1, "pageSize": 10};
  var itemBuilder;

  Loadmore({dynamic api, dynamic itemBuilder, Key key}) {
    this.itemBuilder = itemBuilder;
    // this.search[key] = key;
    this.api = api;
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return RefreshIndicator(
      onRefresh: () async {
        search["pageNum"] = 1;
        Response data = await this.api(this.search);
        setState(() {
          this.listData = data.data["list"];
          this.total = data.data["total"];
        });
      },
      child: ListView.builder(
        itemBuilder: (context, index) {
          Map itemData = this.listData[index];
          return this.itemBuilder(itemData["policyName"]);
          // return Text(itemData["policyName"]);
        },
        itemCount: this.listData.length,
      ),
    );
  }
}

enum LoadingStatus {
  // 正在加载
  STATUS_LOADING,
  // 数据加载完毕
  STATUS_COMPLETED,
  // 空闲状态
  STATUS_IDEL
}