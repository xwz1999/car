import 'package:flutter/material.dart';

class CustomDrawer extends StatefulWidget {
    const CustomDrawer({super.key,
    required this.backgroundColor,
    this.elevation = 16.0,
    required this.child,
    required this.widthPercent,
    required this.callback,
  }) : assert(widthPercent < 1.0 && widthPercent > 0.0);

  final Color backgroundColor;
  final double elevation;
  final Widget child;
  final double widthPercent;
  final DrawerCallback callback;

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  void initState() {
    widget.callback(true);
    super.initState();
  }

  @override
  void dispose() {
    widget.callback(false);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterialLocalizations(context));
    final double width =
        MediaQuery.of(context).size.width * widget.widthPercent;
    return ConstrainedBox(
      constraints: BoxConstraints.expand(width: width),
      child: Material(
        color: widget.backgroundColor,
        elevation: widget.elevation,
        child: widget.child,
      ),
    );
  }
}