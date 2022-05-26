///性别
enum Gender {
  unknown(0, '未知'),
  male(1, '男'),
  female(2, '女');

  final int typeNum;
  final String typeStr;
  static Gender getValue(int value) =>
  Gender.values.firstWhere((element) => element.typeNum ==value);
  const Gender(this.typeNum, this.typeStr);
}
