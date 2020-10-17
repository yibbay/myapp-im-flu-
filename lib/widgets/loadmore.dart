import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class LoadmoreState extends State with AutomaticKeepAliveClientMixin  {
  @override
  bool get wantKeepAlive => true;
  List listData = [];
  num total = 0;
  dynamic _api;
  Map<String, dynamic> search = {"pageNum": 1, "pageSize": 15};
  Function _itemBuilder;

  LoadmoreState({dynamic api, Function itemBuilder, Map data, Key key}) {
    this._itemBuilder = itemBuilder;
    this._api = api;
    this.total = data["total"];
    this.listData = data["list"];
  }

  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent && total != listData.length) {
        search["pageNum"]++;
        _getData(search["pageNum"]);
      }
    });
  }

  _getData([int pageNum, int pageSize]) async {
    pageNum != null ? search["pageNum"] = pageNum : null;
    pageSize != null ? search["pageSize"] = pageSize : null;
    print(search);
    Response data = await _api(search);
    Future.delayed(Duration(milliseconds: 300), () {
      setState(() {
        listData.addAll(data.data["list"]);
        total = data.data["total"];
        print(total);
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    super.build(context);
    return RefreshIndicator(
      onRefresh: () async {
        search["pageNum"] = 1;
        Response data = await _api(search);
        setState(() {
          listData = data.data["list"];
          total = data.data["total"];
        });
      },
      child: ListView.builder(
        itemBuilder: (context, index) {
          if (index == listData.length) {
            return new Container(
              alignment: Alignment.center,
              padding: EdgeInsets.fromLTRB(0, 10.0, 0, 10.0),
              child: total != listData.length ? SizedBox(
                height: 22.0,
                width: 22.0,
                child: new Opacity(
                  opacity: 1.0,
                  child:  new CircularProgressIndicator(),
                ),
              )  : Text('我是有底线的'),
            );
          }

          Map itemData = listData[index];

          return _itemBuilder(itemData);
        },
        itemCount: listData.length + 1,
        controller: _scrollController,
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
