import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/button/cloud_back_button.dart';
import 'package:cloud_car/widget/button/cloud_bottom_button.dart';
import 'package:flutter/material.dart';
import 'package:signature/signature.dart';

class PartnershipContractPage extends StatefulWidget {
  const PartnershipContractPage({super.key});

  @override
  _PartnershipContractPageState createState() =>
      _PartnershipContractPageState();
}

class _PartnershipContractPageState extends State<PartnershipContractPage> {
  List<dynamic>? data;
  // ignore: non_constant_identifier_names
  // List listWidget = [];
  //late EasyRefreshController _refreshController;
  //手写版控制器
  final SignatureController _signatureController = SignatureController(
    penStrokeWidth: 10.w, //线条宽度
    penColor: Colors.black, //线条颜色
  );
  late bool isEmpty;

  @override
  void initState() {
    if (_signatureController.value.isNotEmpty) {
      isEmpty = false;
    } else {
      isEmpty = true;
    }
    //监听画板
    _signatureController.addListener(() {
      bool tmpIsEmpty = true;
      if (_signatureController.value.isNotEmpty) {
        tmpIsEmpty = false;
      } else {
        tmpIsEmpty = true;
      }
      if (isEmpty != tmpIsEmpty) {
        if (mounted) {
          setState(() {
            isEmpty = tmpIsEmpty;
          });
        }
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    //_refreshController.dispose();
    super.dispose();
  }

  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    //super.build(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: const CloudBackButton(
            isSpecial: true,
          ),
        ),
        extendBody: true,
        //extendBodyBehindAppBar: true,
        body: Container(
          width: 750.w,
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 32.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(left: 186.w),
                child: _getTitle(),
              ),
              56.hb,
              _getText(),
              846.hb,
              _getButton()
            ],
          ),
        ));
  }

//标题
  _getTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          '合伙人合同',
          style:
              Theme.of(context).textTheme.headline6?.copyWith(fontSize: 40.sp),
        ),
        24.hb,
        Text(
          '合同编号：89276531625',
          style: Theme.of(context).textTheme.subtitle2,
        )
      ],
    );
  }

//文本
  _getText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '甲方：xxxx',
          style: Theme.of(context).textTheme.subtitle2,
        ),
        16.hb,
        Text(
          '身份证：xxxx',
          style: Theme.of(context).textTheme.subtitle2,
        ),
        16.hb,
        Text(
          '乙方：xxxx',
          style: Theme.of(context).textTheme.subtitle2,
        ),
        16.hb,
        Text(
          '身份证号：xxxx',
          style: Theme.of(context).textTheme.subtitle2,
        ),
        40.hb,
        Text(
          '第一条合伙人概况',
          style: Theme.of(context).textTheme.subtitle2,
        ),
        24.hb,
        Text(
          'xxxxxxxxxxxx',
          style: Theme.of(context).textTheme.subtitle2,
        ),
      ],
    );
  }

//底部按钮
  _getButton() {
    return CloudBottomButton(
      onTap: () {
        showModalBottomSheet(
          context: context,
          isDismissible: true,
          isScrollControlled: false,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.w),
                  topRight: Radius.circular(16.w))), //弹框矩形圆角
          builder: (BuildContext context) {
            return SizedBox(
              height: 566.w,
              child: Column(
                children: [
                  Column(
                    children: [
                      Padding(padding: EdgeInsets.only(top: 32.w)),
                      Row(
                        children: [
                          Padding(padding: EdgeInsets.only(left: 312.w)),
                          Text(
                            '合同签名',
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1
                                ?.copyWith(color: const Color(0xFF111111)),
                          ),
                          248.wb,
                          SizedBox(
                            width: 19.8.w,
                            height: 19.8.w,
                            child: GestureDetector(
                              child: const Icon(
                                Icons.clear,
                                color: Color(0xFFCCCCCC),
                              ),
                            ),
                          )
                        ],
                      ),
                      40.hb,
                      Stack(children: [
                        Signature(
                          controller: _signatureController,
                          width: 654.w,
                          height: 324.w,
                          backgroundColor: const Color(0xFFF6F6F6),
                        ),
                        Offstage(
                          offstage: !isEmpty,
                          child: Container(
                              padding: EdgeInsets.only(left: 180.w, top: 140.w),
                              child: Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 2.w, vertical: 2.w),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          width: 24.5.w,
                                          height: 24.5.w,
                                          child: Image.asset(
                                            Assets.icons.icFavorite1.path,
                                            fit: BoxFit.fill,
                                            color: const Color(0xFF979797),
                                          ),
                                        ),
                                        Divider(
                                          indent: 2.w,
                                          endIndent: 2.w,
                                          color: const Color(0xFF979797),
                                        )
                                      ],
                                    ),
                                  ),
                                  Text(
                                    '在此处手写您的姓名',
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle2
                                        ?.copyWith(
                                            color: const Color(0xFF999999)),
                                  ),
                                ],
                              )),
                        ),
                      ]),
                      27.hb,
                      CloudBottomButton(
                        onTap: () {
                          //print(isEmpty);
                          // Get.to(() => const SuccessfulPage());
                        },
                        text: '立即签订',
                      )
                    ],
                  )
                ],
              ),
            );
          },
        );
      },
      text: '立即签订',
    );
  }

//测试
  // _aa() {
  //   return Container(
  //     alignment: Alignment.center,
  //     padding: const EdgeInsets.all(100),
  //     decoration: const BoxDecoration(color: Colors.red),
  //     child: Text(
  //       'data',
  //       style: TextStyle(fontSize: 100.sp),
  //     ),
  //   );
  // }

}
