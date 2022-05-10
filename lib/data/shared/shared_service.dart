import 'package:shared_preferences/shared_preferences.dart';

class SharedServices {
  static const String nicKey = "nic";
  static const String uidKey = "uid";

  static Future<String> getNic() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String nic = preferences.getString(nicKey) ?? "";
    return nic;
  }

  static Future<String> getUid() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String uid = preferences.getString(uidKey) ?? "";
    return uid;
  }

  static Future addUser({required String nic, required String uid}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(nicKey, nic);
    preferences.setString(uidKey, uid);
  }

  static Future removeUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove(nicKey);
    preferences.remove(uidKey);
  }

  static Future<bool> isUserIn() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final String nic = preferences.getString(nicKey) ?? "";
    return nic.isNotEmpty;
  }
}
