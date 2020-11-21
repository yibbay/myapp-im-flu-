import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './index.dart';
import 'package:flutter_framework/common/Global.dart';
import 'package:flutter_framework/common/model/mainProvide1.dart';

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
  static GlobalKey<NavigatorState> navigatorState = new GlobalKey();
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => CounterProvider())],
      child: MaterialApp(
          title: 'Attorney consultation',
          navigatorKey: navigatorState,
          routes: {
            'index': (_) => ScaffoldPage(),
            'ucenter/login': (_) => LoginPage(),
            'ucenter/settings': (_) => SettingsPage(),
            'ucenter/langualge': (_) => LanguagePage(),
            'ucenter/webview': (_) => BaiduWebview(),
            'ucenter/theme': (_) => ThemePage(),
          },
          initialRoute: 'index',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: ScaffoldPage()
        ),
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
    Global.appContext = context;

    _pageController = new PageController(initialPage: _currentIndex);
    // TODO: implement build
    return Scaffold(
        appBar: _currentIndex != 2 ? AppBar(
          title: Text(_childListTitle[_currentIndex]),
        ) : null,
        // body: _childList[_currentIndex],
        body: PageView(
          controller: _pageController,
          physics: new NeverScrollableScrollPhysics(),
          children: this._childList,
          onPageChanged: (int i) {
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
                title: Text(
                  '首页',
                )),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.business,
                ),
                title: Text(
                  '通讯录',
                )),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.mood,
                ),
                title: Text(
                  '我的',
                )),
          ],
          //这是底部导航栏自带的位标属性，表示底部导航栏当前处于哪个导航标签。给他一个初始值0，也就是默认第一个标签页面。
          currentIndex: _currentIndex,
          //这是点击属性，会执行带有一个int值的回调函数，这个int值是系统自动返回的你点击的那个标签的位标
          onTap: (int i) {
            _pageController.jumpToPage(i);
            setState(() {
              _currentIndex = i;
            });
          },
        ));
  }
}
