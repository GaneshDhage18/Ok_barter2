import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Tokens {
  static String? _accessToken;
  static String? _refreshToken;

  static String? get accessToken => _accessToken;

  static Future<String?> get refreshToken async {
    if (_refreshToken != null) return _refreshToken;

    final FlutterSecureStorage storage = FlutterSecureStorage();

    _refreshToken = await storage.read(key: "refreshToken");

    return _refreshToken;
  }

  save({required String accessToken, required String refreshToken}) async {
    _accessToken = accessToken;
    _refreshToken = refreshToken;
    final FlutterSecureStorage storage = FlutterSecureStorage();
    await storage.write(key: "refreshToken", value: refreshToken);
  }

  clear() {
    _accessToken = null;
    _refreshToken = null;
    final FlutterSecureStorage storage = FlutterSecureStorage();
    storage.delete(key: "refreshToken");
  }
}
