import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;
import 'package:power_logger/power_logger.dart';
import '../../ui/login/login_page.dart';
import '../toast/cloud_toast.dart';

class NetworkInterceptor extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    // final userProvider = Provider.of<UserProvider>(Get.context!, listen: false);
    LoggerData.addData(response);
    int code = response.data['code'] ?? 0;
    switch (code) {
      //登录超时
      case 100000:
        // await userProvider.logout();
        await Get.offAll(() => const LoginPage());
        break;
      default:
        break;
    }
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    LoggerData.addData(err);
    switch (err.type) {
      case DioErrorType.connectTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
        CloudToast.show('连接超时');
        break;
      case DioErrorType.response:
        CloudToast.show('Server Err');
        break;
      case DioErrorType.cancel:
        break;
      case DioErrorType.other:
        CloudToast.show('网络出现问题');
        break;
    }
    super.onError(err, handler);
  }
}
