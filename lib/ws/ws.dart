import 'package:web_socket_channel/io.dart';
import 'dart:convert' as convert;
import 'package:flutter/material.dart';
import 'package:widget_chain/widget_chain.dart';

class WsManager {
  static WsManager _wsManager;
  static var _channel;
  static List<Function> _bus = [];

  WsManager._();
  factory WsManager(Function onMessage) {
    bool isExist = _bus.indexOf(onMessage) != -1;
    print("isExist: $isExist");

    if (!isExist) {
      _bus.add(onMessage);
    }
    if (_wsManager == null) {
      _wsManager = WsManager._();
      _wsManager.initWebSocket();
      _channel.stream.listen((data) {
        Map dataMap = convert.jsonDecode(data);
        _bus.forEach((eventFn) {
          eventFn(dataMap);
        });
      });
    }
    return _wsManager;
  }

  void initWebSocket() {
    String path = "ws://129.211.91.209:8001";
    _channel = new IOWebSocketChannel.connect(path);
  }

  sendMessage(msg) {
    _channel.sink.add(convert.jsonEncode(msg));
  }
}
