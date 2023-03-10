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
  all(0, '直卖车辆'),
  personal(1, '我的车辆');

  final int typeNum;
  final String typeStr;

  const CarManageType(this.typeNum, this.typeStr);
}
