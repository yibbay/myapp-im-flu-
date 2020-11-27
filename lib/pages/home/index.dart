import 'package:flutter/material.dart';
import './components/OpacityBanner.dart';
import './components/bodyGrid.dart';

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
  @override
  Widget build(BuildContext context) {
    // return Text('322');
    return CustomScrollView(
        shrinkWrap: true,
        slivers: <Widget>[
          new SliverPadding(
            padding: const EdgeInsets.all(0.0),
            sliver: new SliverList(
                delegate: new SliverChildListDelegate(<Widget>[
              Container(
                height: 200,
                // margin: EdgeInsets.only(bottom: 10.0),
                child: OpacityBanner(),
              ),
            ])),
          ),
          new SliverPadding(
            padding: const EdgeInsets.all(0.0),
            sliver: new SliverList(
                delegate: new SliverChildListDelegate(<Widget>[
              Container(
                height: 10.0,
                color: Colors.white,
              )
            ])),
          ),
          bodyGrid()
        ]
    );    
  }
}

