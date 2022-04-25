class Config {
  ///用户根目录
  static const String homeDir = '/users/datang';

  ///包名
  static const String packageName = 'cloud_car';

  ///打包目录
  static String get buildPath =>
      './build/app/outputs/flutter-apk/app-release.apk';

  ///测试包文件夹
  static String get apkDevDir => '$homeDir/team/cloud/cloud_car/dev';

  ///正式包文件夹
  ///
  ///
  ///
  static String get apkDir => '$homeDir/team/bee/cloud_car/release';
}
