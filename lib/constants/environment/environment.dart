class AppENV {
  static final AppENV _instance = AppENV._();

  AppENV._();

  static AppENV get instance => _instance;

  ENVConfig env = ENVConfig.local;

  void setEnv(String environment) {
    switch (environment) {
      case 'dev':
        env = ENVConfig.dev;
        break;
      case 'release':
        env = ENVConfig.release;
        break;
      case 'local':
        env = ENVConfig.local;
        break;
      default:
        env = ENVConfig.local;
    }
  }
}

enum ENVConfig {
  dev,
  release,
  local,
}
