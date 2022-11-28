import 'package:cloud_car/ui/user/user_partner_center/agent_center_page.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/alert.dart';
import 'package:flutter/material.dart';

class JurisdictionToast extends Dialog {
  final int type;
  const JurisdictionToast({super.key, this.type=1});

  @override
  Widget build(BuildContext context) {
    return type==1?
        NormalContentDialog(
          type: NormalTextDialogType.delete,
          title: '没有权限',
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              16.hb,
              Text(
                '未成为合伙人，无法享受云云问车带来的',
                style: Theme.of(context).textTheme.subtitle2,
              ),
            Text(
              '便捷服务',
              style: Theme.of(context).textTheme.subtitle2,
            ),

            ],
          ),
          items: const ['取消'],
          deleteItem: '立即开通',
          //监听器
          listener: (index) {
            Alert.dismiss(context);
          },
          deleteListener: () {
            Alert.dismiss(context);
            Get.to(() => const AgentCenterPage());
          },
        ):
        NormalContentDialog(
          title: '提示',
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              16.hb,
              Text(
                '您的权限不足，无法查看该功能',
                style: Theme.of(context).textTheme.subtitle2,
              ),
            ],
          ),
          items: const ['确认'],
          //监听器
          listener: (index) {
            Alert.dismiss(context);
          }, deleteListener: () {  },
        );
  }
}
