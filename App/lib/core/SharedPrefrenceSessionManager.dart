
import 'package:encrypt/encrypt.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceUtils{
  static Future<SharedPreferences> get _instance async => _prefInstance ??= await SharedPreferences.getInstance();
  static SharedPreferences? _prefInstance;
  static Future<SharedPreferences?> init() async{
    _prefInstance = await _instance;
    return _prefInstance;
  }

  // Example key for encryption. Keep this key secure and do not hardcode it in a real app.
  static final _key = Key.fromUtf8('12345678901234561234567890123456'); // 32 chars
  static final _iv = IV.fromLength(16);
  static final _encrypter = Encrypter(AES(_key,mode: AESMode.cbc));

  // static String getString(String key,[String? defValue]){
  //   return _prefInstance?.getString(key) ?? defValue ?? "";
  // }
  //New code
  static String getString(String key, [String? defValue]) {
    String? encryptedValue = _prefInstance?.getString(key);
    if (encryptedValue == null) {
      return defValue ?? "";
    }
    try {
      final decrypted = _encrypter.decrypt(Encrypted.fromBase64(encryptedValue), iv: _iv);
      return decrypted;
    } catch (e) {
      return defValue ?? "";
    }
  }
  // static Future<bool> setString(String key,String value) async{
  //   var prefs = await _instance;
  //   return prefs.setString(key, value);
  // }
  //New code
  static Future<bool> setString(String key,String value) async{
    var prefs = await _instance;
    final encrypted = _encrypter.encrypt(value, iv: _iv);
    return prefs.setString(key, encrypted.base64);
  }

  // static String remove(String key,[String? defValue]) {
  //    return _prefInstance?.remove(key) ?? "";
  //  // return prefs.remove(key);
  // }
  static Future<bool> remove(String key) async{
    var prefs = await _instance;
    return prefs.remove(key);
  }

  static Future<bool> setBool(String key,bool? value) async{
    var prefs = await _instance;
    return prefs.setBool(key, value!);
  }
  static bool getBool(String key,[bool? value]) {
    //var prefs = await _instance;
    return _prefInstance?.getBool(key) ?? value ?? false;
    // return _prefInstance?.getString(key) ?? defValue ?? "";
  }

}



