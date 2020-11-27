import 'package:flutter/material.dart';
import 'package:widget_chain/widget_chain.dart';


class NavList extends StatelessWidget {
  final img;
  final name;
  final id;
  final color;
  NavList({this.img, this.name, this.id, this.color});
  @override
  Widget build(BuildContext context) {
    return new Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        verticalDirection: VerticalDirection.down,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(img), fit: BoxFit.cover)),
              ),
              Container(height: 5.0),
              Text(name)
            ],
          )
        ],
      );
  }
}
