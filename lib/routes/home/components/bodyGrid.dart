import 'package:flutter/material.dart';
import './NavList.dart';
import 'package:widget_chain/widget_chain.dart';

// 分类导航列表
String img =
    'https://img.cotroncloud.com/group1/M00/01/EF/CpkyeF7ohCCAYY48AAkjH2CRhHw311.jpg';
List<Map> list = [
  {"name": "test", "img": img, "color": Colors.red},
  {"name": "test", "img": img, "color": Colors.blue},
  {"name": "test", "img": img, "color": Colors.yellow},
  {"name": "test", "img": img, "color": Colors.green},
  {"name": "test", "img": img, "color": Colors.red},
];
Widget bodyGrid() => SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: list.length,
        mainAxisSpacing: 0.0,
        crossAxisSpacing: 0.0,
        childAspectRatio: 0.9,
      ),
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        return InkWell(
          highlightColor: Colors.red,
          onTap: () {
            print(index);
          },
          child: NavList(
              name: 'test',
              img: list[index]["img"],
              color: list[index]["color"]),
        );
      }, childCount: list.length),
    );
