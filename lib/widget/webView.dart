import 'package:cloud_car/utils/headers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:url_launcher/url_launcher.dart';

class CloudWebView extends StatefulWidget {
  final String url;
  final String title;
  const CloudWebView({super.key, required this.url, required this.title});

  @override
  _CloudWebViewState createState() => _CloudWebViewState();
}

class _CloudWebViewState extends State<CloudWebView> {
  bool _isLoading = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      extendBody: false,
      body: Stack(
        children: [
          Container(
            margin:  EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            child: InAppWebView(
              initialUrlRequest: URLRequest(url: Uri.parse(widget.url) ),
              onReceivedServerTrustAuthRequest: (controller, challenge) async {
                //解决 handshake failed问题
                return ServerTrustAuthResponse(
                    action: ServerTrustAuthResponseAction.PROCEED);
              },
                onProgressChanged: (controller, progress) {
                  if (progress / 100 > 0.9999) {
                    setState(() {
                      _isLoading = false;
                    });
                  }
                },
            ),
          ),
          GestureDetector(
            onTap: (){
              Get.back();
            },
            child: Container(
              color: Colors.transparent,
              height: kToolbarHeight + MediaQuery.of(context).padding.top,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top,left: 40.w),
              child: Container(
                width: 80.w,
                height: 80.w,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(100, 0, 0, 0),
                    borderRadius: BorderRadius.circular(40.w)
                ),
                alignment: Alignment.center,
                padding: EdgeInsets.only(left: 10.w),
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 40.sp,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          _loading()
        ],
      ),
    );
  }

  _loading() {
    return _isLoading == true
        ? const DecoratedBox(
      decoration: BoxDecoration(color: Colors.white),
      child: Center(
        child: CircularProgressIndicator(
          valueColor:
          AlwaysStoppedAnimation<Color?>(kPrimaryColor),
          strokeWidth: 1.0,
        ),
      ),
    )
        : const Text('');
  }


  Future<void> _launchInBrowser(String url) async {
    ///打开webView中的url链接
    /// 先判断是否可以launch url
    if (await canLaunch(url)) {
      /// 如果可以则启动
      await launch(url);
    } else {
      print('${url}无法打开');
    }
  }

}
