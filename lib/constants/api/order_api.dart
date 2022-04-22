part of 'api.dart';

class _OrderApi {
  _Consignment consignment = _Consignment();
  _Dealerconsignment dealerconsignment = _Dealerconsignment();
  _Inviteadd inviteAdd = _Inviteadd();
  _Sale sale = _Sale();
  _Callcar callcar = _Callcar();
}

//寄卖订单
class _Consignment {
  //寄卖订单->寄卖订单列表
  get consignmentLists => '/order/consignment/lists';

//寄卖订单->发布车辆
  get consignmentPublish => '/order/consignment/publish';
}

//车商寄卖订单
class _Dealerconsignment {
  get dealerconsignment => '/order/dealer/consignment/add';
}

//邀约
class _Inviteadd {
  get inviteadd => '/order/invite/add';
}

//售车订单
class _Sale {
  //售车订单->售车订单列表
  get saleLists => '/order/sale/lists';

//售车订单详情
  get saleInfo => '/order/sale/info';
//上传检车报告
  get saleTestrepord => '/order/sale/test_report';

//过户
  get scaleTransfer => '/order/sale/transfer';

//完结订单
  get saleFinal => '/order/sale/final';
}

//叫车订单
class _Callcar {
  //叫车订单->添加叫车订单
  get carAdd => '/order/call/car/add';

//交车
  get carFinal => '/order/call/car/final';
}
