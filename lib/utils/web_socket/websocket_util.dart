import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:cloud_car/constants/api/api.dart';
import 'package:cloud_car/constants/environment/environment.dart';
import 'package:cloud_car/utils/net_work/api_client.dart';
import 'package:cloud_car/utils/toast/cloud_toast.dart';
import 'package:flutter/foundation.dart';
import 'package:power_logger/power_logger.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

enum SocketStatus {
  connect(1, '已连接'),
  disconnect(2, '已断开');

  final int typeNum;
  final String typeStr;

  static SocketStatus getValue(int value) =>
      SocketStatus.values.firstWhere((element) => element.typeNum == value);

  const SocketStatus(this.typeNum, this.typeStr);
}

class WebsocketUtil {
  static final WebsocketUtil _instance = WebsocketUtil._();

  factory WebsocketUtil() => _instance;

  WebsocketUtil._()
      : status = SocketStatus.disconnect,
        heartDuration = const Duration(seconds: 30),
        reconnectTimes = 30,
        heartPrint = false,
        _reconnectCount = 0;

  IOWebSocketChannel? _webSocket;

  final baseWebsocketUrl = AppENV.instance.env == ENVConfig.release
      ? "wss://api.yunyunwenche.com/app/broker"
      : "wss://apiwenche.oa00.com/app/broker";

  /// 连接状态
  SocketStatus status;

  ///心跳计时器；
  Timer? _heartTimer;

  ///心跳间隔
  Duration heartDuration;

  ///重连计数器
  int _reconnectCount;

  ///重连最大次数
  int reconnectTimes;

  ///重连计时器
  Timer? _reconnectTimer;

  ///连接错误回调
  Function(dynamic e)? onError;

  ///开启连接回调
  Function? onStart;

  ///接收消息回调
  Function(String message)? onReceive;

  ///关闭连接回调；
  Function? onClosed;

  ///控制台心跳输出
  bool heartPrint;

  ///注册websocket
  void initWebSocket(
      {Duration? heartDuration,
      bool? heartConsole,
      Function? onStart,
      Function(String message)? onReceive,
      Function? onClosed,
      Function(dynamic e)? onError}) {
    this.onStart = onStart;
    this.onReceive = onReceive;
    this.onClosed = onClosed;
    this.onError = onError;
    if (heartConsole != null) {
      heartPrint = heartConsole;
    }
    if (heartDuration != null) {
      this.heartDuration = heartDuration;
    }
    if (kDebugMode) {
      print('——————————webSocket init ——————————');
    }
  }

  ///启动websocket连接
  void startWebSocket() {
    if (status != SocketStatus.disconnect) {
      closeWebSocket();
    }
    try {
      _webSocket = IOWebSocketChannel.connect(
          Uri.parse('$baseWebsocketUrl/message'),
          headers: {API.tokenKey: apiClient.dio.options.headers[API.tokenKey]});
      if (kDebugMode) {
        print('webSocket已连接服务器：$baseWebsocketUrl/message');
      }
      _webSocket!.stream.listen((event) => webSocketReceiveMessage(event),
          onError: webSocketOnError, onDone: webSocketClosed);
      status = SocketStatus.connect;
      if (_heartTimer != null) {
        destroyHeart();
      }
      initHeartBeat();

      if (_reconnectTimer != null) {
        endReconnect();
      }
      onStart?.call();
    } catch (e) {
      CloudToast.show('webSocket连接失败');
      onError?.call(e);
      LoggerData.addData(e);
    }
  }

  //接收消息回调
  webSocketReceiveMessage(message) {
    var mes = String.fromCharCodes((message as Uint8List));
    if (mes == 'pong') {
      _dPrint('心跳正常————————${DateTime.now()}');
    } else {
      var base64Message = utf8.decode(message);
      print(base64Message);
      onReceive?.call(base64Message);
    }
  }

  //关闭连接回调
  webSocketClosed() {
    closeWebSocket();
    onClosed?.call();
  }

  //连接出错回调
  webSocketOnError(e) {
    WebSocketChannelException ex = e;
    status = SocketStatus.disconnect;
    destroyHeart();
    onError?.call(ex.message);
    if (kDebugMode) {
      print('——————连接断开，开始重连');
    }
    startReconnect();
  }

  //启动重连计时
  void startReconnect() {
    if (_reconnectTimer != null) {
      endReconnect();
    }
    _reconnectTimer =
        Timer.periodic(const Duration(milliseconds: 5000), (timer) {
      _reconnectCount += 1;
      if (kDebugMode) {
        print('——————第$_reconnectCount次重连');
      }
      startWebSocket();
      if (_reconnectCount >= reconnectTimes) {
        if (kDebugMode) {
          print('——————重连失败');
        }
        closeWebSocket();
      }
    });
  }

  //重置重连计时
  void endReconnect() {
    _reconnectTimer?.cancel();
    _reconnectTimer = null;
    _reconnectCount = 0;
  }

  ///初始化心跳
  void initHeartBeat() {
    if (_heartTimer != null) {
      destroyHeart();
    }
    _heartTimer = Timer.periodic(heartDuration, (timer) {
      sentHeart();
    });
  }

  //发送心跳
  void sentHeart() {
    sendMessage('ping');
  }

  ///销毁心跳
  void destroyHeart() {
    _heartTimer?.cancel();
    _heartTimer = null;
  }

  ///关闭websocket
  void closeWebSocket() {
    if (_webSocket != null) {
      _webSocket!.sink.close();
      if (kDebugMode) {
        print('——————websocket连接已关闭');
      }
    }
    destroyHeart();
    status = SocketStatus.disconnect;
  }

  ///向websocket服务器发送消息
  void sendMessage(message) {
    if (_webSocket != null) {
      switch (status) {
        case SocketStatus.connect:
          _dPrint('发送中：$message');
          _webSocket!.sink.add(message);
          break;
        case SocketStatus.disconnect:
          if (kDebugMode) {
            print('连接已关闭');
          }
          break;
        default:
          break;
      }
    }
  }

  //封装print
  void _dPrint(dynamic data) {
    if (heartPrint) {
      if (kDebugMode) {
        print(data);
      }
    }
  }

  ///控制台输出心跳连接
  void setPrintHeart({bool value = false}) {
    heartPrint = value;
  }
}
