

import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/button/cloud_back_button.dart';

import 'package:flutter/material.dart';


///车辆维保查询
class MaintainQueryPage extends StatefulWidget {
  const MaintainQueryPage({super.key});

  @override
  _MaintainQueryPageState createState() => _MaintainQueryPageState();
}

class _MaintainQueryPageState extends State<MaintainQueryPage> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CloudBackButton(
          isSpecial: true,
        ),
        backgroundColor: Colors.white,
        title: Text(
          '维保查询',
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 32.w),

            child: Container(
              width: double.infinity,
              height: 147.w,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(Assets.images.assessmentBg.path),
                  fit: BoxFit.fill

                )
              ),
            ),



          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(8.w)),
              color: Colors.white
            ),
            child: ListView(
              shrinkWrap: true,
              children: [
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 32.w),
                  child: Image.asset(Assets.images.drivingLicense2.path,width:double.infinity ,height: 460.w,),
                ),
                32.hb,

                Container(
                  width: double.infinity,
                  height: 84.w,
                  color: kForeGroundColor,
                  child: GestureDetector(
                    onTap: () async {

                    },
                    child: Container(
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
                        '开始查询',
                        style: TextStyle(
                            color: kForeGroundColor, fontSize: BaseStyle.fontSize28),
                      ),
                    ),
                  ),
                ),















              ],
            ),
          ),
        ],
      )

    );
  }
}

