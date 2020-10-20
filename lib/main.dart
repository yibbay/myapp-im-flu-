import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './index.dart';
import 'package:flutter_framework/common/Global.dart';
import 'package:flutter_framework/common/model/mainProvide1.dart';
import 'package:widget_chain/widget_chain.dart';

// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   Global.init().then((e) => runApp(MyApp()));
// };
void main(List<String> args) {
  WidgetsFlutterBinding.ensureInitialized();
  Global.init().then((e) {
    runApp(MyApp());

    // runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CounterProvider())
      ],
      child: MaterialApp(
          title: 'Attorney consultation',
          routes: {
            'session/index': (_) => HomePage(),
            'contacts/index': (_) => Contacts(),
            'ucenter/index': (_) => Ucenter(),
            'ucenter/login': (_) => LoginPage(),
          },
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: ScaffoldPage()),
    );
  }
}

class ScaffoldPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ScaffoldPageState();
  }
}

class ScaffoldPageState extends State {
  final List<Widget> _childList = [HomePage(), Contacts(), Ucenter()];
  final List<String> _childListTitle = ['首页', '通讯录', '我'];
  int _currentIndex = 0;
  var _pageController;
  @override
  Widget build(BuildContext context) {
    CounterProvider counterProvider = Provider.of<CounterProvider>(context);
    _pageController = new PageController(initialPage: _currentIndex);
    print(counterProvider.value);
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text(_childListTitle[_currentIndex]),
        ),
        // body: _childList[_currentIndex],
        body: PageView(
          controller: _pageController,
          children: this._childList,
          onPageChanged: (int i)  {
            setState(() {
              _currentIndex = i;
            });
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
          //底部导航栏的创建需要对应的功能标签作为子项，这里我就写了3个，每个子项包含一个图标和一个title。
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                title: new Text(
                  '首页',
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
                  '我的',
                )),
          ],
          //这是底部导航栏自带的位标属性，表示底部导航栏当前处于哪个导航标签。给他一个初始值0，也就是默认第一个标签页面。
          currentIndex: _currentIndex,
          //这是点击属性，会执行带有一个int值的回调函数，这个int值是系统自动返回的你点击的那个标签的位标
          onTap: (int i) {
            counterProvider.increment();
            _pageController.jumpToPage(i);
            setState(() {
              _currentIndex = i;
            });
          },
        ));
  }
}
