import 'package:shared_preferences/shared_preferences.dart';

class UserDataFunc {
  cacheUserToken({required Map<String, dynamic> data}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', data['token']);

    await prefs.setString('userId', data['user_id']);
  }

  Future<Map<String, dynamic>?> get getLoggedInUserData async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? userId = prefs.getString('userId');
    final String? token = prefs.getString('token');
    if (userId != null) {
      return {"userId": userId, "token": token};
    }
  }

  Future<void> logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.clear();


  }
}
