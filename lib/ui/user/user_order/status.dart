import 'package:flutter/material.dart';

class StatusWidget extends StatefulWidget {
  final int status;
  const StatusWidget({Key? key, required this.status}) : super(key: key);

  @override
  State<StatusWidget> createState() => _StatusWidgetState();
}

class _StatusWidgetState extends State<StatusWidget> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
