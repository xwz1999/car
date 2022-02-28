import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';



class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {

  List<dynamic>? data;

  late EasyRefreshController _refreshController;

 @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: Text('',style: Theme.of(context).textTheme.bodyText1,),
    );
  }


  @override
  bool get wantKeepAlive => true;
}

