import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BaiduWebview extends StatefulWidget {
  @override
  BaiduWebviewState createState() => BaiduWebviewState();
}

class BaiduWebviewState extends State<BaiduWebview> {
  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    // if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: WebView(
      //JS执行模式 是否允许JS执行
      javascriptMode: JavascriptMode.unrestricted,
      initialUrl: 'https://m.baidu.com',
    ));
  }
}
