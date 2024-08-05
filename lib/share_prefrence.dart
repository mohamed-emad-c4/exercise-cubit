import 'package:shared_preferences/shared_preferences.dart';

class SharePrefrenceClass{
  
  //save counter value
  Future<void> saveCounter({required int counter})async{
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setInt('counter', counter);
  }

  //get counter value
  Future<int> getCounter({required String key})async{
    final SharedPreferences pref = await SharedPreferences.getInstance();
   int counter = pref.getInt(key) ?? 0;
    return counter;
  }


}