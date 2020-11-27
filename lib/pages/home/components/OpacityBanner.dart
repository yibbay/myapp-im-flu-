import 'package:flutter/material.dart';
import 'dart:async';

class OpacityBanner extends StatefulWidget {
  @override
  _OpacityBannerState createState() => _OpacityBannerState();
}

class _OpacityBannerState extends State<OpacityBanner> {
  int zIndex = 0;
  Timer timer;
  // 轮播图数据
  List<String> recommend = [
    "https://img.cotroncloud.com/group1/M00/02/C8/CpkyeF-8sQeAap8zAAoA33OExeQ387.png",
    "https://img.cotroncloud.com/group1/M00/00/05/Cpkyel7YSPKAKkHBAAOVmtVBouo959.png",
    "https://img.cotroncloud.com/group1/M00/01/EF/CpkyeF7ohCCAYY48AAkjH2CRhHw311.jpg",
    "https://img.cotroncloud.com/group1/M00/00/05/Cpkyel7YSPKAKkHBAAOVmtVBouo959.png",
    "https://img.cotroncloud.com/group1/M00/01/EF/CpkyeF7ohCCAYY48AAkjH2CRhHw311.jpg",
  ];

  //setInterval控制当前动画元素的下标，实现动画轮播
  autoPlay() {
    var second = const Duration(seconds: 2);
    timer = Timer.periodic(second, (t) {
      setState(() {
        zIndex = (++zIndex) % recommend.length;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    timer = Timer(Duration(seconds: 3), autoPlay);
  }

  @override
  void dispose() {
    if (timer != null) timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(alignment: Alignment.center, children: [
      Stack(
          children: recommend
              .asMap()
              .keys
              .map<Widget>((i) => AnimatedOpacity(
                    curve: Curves.easeIn,
                    duration: Duration(milliseconds: 600),
                    opacity: i == zIndex ? 1 : 0,
                    child: Container(
                      height: 200, //100%
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(recommend[i]),
                              fit: BoxFit.fill)),
                    ),
                  ))
              .toList()),
      Positioned(
          bottom: 20,
          child: Row(
              children: recommend
                  .asMap()
                  .keys
                  .map((i) => Container(
                      width: 10,
                      height: 10,
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                          color: i == zIndex ? Colors.blue : Colors.grey,
                          shape: BoxShape.circle)))
                  .toList()))
    ]));
  }
}
