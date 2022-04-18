import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:platform/platform.dart';

import '../../constants/api/api.dart';
import '../toast/cloud_toast.dart';
import 'inner_model/base_list_model.dart';
import 'inner_model/base_model.dart';
import 'net_interceptor.dart';

final ApiClient apiClient = ApiClient();

class ApiClient {
  late Dio _dio;

  Dio get dio => _dio;

  ApiClient() {
    var headers = <String, dynamic>{};
    if (kIsWeb) {
      headers = {'device-type': 'web'};
    } else {
      headers = {
        'device-type': const LocalPlatform().operatingSystem.toLowerCase()
      };
    }

    _dio = Dio()
      ..options.baseUrl = API.baseURL
      ..options.headers = headers
      ..interceptors.add(NetworkInterceptor());
  }

  ///设置token
  Dio setToken(String token) {
    return _dio..options.headers[API.tokenKey] = token;
  }

  ///清除token
  Dio clearToken() {
    return _dio
      ..options.headers.removeWhere((key, value) => key == API.tokenKey);
  }

  ///发送请求
  Future<BaseModel> request(
    String path, {
    dynamic data,
    bool showMessage = false,
  }) async {
    try {
      var response = await _dio.post(path, data: data);
      var baseModel = BaseModel.fromJson(response.data);
      if (showMessage) CloudToast.show(baseModel.msg);
      return baseModel;
    } catch (e) {
      if (e is DioError) {
        return BaseModel.dioErr(e);
      }
    }

    return BaseModel.unknown();
  }

  ///请求列表
  Future<BaseListModel> requestList(
    String path, {
    dynamic data,
    bool showMessage = false,
  }) async {
    var response = await _dio.post(path, data: data);
    var baseModel = BaseListModel.fromJson(response.data);
    if (showMessage) CloudToast.show(baseModel.msg);
    return baseModel;
  }

  ///上传图片
  Future<String> uploadImage(File file) async {
    var response = await _dio.post(
      API.file.uploadImage,
      data: FormData.fromMap(
        {'image': await MultipartFile.fromFile(file.path)},
      ),
    );
    var model = BaseModel.fromJson(response.data);
    return model.data['path'];
  }

  ///上传文件
  Future<String> uploadFile(File file) async {
    var response = await _dio.post(
      API.file.uploadFile,
      data: FormData.fromMap(
        {'file': await MultipartFile.fromFile(file.path)},
      ),
    );
    var model = BaseModel.fromJson(response.data);
    return model.data['path'];
  }
}
