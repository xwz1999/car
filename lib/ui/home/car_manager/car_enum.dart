enum CarSource {
  carDealer(1, '车商'),
  individual(2, '个人直卖');

  final int sourceNum;
  final String sourceName;

  static CarSource getValue(int value) =>
      CarSource.values.firstWhere((element) => element.sourceNum == value);

  const CarSource(this.sourceNum, this.sourceName);
}
