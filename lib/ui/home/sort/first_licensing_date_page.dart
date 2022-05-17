import 'package:cloud_car/ui/home/sort/search_param_model.dart';
import 'package:cloud_car/widget/cloud_scaffold.dart';
import 'package:flutter/material.dart';

class FirstLicensingDatePage extends StatefulWidget {
  final ValueNotifier<SearchParamModel> pickCar;

  const FirstLicensingDatePage({super.key, required this.pickCar});

  @override
  _FirstLicensingDatePageState createState() => _FirstLicensingDatePageState();
}

class _FirstLicensingDatePageState extends State<FirstLicensingDatePage> {
  // ignore: unused_field
  final Map<List<int>, String> _values = {
    [0, 0]: '全部',
    [0, 1]: '今年',
    [0, 2]: '去年',
    [0, 3]: '近3年',
    [0, 5]: '近5年',
    [7, 0]: '7年以上',
  };

  @override
  Widget build(BuildContext context) {
    return CloudScaffold.normal(
      title: '首次上牌',
      bodyColor: Colors.white,
      body: ListView(),
    );
  }
}
