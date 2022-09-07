import 'dart:convert';

import 'package:azlistview/azlistview.dart';
import 'package:cloud_car/model/region/china_region_model.dart';
import 'package:flutter/material.dart';
import 'package:github_language_colors/github_language_colors.dart';

class AzRegionModel extends ISuspensionBean {
  int? id;
  String name;
  String? tagIndex;
  String? namePinyin;
  ChinaRegionModel? model;

  AzRegionModel({
    this.id,
    required this.name,
    this.tagIndex,
    this.namePinyin,
    this.model
  });

  AzRegionModel.fromJson(Map<String, dynamic> json) : name = json['name'];

  Map<String, dynamic> toJson() => {
        'name': name,
//        'tagIndex': tagIndex,
//        'namePinyin': namePinyin,
//        'isShowSuspension': isShowSuspension
      };

  @override
  String getSuspensionTag() => tagIndex!;

  @override
  String toString() => json.encode(this);
}

class AzContactInfoModel extends ISuspensionBean {
  String name;
  String? tagIndex;
  String? namePinyin;

  Color? bgColor;
  IconData? iconData;

  String? img;
  String? id;
  String? firstletter;

  AzContactInfoModel({
    required this.name,
    this.tagIndex,
    this.namePinyin,
    this.bgColor,
    this.iconData,
    this.img,
    this.id,
    this.firstletter,
  });

  AzContactInfoModel.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        img = json['img'],
        id = json['id']?.toString(),
        firstletter = json['firstletter'];

  Map<String, dynamic> toJson() => {
//        'id': id,
        'name': name,
        'img': img,
//        'firstletter': firstletter,
//        'tagIndex': tagIndex,
//        'namePinyin': namePinyin,
//        'isShowSuspension': isShowSuspension
      };

  @override
  String getSuspensionTag() => tagIndex!;

  @override
  String toString() => json.encode(this);
}

class Languages extends GithubLanguage with ISuspensionBean {
  String? tagIndex;
  String? pinyin;
  String? shortPinyin;

  Languages.fromJson(super.json) : super.fromJson();

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = super.toJson();


    return map;
  }

  @override
  String getSuspensionTag() {
    return tagIndex!;
  }

  @override
  String toString() {
    return json.encode(this);
  }
}
