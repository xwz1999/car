import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/button/cloud_back_button.dart';

import 'package:flutter/material.dart';

class SuccessFailure extends StatefulWidget {
  final bool conditions;
  final String headline;
  final Widget body;
  final Widget bottom;

  const SuccessFailure(
      {Key? key,
      required this.conditions,
      required this.headline,
      required this.body,
      required this.bottom})
      : super(key: key);

  @override
  State<SuccessFailure> createState() => _SuccessFailureState();
}

class _SuccessFailureState extends State<SuccessFailure> {
  late bool conditions = widget.conditions;
  late String headline = widget.headline;
  late Widget body = widget.body;
  late Widget bottom = widget.bottom;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CloudBackButton(
          isSpecial: true,
        ),
        title: Text(
          headline,
          style: Theme.of(context).textTheme.headline4,
        ),
        backgroundColor: kForeGroundColor,
      ),
      body: conditions
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 112,
                ),
                SizedBox(
                  width: 202.w,
                  height: 200.w,
                  child: Image.asset(
                    Assets.icons.successful.path,
                    fit: BoxFit.fill,
                  ),
                ),
                32.hb,
                body,
                72.hb,
                bottom,
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                206.hb,
                SizedBox(
                  width: 200.w,
                  height: 200.w,
                  child: Image.asset(
                    Assets.icons.cancellationAccount.path,
                    fit: BoxFit.fill,
                  ),
                ),
                32.hb,
                body,
                const Spacer(),
                bottom,
                32.hb,
              ],
            ),
    );
  }
}
