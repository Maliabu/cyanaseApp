class Env {
  static const env = String.fromEnvironment('ENV', defaultValue: 'prod');

  static String get baseUrl {
    switch (env) {
      case 'dev':
        return 'http://192.168.8.101:8000'; // your local backend
      case 'prod':
      default:
        return 'https://server.cyanase.app';
    }
  }
}
