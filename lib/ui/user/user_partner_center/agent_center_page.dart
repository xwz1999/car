import 'package:cloud_car/constants/api/api.dart';
import 'package:cloud_car/ui/user/interface/order_func.dart';
import 'package:cloud_car/ui/user/user_partner_center/agent_pay_page.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/utils/toast/cloud_toast.dart';
import 'package:cloud_car/utils/user_tool.dart';
import 'package:cloud_car/widget/alert.dart';
import 'package:cloud_car/widget/button/cloud_back_button.dart';
import 'package:cloud_car/widget/button/cloud_bottom_button.dart';
import 'package:cloud_car/widget/cloud_image_network_widget.dart';
import 'package:cloud_car/widget/cloud_scaffold.dart';
import 'package:cloud_car/widget/cloud_web_view.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AgentCenterPage extends StatefulWidget {
  final bool isRenew;
  const AgentCenterPage({super.key,  this.isRenew = false});

  @override
  _AgentCenterPageState createState() => _AgentCenterPageState();
}

class _AgentCenterPageState extends State<AgentCenterPage> {
  bool _getSure = false;


  @override
  Widget build(BuildContext context) {
    return CloudScaffold(
      path: Assets.images.homeBg2.path,
      bodyColor: bodyColor,
      systemStyle: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
      ),
        appbar: Container(
          color: Colors.transparent,
          height: kToolbarHeight + MediaQuery.of(context).padding.top,
          //alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          child: Row(
            children: [
              const CloudBackButton(
                isSpecial: true,
              ),
              const Spacer(),
              Text('经纪人中心',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 36.sp,color: const Color(0xFF111111)),),
            const Spacer(),
              100.wb,
            ],
          ),
        ),
      body: Expanded(
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [

            Positioned(
                top: 110.w,
                child: Container(
                  width: 700.w,
                  height: 400.w,
                  padding: EdgeInsets.symmetric(horizontal: 32.w),
                  decoration: BoxDecoration(image: DecorationImage(
                      image: AssetImage(!widget.isRenew? Assets.images.partnerCenterBg.path:Assets.images.partnerCenterBg1.path),fit: BoxFit.cover
                  )),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      80.hb,
                      Text(UserTool.userProvider.userInfo.nickname,style: TextStyle(fontSize: 36.sp,color: Colors.white),),
                      20.hb,
                      Row(
                        children: [
                          Text(!widget.isRenew?'合作经纪人':'经纪人，你好',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 36.sp,color: Colors.white),),
                          const Spacer()
                        ],
                      ),
                      10.hb,
                      Row(
                        children: [
                          Text(!widget.isRenew?'成为云云问车经纪人享受豪华特权':'经纪人有效期至${  DateUtil.formatDateMs(UserTool.userProvider.userInfo.partner.expireDate.toInt() * 1000, format: 'yyyy-MM-dd') }',style: TextStyle(fontSize: 24.sp,color: Colors.white),),
                          const Spacer()
                        ],

                      ),
                      60.hb,
                      Row(
                        children: [
                          Text(!widget.isRenew?'待解锁':'已开通',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 32.sp,color: Colors.white),),
                          const Spacer()
                        ],
                      ),

                    ],
                  ),

                )
            ),
            Positioned(
                top: 40.w,
                child: Container(
              width: 140.w,
              height: 140.w,
              decoration: BoxDecoration(color: Colors.white, borderRadius:
              BorderRadius.all(Radius.circular(70.w)),),
              alignment: Alignment.center,
              child: SizedBox(
                //头像
                width: 128.w, height: 128.w,
                child: AspectRatio(
                  aspectRatio: 1,
                  child: ClipRRect(
                      borderRadius:
                      BorderRadius.all(Radius.circular(64.w)),
                      child: CloudImageNetworkWidget.car(
                        urls: [UserTool.userProvider.userInfo.headImg],
                      )),
                ),
              ),
            )),
            Positioned(
                top: 450.w,
                child: Container(
                  width: 750.w,
                  height: 1000.w,
                  padding: EdgeInsets.symmetric(horizontal: 32.w),
                  decoration: BoxDecoration(image: DecorationImage(
                      image: AssetImage(Assets.images.partnerCenterBg2.path),fit: BoxFit.cover
                  )),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      100.hb,
                      Text('合作经纪人特权',style: TextStyle(fontSize: 36.sp,color: const Color(0xFF027AFF),fontWeight: FontWeight.bold),),
                      38.hb,
                      Row(
                          children: [
                            Expanded(child: _getItem(Assets.icons.agentCustomer.path,'客户管理','管理客户，高效工作')),
                            Expanded(child: _getItem(Assets.icons.agentWallet.path,'我的钱包','高付出，高回报')),
                            Expanded(child: _getItem(Assets.icons.agentOrder.path,'我的订单','多种订单，分类清晰')),
                          ],
                      ),
                      26.hb,
                      Row(
                        children: [
                          Expanded(child: _getItem(Assets.icons.agentRecommend.path,'我的推荐码','发展客户，累积客源')),
                          Expanded(child: _getItem(Assets.icons.agentContract.path,'查看合同','权威合同，签约稳定')),
                          Expanded(child: _getItem(Assets.icons.agentInvite.path,'我的邀约','即时邀约，沟通高效')),
                        ],
                      ),
                      80.hb,
                      _getButton()
                    ],
                  ),



                )
            ),

          ],
        ),
      )
    );
  }

  _getButton() {
    return SizedBox(
      height: 227.w,
      width: 750.w,
      //color: Colors.red,
     // padding: EdgeInsets.symmetric(horizontal: 32.w),
      child: Column(children: [
        10.hb,
        CloudBottomButton(
          onTap: ()async {
            //Get.to(() => const PartnerShopContractPage());
            if(_getSure){
              int orderId =
              await OrderFunc.createOrder(!widget.isRenew?1:2);
              if(!widget.isRenew){
                if(orderId!=0){
                  Get.to(() =>  AgentPayPage(
                    price: '3000',
                    orderId: orderId,
                    title: '开通经纪人',
                  ));
                }
              }else{
                if(orderId!=0){
                  Get.to(() =>  AgentPayPage(
                    price: '1000',
                    orderId: orderId,
                    title: '续费经纪人',
                  ));
                }
              }
            }else{
              CloudToast.show('请先同意付款服务协议');
            }


          },
          text: !widget.isRenew?'确认协议立即开通':'确认协议并续费',
        ),
        10.hb,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [


            GestureDetector(
              onTap: () {
                setState(() {
                  Alert.show(
                      context,
                      NormalContentDialog(
                        type: NormalTextDialogType.delete,
                        title: '确认提示',
                        content: const Text('是否确认屏幕下方付款协议?'),
                        items: const ['取消'],
                        deleteItem: '确定',
                        //监听器
                        listener: (index) {
                          Alert.dismiss(context);
                          _getSure = false;
                          setState(() {
                            //_getSure;
                          });
                          //Value = false;
                          //(Value);
                        },
                        deleteListener: () {
                          Alert.dismiss(context);
                          _getSure = true;
                          setState(() {
                            //_getSure;
                          });



                          //print(_getSure);
                          //Value = true;
                          //(Value);
                        },
                      ));
                });
              },
              child: SizedBox(
                  width: 32.w,
                  height: 32.w,
                  child: !_getSure
                      ? const Icon(CupertinoIcons.circle,
                      size: 18, color: Color(0xFFCCCCCC))
                      : const Icon(CupertinoIcons.checkmark_circle,
                      size: 18, color: Colors.blue)),
            ),
            GestureDetector(
              onTap: (){
                Get.to(()=>CloudWebView(url: API.web.vipAgreement, title: ''));
              },
              child: Row(
                children: [
                  10.wb,
                  Text(
                    '我已阅读并了解',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        ?.copyWith(color: const Color(0xFFAAAAAA)),
                  ),
                  Text(
                    '《付款服务协议》',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        ?.copyWith(color: const Color(0xFF027AFF)),
                  )
                ],
              ),
            ),

          ],
        ),

      ]),
    );
  }
  _getItem(String path,String name,String dsc){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 102.w,
          height: 102.w,

          alignment: Alignment.center,
          child: Image.asset(path,width: 102.w,height: 102.w,),
        ),
        16.hb,
        Text(name,style: TextStyle(fontSize: 28.sp,color: const Color(0xFF333333),fontWeight: FontWeight.bold),),
        8.hb,
        Text(dsc,style: TextStyle(fontSize: 20.sp,color: const Color(0xFF999999),fontWeight: FontWeight.bold),),
      ],
    );
  }
}
