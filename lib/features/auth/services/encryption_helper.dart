import 'package:encrypt/encrypt.dart' as encrypt;

class EncryptionHelper {
  static final _key = encrypt.Key.fromUtf8('My32lengthSecretKeyForAES1234567890'); // Must be 32 chars
  static final _iv = encrypt.IV.fromLength(16); // Initialization vector

  static String encryptText(String text) {
    final encrypter = encrypt.Encrypter(encrypt.AES(_key));
    final encrypted = encrypter.encrypt(text, iv: _iv);
    return encrypted.base64;
  }

  static String decryptText(String encryptedText) {
    final encrypter = encrypt.Encrypter(encrypt.AES(_key));
    final decrypted = encrypter.decrypt64(encryptedText, iv: _iv);
    return decrypted;
  }
}
