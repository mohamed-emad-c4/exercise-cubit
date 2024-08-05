import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharePrefrenceClass{
  ThemeData theTheme = ThemeData.light();
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
 Future<void> saveTheme({required bool counter})async{
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool('light', counter);
  }
    Future<bool> getTheme()async{
    final SharedPreferences pref = await SharedPreferences.getInstance();
   bool them = pref.getBool('light') ?? true;
    return them;
  }

}