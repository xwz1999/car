
import 'package:cloud_car/ui/home/car_manager/direct_sale/edit_item_widget.dart';
import 'package:cloud_car/ui/user/success_failure_page.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/alert.dart';
import 'package:cloud_car/widget/button/cloud_back_button.dart';
import 'package:cloud_car/widget/button/cloud_bottom_button.dart';
import 'package:flutter/material.dart';
///下架退库页面
class OffCarPage extends StatefulWidget {
  const OffCarPage({Key? key}) : super(key: key);

  @override
  _OffCarPageState createState() => _OffCarPageState();
}

class _OffCarPageState extends State<OffCarPage>  with SingleTickerProviderStateMixin{


  @override
  void initState() {


    super.initState();

  }

  @override
  void dispose() {

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: const CloudBackButton(
              isSpecial: true,
            ),
            backgroundColor: kForeGroundColor,
            title: Text('下架/退库',
              style: Theme
                  .of(context)
                  .textTheme
                  .headline4,
            ),

        ),
        backgroundColor: kForeGroundColor,
        extendBody: true,
        body:Padding(
          padding:  EdgeInsets.only(right: 32.w),
          child: Column(
            children: [
              EditItemWidget(
                title: '展示价格',
                value: '27.65',
                callback: (String content) {},
                endText: '万元',
                tips: '请输入退款理由',
              ),

              Column(
                children: [
                  20.hb,
                  Row(
                    children: [
                      32.wb,
                      Padding(
                        padding: EdgeInsets.only(top:15.w),
                        child: Text('*  ',style: TextStyle(
                          fontSize: 28.sp,color: const Color(0xFFE62222),
                        ),),
                      ),
                      Text('凭证截图',style: TextStyle(
                        fontSize: 28.sp,color: const Color(0xFF999999),
                      ),),
                      Text(' (请上传JPG或PDF格式)',style: TextStyle(
                        fontSize: 24.sp,color: const Color(0xFF999999),
                      ),),
                    ],
                  ),
                  GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: EdgeInsets.only(left: 32.w,right: 32.w,top: 24.w),
                      itemCount: 4,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        //横轴元素个数
                          crossAxisCount: 3,
                          //纵轴间距
                          mainAxisSpacing: 10,
                          //横轴间距
                          crossAxisSpacing: 10,
                          //子组件宽高长度比例
                          childAspectRatio: 2/1.5),
                      itemBuilder: (BuildContext context, int index) {
                        return getItem(Assets.images.carBanner.path,);
                      }),
                ],
              ),



              200.hb,

              GestureDetector(
                onTap: (){
                  Alert.show(
                      context,
                      NormalContentDialog(
                        type: NormalTextDialogType.delete,
                        title: '提交确认',
                        content: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            16.hb,
                            Text(
                              '是否确认提交下架申请？',
                              style: Theme.of(context).textTheme.subtitle2,
                            ),

                          ],
                        ),
                        items: const ['取消'],
                        deleteItem: '发起',
                        //监听器
                        listener: (index) {
                          Alert.dismiss(context);

                        },
                        deleteListener: () {
                          Alert.dismiss(context);
                          Get.off(() => SuccessFailure(
                              conditions: true,
                              headline: '下架/退库',
                              body: Text(
                                '提交成功，等待平台审核',
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                              bottom: CloudBottomButton(
                                onTap: () {
                                  Get.back();
                                },
                                text: '返回汽车详情',
                              )));

                        },
                      ));



                },
                child:Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 32.w),
                  padding: EdgeInsets.symmetric(vertical: 16.w),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: <Color>[
                        Color(0xFF0593FF),
                        Color(0xFF027AFF),
                      ],
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(8.w)),
                  ),
                  child: Text(
                    '提交',
                    style: TextStyle(
                        color: kForeGroundColor, fontSize: BaseStyle.fontSize28),
                  ),
                ),
              )
            ],
          ),
        )

    );
  }



  getItem(String path,) {
    return GestureDetector(
      onTap: (){

      },
      child: Container(
        clipBehavior: Clip.antiAlias,


        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.w),
        ),
        child:
        Stack(
          clipBehavior: Clip.none,
          children: [
            Image.asset(
              path,
              fit: BoxFit.fill
              ,

              height: double.infinity,
              width: double.infinity,
            ),
          ],
        ),


      ),
    );
  }
}
