part of 'api.dart';

class _Order {
  _OrderStatistic orderStatistic = _OrderStatistic();

  ///寄卖订单->寄卖订单列表
  get consignmentLists => '/order/consignment/lists';

  ///寄卖订单->发布车辆 个人
  get consignmentPublish => '/order/consignment/publish';

  ///邀约
  get inviteAdd => '/order/invite/add';

  ///售车订单->售车订单列表
  get saleLists => '/order/sale/lists';

  ///上传检车报告
  get saleTestrepord => '/order/sale/test_report';

  ///过户
  get scaleTransfer => '/order/sale/transfer';

  ///完结订单
  get saleFinal => '/order/sale/final';

  ///叫车订单->添加叫车订单
  get carAdd => '/order/call/car/add';

  ///交车
  get carFinal => '/order/call/car/final';

  ///添加车商寄卖订单 车商发布订单
  get addConsignment => '/order/dealer/consignment/add';

  ///车商寄卖订单
  get dealerConsignmentOrderPage => '/order/dealer/consignment/lists';

  ///寄卖订单详情
  get consignmentInfo => '/order/consignment/info';

  ///发布车辆详情
  get consignmentInfoCar => '/order/consignment/info/car';

  ///发布车辆编辑
  get consignmentPublishEdit => '/order/consignment/publish/edit';

  ///售车订单详情
  get saleInfo => '/order/sale/info';
}

class _OrderStatistic {
  ///订单统计数据
  String get data => '/order/call/car/lists';
}
