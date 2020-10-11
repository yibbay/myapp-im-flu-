import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  num _currentIndex;
  BottomBar(this._currentIndex);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BottomNavigationBar(
        //底部导航栏的创建需要对应的功能标签作为子项，这里我就写了3个，每个子项包含一个图标和一个title。
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              title: new Text(
                '会话',
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.business,
              ),
              title: new Text(
                '通讯录',
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.mood,
              ),
              title: new Text(
                '我',
              )),
        ],
        //这是底部导航栏自带的位标属性，表示底部导航栏当前处于哪个导航标签。给他一个初始值0，也就是默认第一个标签页面。
        currentIndex: _currentIndex,
        //这是点击属性，会执行带有一个int值的回调函数，这个int值是系统自动返回的你点击的那个标签的位标
        onTap: (int i) {
            if (_currentIndex == i) {
              return;
            }
            switch (i) {
              case 0 : 
              Navigator.pushNamed(context, 'session/index');
              break;
              case 1 : 
              Navigator.pushNamed(context, 'contacts/index');
              break;
              case 2 : 
              Navigator.pushNamed(context, 'ucenter/index');
              break;
            }
        },
      );
  }
}

