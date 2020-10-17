import 'package:flutter/material.dart';
import './login.dart';

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
  void initState() {
    
  }
 @override
  Widget build(BuildContext context) {
     var a = 1;
     if (a == 1) {
        Future.delayed(Duration(milliseconds: 50)).then((value) {
          Navigator.pushNamed(context, 'ucenter/login');
        });
        return Text('');
     }
    // TODO: implement build
    return Text("fasfasd");
  }
}


