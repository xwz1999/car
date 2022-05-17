
import 'package:flutter/material.dart';

class StatusPage extends StatefulWidget {
  final int num;
  const StatusPage({super.key, required this.num});

  @override
  State<StatusPage> createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {
  @override
  Widget build(BuildContext context) {
    return getText(widget.num);
  }

  getText(int num) {
    switch (num) {
      case 0:
        return '订单取消';

        ///订单取消
        // ignore: dead_code
        break;
      case 1:
        return '待签订';

        ///待签订
        // ignore: dead_code
        break;
      case 2:
        return '已签订';

        ///已签订
        // ignore: dead_code
        break;
      case 3:
        return '已预定';

        ///已支付定金
        // ignore: dead_code
        break;
      case 10:
        return '待检测';

        ///申请检测
        // ignore: dead_code
        break;
      case 11:
        return '上传报告';

        ///上传检测报告
        // ignore: dead_code
        break;
      case 20:
        return '支付首付';

        ///首付审核
        // ignore: dead_code
        break;
      case 21:
        return '支付首付';

        ///首付审核通过
        // ignore: dead_code
        break;
      case 30:
        return '待过户';

        ///过户
        // ignore: dead_code
        break;
      case 31:
        return '已过户';

        ///过户完成
        // ignore: dead_code
        break;

      case 40:
        return '支付尾款';

        ///需支付尾款
        // ignore: dead_code
        break;
      case 41:
        return '支付尾款';

        ///已付尾款，尾款审核通过
        // ignore: dead_code
        break;
      case 50:
        return '交易完成';

        ///
        // ignore: dead_code
        break;
    }
  }
}
