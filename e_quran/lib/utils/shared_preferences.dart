import 'package:shared_preferences/shared_preferences.dart';

const String keyToken = 'token';
const String keyPassword='key_password';

void SaveToken({
  required String key,
  required String valueToken,
}) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  await prefs.setString(key, valueToken);
}

Future<String> getValue(String value) async{
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  String? _value = prefs.getString(value);
  return _value ?? "";
}

void RemoveToken(String value) async{
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  await prefs.remove(value);
}
