// ignore_for_file: unused_element, unused_field

part of 'api.dart';

class _OrderApi {
  _Lists lists = _Lists();
  _Publish publish = _Publish();
}

//寄卖订单->寄卖订单列表
class _Lists {
  get consignmentLists => '/order/consignment/lists';
}
//寄卖订单->发布车辆

class _Publish {
  get consignmentPublish => '/order/consignment/publish';
}
