import 'package:flutter/material.dart';

import '../../../utils/headers.dart';
import '../../../widget/alert.dart';
import '../../../widget/button/cloud_back_button.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const CloudBackButton(
            isSpecial: true,
          ),
          backgroundColor: kForeGroundColor,
          title: Text('系统设置',
              style: TextStyle(
                  color: BaseStyle.color111111,
                  fontSize: BaseStyle.fontSize36,
                  fontWeight: FontWeight.bold)),

          //leading:  Container(width: 10.w, child: const CloudBackButton()),
        ),
        backgroundColor: bodyColor,
        extendBody: true,
        body: Container(
            height: 350.h,
            color: Colors.white,
            child: ListView(
              children: ListTile.divideTiles(context: context, tiles: [
                ListTile(
                  leading: Text(
                    '用户协议',
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                ),
                ListTile(
                  leading: Text(
                    '隐私政策',
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                ),
                ListTile(
                  onTap: () {
                    setState(() {
                      Alert.show(
                          context,
                          NormalContentDialog(
                            type: NormalTextDialogType.delete,
                            title: '发现新版本',
                            content: const Text('是否前往下载新版本？'),
                            items: const ['取消'],
                            deleteItem: '确定',
                            //监听器
                            listener: (index) {
                              Alert.dismiss(context);
                              //Value = false;
                              //(Value);
                            },
                            deleteListener: () {
                              Alert.dismiss(context);
                              //Value = true;
                              //(Value);
                            },
                          ));
                    });
                  },
                  leading: Text(
                    '版本号',
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  trailing: Text(
                    '1.1.0(有新版本)',
                    style: TextStyle(
                        fontSize: BaseStyle.fontSize28,
                        color: BaseStyle.color999999),
                  ),
                ),
              ]).toList(),
            )));
  }

  //列表
  // _getList(item) {
  //   return ListTile(
  //     onTap: () {
  //       switch (item['title']) {
  //         case '用户协议':
  //           // Get.to(() => const EnterpriseInformationPage());
  //           //print("1111111");
  //           break;
  //         case '隐私政策':
  //           // Get.to(() => const RealNamePage());
  //           break;
  //         case '版本号':
  //           //Get.to(() => const BankCardPage());
  //           break;
  //       }
  //     },
  //
  //     //绘制消息主体
  //     title: Text(item['title'], style: Theme.of(context).textTheme.subtitle2),
  //
  //     trailing: const Icon(Icons.keyboard_arrow_right),
  //     //contentPadding: ,
  //   );
  // }
}
