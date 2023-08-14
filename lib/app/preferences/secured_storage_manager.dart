import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecuredStorageManager {
  final _secureStorage = const FlutterSecureStorage();
  static const String authToken = 'token';
  AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );
  Future<void> writeAuthToken(String token) async {
    await _secureStorage.write(
        key: authToken, value: token, aOptions: _getAndroidOptions());
  }

  Future<String?> readAuthToken() async {
    var readData = await _secureStorage.read(
        key: authToken, aOptions: _getAndroidOptions());
    return readData;
  }

  Future<void> deleteSecureData() async {
    await _secureStorage.delete(key: authToken, aOptions: _getAndroidOptions());
  }
}
