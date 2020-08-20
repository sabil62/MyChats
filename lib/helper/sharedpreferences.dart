import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencess {
  //static String sharedpreferncesLogInkey login='LOGIN';
//set functions
  Future<bool> setSharedPreferenceLogin(bool isUserLoggedIn) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setBool('ISLOGGEDIN', isUserLoggedIn);
  }

  Future<bool> setSharedPreferenceUsername(String username) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString('USERNAMEKEY', username);
  }

  Future<bool> setSharedPreferenceEmail(String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString('USEREMAILKEY', email);
  }

//get functions--------------------------------------------------
  Future<bool> getSharedPreferenceLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.getBool('ISLOGGEDIN');
  }

  Future<String> getSharedPreferenceUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.getString('USERNAMEKEY');
  }

  Future<String> getSharedPreferenceEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.getString('USEREMAILKEY');
  }
}
