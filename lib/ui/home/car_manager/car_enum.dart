enum CarSource {
  carDealer(1, '车商'),
  individual(2, '个人直卖');

  final int sourceNum;
  final String sourceName;

  static CarSource getValue(int value) =>
      CarSource.values.firstWhere((element) => element.sourceNum == value);

  const CarSource(this.sourceNum, this.sourceName);
}

enum CarManageType {
  person(3, '个人寄卖'),
  all(2, '门店车辆'),
  company(1, '公司车辆');

  final int typeNum;
  final String typeStr;

  const CarManageType(this.typeNum, this.typeStr);
}

enum Release{
  record(1,'发布记录'),
  modify(2,'修改记录'),
  mine(3,'发布审批'),
  modifyExamine(4,'修改审批');
  final int typeNum;
  final String typeStr;
  const Release(this.typeNum,this.typeStr);
}