import 'package:cloud_car/ui/home/sort/carlist_page.dart';

import 'package:cloud_car/ui/home/search_page.dart';

import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/widget/button/cloud_back_button.dart';

import 'package:flutter/material.dart';

class ChooseCarPage extends StatefulWidget {
  const ChooseCarPage({Key? key}) : super(key: key);

  @override
  _ChooseCarPageState createState() => _ChooseCarPageState();
}

class _ChooseCarPageState extends State<ChooseCarPage> {
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
        actions: [
          GestureDetector(
            onTap: () {
              Get.to(() => const SearchPage());
            },
            child: Image.asset(Assets.icons.mainSearch.path,
                height: 48.w, width: 48.w),
          ),
          20.wb,
        ],
        backgroundColor: kForeGroundColor,
        title: Text("选择车型",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 34.sp,
              color: const Color(0xFF333333),
            )),
      ),
      backgroundColor: const Color(0xFFF6F6F6),
      extendBody: true,
      body: CarListPage(
        carCallback: (String city) {},
      ),
    );
  }
}
