
import 'package:cloud_car/model/car_manager/customer_trail_model.dart';
import 'package:cloud_car/ui/home/func/customer_func.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flustars/flustars.dart';

class CustomersTrajectoryPage extends StatefulWidget {
  final int id;
  const CustomersTrajectoryPage({Key? key, required this.id}) : super(key: key);

  @override
  _CustomersTrajectoryPageState createState() => _CustomersTrajectoryPageState();
}

class _CustomersTrajectoryPageState extends State<CustomersTrajectoryPage> {
  List<CustomerTrailModel> _list = [];

  int _page = 1;

  final EasyRefreshController _easyRefreshController = EasyRefreshController();

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32.w),
        child: EasyRefresh(
          firstRefresh: true,
          header: MaterialHeader(),
          footer: MaterialFooter(),
          controller: _easyRefreshController,
          onRefresh: () async {
            _page = 1;
            _list = await CustomerFunc.getCustomerTrail(widget.id,);


            setState(() {});
          },
          onLoad: () async {
            _page++;
            await CustomerFunc.getCustomerTrail(widget.id,).then((value) {
              if(value.isEmpty){
                _easyRefreshController.finishLoad(noMore: true);
              }else{
                _list.addAll(value);
                setState(() {

                });
              }
            });
          },
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.only(top: 32.w),
            itemBuilder: (BuildContext context, int index) {
              return _getListItem(index, index < 1,_list[index]);
            },
            itemCount: _list.length,
          ),
        ),
      ),
    );


  }

  _getListItem(int index, bool ing,CustomerTrailModel model) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      child: IntrinsicHeight(
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.only(left: 32.w),
              height: double.infinity,
              child: Column(
                children: [
                  index != 0
                      ? Container(
                    width: 2.w,
                    height: 10.w,
                    decoration: BoxDecoration(
                      color: !ing ? kPrimaryColor : BaseStyle.colorcccccc,
                    ),
                  )
                      : const SizedBox(),
                  Container(
                    margin: EdgeInsets.only(top: index != 0 ? 0 : 10.w),
                    width: 20.w,
                    height: 20.w,
                    decoration: BoxDecoration(
                      color: ing ? kPrimaryColor : BaseStyle.colorcccccc,
                      borderRadius: BorderRadius.circular(10.w),
                    ),
                  ),
                  index!=_list.length-1?
                  Expanded(
                    child: Container(
                      width: 2.w,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: ing ? kPrimaryColor : BaseStyle.colorcccccc,
                      ),
                    ),
                  ):const SizedBox()
                ],
              ),
            ),
            30.wb,
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children:  [
                    Text(model.type,style: TextStyle(
                      color: const Color(0xFFAAAAAA),fontSize: 24.sp,
                    ),),
                    Text(' ｜ ',style: TextStyle(
                      color: const Color(0xFFAAAAAA),fontSize: 24.sp,
                    ),),
                    Text(model.initiatorName,style: TextStyle(
                      color: const Color(0xFFAAAAAA),fontSize: 24.sp,
                    ),),
                    Text(' ｜ ',style: TextStyle(
                      color: const Color(0xFFAAAAAA),fontSize: 24.sp,
                    ),),
                    Text(DateUtil.formatDate(DateUtil.getDateTimeByMs(
                        model.createdAt.toInt() * 1000),format: 'yyyy-MM-dd HH:mm:ss'),style: TextStyle(
                      color: const Color(0xFFAAAAAA),fontSize: 24.sp,
                    ),),
                  ],
                ),
                16.hb,
                Text(model.content,style: TextStyle(
                  color: const Color(0xFF027AFF),fontSize: 28.sp,
                ),),

                16.hb,

                Text('邀约时间：${DateUtil.formatDate(DateUtil.getDateTimeByMs(
                    model.invite.inviteAt.toInt() * 1000),format: 'yyyy-MM-dd HH:mm:ss')}',style: TextStyle(
                  color: const Color(0xFF333333),fontSize: 28.sp,
                ),),

                16.hb,


                Container(
                  width: 500.w,

                  child: Text('邀约地址：${model.invite.address}',style: TextStyle(
                    color: const Color(0xFF333333),fontSize: 28.sp,
                  ),maxLines: 2,overflow: TextOverflow.ellipsis,
                  ),
                ),

                16.hb,

                Container(
                  width: 560.w,
                  height: 200.w,
                  child: _getCarItem(
                    '',
                    '',
                    DateUtil.formatDate(DateUtil.getDateTimeByMs(
                        model.createdAt.toInt() * 1000),format: 'yyyy年MM月'),
                    '',

                    '',

                  ),
                  decoration: BoxDecoration(
                    color: BaseStyle.colorf6f6f6,
                    borderRadius: BorderRadius.circular(8.w),
                  ),
                ),
                50.hb,
              ],
            ),
          ],
        ),
      ),
    );
  }

  _getCarItem(String url, String name, String time, String distance, String price) {
    return Container(
      padding: EdgeInsets.only(left: 24.w),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            //头像
            width: 200.w, height: 150.w,
            child: AspectRatio(
              aspectRatio: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(8.w)),
                child: url.contains('http')
                    ? FadeInImage.assetNetwork(
                  image: url,
                  fit: BoxFit.cover,
                  placeholder: '',
                )
                    : Image.asset(url),
              ),
            ),
          ),
          24.wb,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  name,
                  maxLines: 1,
                  style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: BaseStyle.color111111,
                      fontSize: BaseStyle.fontSize28,
                      fontWeight: FontWeight.bold),
                ),
                16.hb,
                Row(
                  children: [
                    _getTextView(time),
                    16.wb,
                    _getTextView(distance),
                  ],
                ),
                16.hb,
                RichText(
                  text: TextSpan(
                      text:
                      price,
                      style: TextStyle(
                          color: const Color(0xFFFF3E02), fontSize: 32.sp),
                      children: [
                        TextSpan(
                            text: '万',
                            style: TextStyle(
                                color: const Color(0xFFFF3E02),
                                fontSize: 26.sp))
                      ]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }


  _getTextView(String text) {
    return text.isNotEmpty
        ? Container(
      decoration: BoxDecoration(
          color: const Color(0xFFF1F2F4),
          borderRadius: BorderRadius.all(Radius.circular(2.w))),
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.w),
      child: Text(
        text,
        style: TextStyle(
          color: const Color(0xFF4F5A74),
          fontSize: 20.sp,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    )
        : const SizedBox();
  }

}
