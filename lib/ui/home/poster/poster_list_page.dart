import 'package:cloud_car/constants/api/api.dart';
import 'package:cloud_car/model/poster/poster_list_model.dart';
import 'package:cloud_car/ui/home/poster/poster_edit_page.dart';
import 'package:cloud_car/ui/home/poster/poster_func.dart';
import 'package:cloud_car/utils/headers.dart';
import 'package:cloud_car/utils/new_work/api_client.dart';
import 'package:cloud_car/utils/new_work/inner_model/base_list_model.dart';
import 'package:cloud_car/utils/toast/cloud_toast.dart';
import 'package:cloud_car/widget/button/cloud_back_button.dart';
import 'package:cloud_car/widget/cloud_image_network_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class PosterListPage extends StatefulWidget {
  const PosterListPage({super.key});

  @override
  _PosterListPageState createState() => _PosterListPageState();
}

class _PosterListPageState extends State<PosterListPage> {
  List<PosterListModel> _models = [];
  int _page = 1;
  final int _size = 10;
  final EasyRefreshController _easyRefreshController = EasyRefreshController();
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _easyRefreshController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CloudBackButton(),
        title: const Text('海报'),
        foregroundColor: Colors.white,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(32.w),
          child: EasyRefresh(
              firstRefresh: true,
              header: MaterialHeader(),
              footer: MaterialFooter(),
              scrollController: _scrollController,
              controller: _easyRefreshController,
              onRefresh: () async {
                _page = 1;
                _models = await PosterFunc.getPosterList(page: _page);
                setState(() {});
              },
              onLoad: () async {
                _page++;
                BaseListModel baseList = await apiClient.requestList(
                    API.poster.list,
                    data: {"page": _page, "size": _size});
                if (baseList.code == 0) {
                  if (baseList.nullSafetyTotal > _models.length) {
                    _models.addAll(baseList.nullSafetyList
                        .map((e) => PosterListModel.fromJson(e))
                        .toList());
                    setState(() {});
                  } else {
                    _easyRefreshController.finishLoad(noMore: true);
                  }
                } else {
                  CloudToast.show(baseList.msg);
                }
              },
              child: Wrap(
                 runSpacing: 16.w,
                spacing: 12.w,
                children: _models.map((e) => _buildCard(e)).toList(),
              )),
        ),
      ),
    );
  }

  Widget _buildCard(PosterListModel model) {
    return GestureDetector(
      onTap: (){
        Get.to(()=> PosterEditPage(model: model,));
      },
      child: Container(
        width: 220.w,
        height: 396.w,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.w)),
        child: CloudImageNetworkWidget(
          urls: [model.path],
        ),
      ),
    );
  }
}
