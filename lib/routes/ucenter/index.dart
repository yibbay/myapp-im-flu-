import 'package:flutter/material.dart';
import 'package:widget_chain/widget_chain.dart';

// Response res = await Api.zcts.getPolicyList({"pageNum": 1, "pageSize": 10});

class Ucenter extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return UcenterState();
  }
}

class UcenterState extends State {
  @override
  void initState() {}
  @override
  Widget build(BuildContext context) {
    // var a = 1;
    //  if (a == 1) {
    //     Future.delayed(Duration(milliseconds: 50)).then((value) {
    //       Navigator.pushNamed(context, 'ucenter/login');
    //     });
    //     return Text('');
    //  }
    // TODO: implement build
    return Scaffold(
        body: ListView(
      children: <Widget>[
        Container(
          height: 220,
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image:  NetworkImage(
                              "https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=1283277806,3583569773&fm=26&gp=0.jpg"), fit: BoxFit.cover)
          ),
          child: Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ClipRect(
                  child: Image(
                          image: NetworkImage(
                              "https://www.cotroncloud.com/images/wyzl-sz.png"),
                          fit: BoxFit.cover,
                          width: 80.0,
                          height: 80.0)
                      .intoClipRRect(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
              // Expanded(
              //   flex: 1,
              //   child: Text('登录/注册',style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 24
              //   )),
              // )
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("用户名:123456789",
                        style: TextStyle(color: Colors.white, fontSize: 26)),
                    Text("普通会员",
                        style: TextStyle(color: Colors.white, fontSize: 20))
                  ],
                ),
              )
            ],
          ),
        ),
        ListTile(
            leading: Icon(Icons.settings,), title: Text('设置'),
            onTap: () {
              Navigator.of(context).pushNamed('ucenter/settings');
            },
        ),
        Divider(height: 1,),
        ListTile(leading: Icon(IconData(0xe628, fontFamily: 'iconfont'), size: 18), title: Text('主题'), onTap: () {},),
        Divider(height: 2,),
        ListTile(leading: Icon(Icons.language,), title: Text('语言'), onTap: () {},),
        Divider(height: 2,),
      ],
    ));
  }
}
