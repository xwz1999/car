import 'package:cloud_car/ui/splash/agreement_page.dart';
import 'package:cloud_car/ui/splash/privacy_page.dart';
import 'package:cloud_car/utils/user_tool.dart';
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
          title: Text('关于云云',
              style: TextStyle(
                  color: BaseStyle.color111111,
                  fontSize: BaseStyle.fontSize36,
                  fontWeight: FontWeight.bold)),
        ),
        backgroundColor: bodyColor,
        extendBody: true,
        body: ColoredBox(
            color: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: ListTile.divideTiles(context: context, tiles: [
                ListTile(
                  onTap: (){
                    Get.to(()=>const AgreementPage());
                  },
                  leading: Text(
                    '用户协议',
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                ),
                ListTile(
                  onTap: (){
                    Get.to(()=> const PrivacyPage());
                  },
                  leading: Text(
                    '隐私政策',
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                ),
                // ListTile(
                //   onTap: () {
                //     setState(() {
                //       Alert.show(
                //           context,
                //           NormalContentDialog(
                //             type: NormalTextDialogType.delete,
                //             title: '发现新版本',
                //             content: const Text('是否前往下载新版本？'),
                //             items: const ['取消'],
                //             deleteItem: '确定',
                //             //监听器
                //             listener: (index) {
                //               Alert.dismiss(context);
                //             },
                //             deleteListener: () {
                //               Alert.dismiss(context);
                //             },
                //           ));
                //     });
                //   },
                //   leading: Text(
                //     '版本号',
                //     style: Theme.of(context).textTheme.subtitle2,
                //   ),
                //   trailing: Text(
                //     UserTool.appProvider.packageInfo.version,
                //     style: TextStyle(
                //         fontSize: BaseStyle.fontSize28,
                //         color: BaseStyle.color999999),
                //   ),
                // ),
              ]).toList(),
            )));
  }
}
