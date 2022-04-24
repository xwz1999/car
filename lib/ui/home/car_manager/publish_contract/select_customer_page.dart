
import 'package:cloud_car/utils/headers.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../widget/button/cloud_back_button.dart';

class SelectCustomerPage extends StatefulWidget {
  const SelectCustomerPage({Key? key}) : super(key: key);

  @override
  State<SelectCustomerPage> createState() => _SelectCustomerPageState();
}

class _SelectCustomerPageState extends State<SelectCustomerPage> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController _searchController=TextEditingController();
    return Scaffold(
      appBar: AppBar(
        leading: const CloudBackButton(
          isSpecial: true,
        ),
        backgroundColor: kForeGroundColor,
        title: Text('选择客户',
            style: TextStyle(
                color: BaseStyle.color111111,
                fontSize: BaseStyle.fontSize36,
                fontWeight: FontWeight.bold)),
      ),
      backgroundColor: kForeGroundColor,
      extendBody: true,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Color(0x99eeeeee),
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 30.w,bottom: 20.h),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(15)),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 590.w,
                    height: 70.h,
                    child: TextField(
                      style: TextStyle(
                        fontSize: 30.sp,
                      ),
                      decoration: InputDecoration(
                        hintText: '请输入客户名称',
                        hintStyle:
                            TextStyle(color: Colors.black.withOpacity(0.45)),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                        ),
                        contentPadding: const EdgeInsets.only(
                          top: 0,
                          bottom: 0,
                        ),
                        prefixIcon: const Icon(Icons.search),
                      ),
                      controller: _searchController,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: _searchController.text.isEmptyOrNull
                        ? '搜索'.text.size(30.sp).make()
                        : '取消'.text.size(30.sp).make(),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 970.h,
              padding: const EdgeInsets.all(20),
              child: ListView(

              ),
            ),
            Container(
              width: double.infinity,
              color: Colors.white,
              child: ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all(Colors.blue),
                ),
                child: '确定选择'
                    .text
                    .size(30.sp)
                    .color(Colors.white)
                    .make(),
              ),
            ).paddingOnly(top: 10.h,bottom:10.h,right: 30.w,left: 30.w),
          ],
        ),
      ),
    );
  }
}
