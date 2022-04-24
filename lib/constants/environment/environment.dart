import 'package:flutter/material.dart';
import 'package:power_logger/power_logger.dart';

class DevEV {
  static late final DevEV _instance = DevEV._();

  DevEV._();

  static DevEV get instance => _instance;

  bool dev = false;

  void setEnvironment(bool environment,context) {
    dev = environment;
    PowerLogger.start(context, debug: dev);
  }
}
