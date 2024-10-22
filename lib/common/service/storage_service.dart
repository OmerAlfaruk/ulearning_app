import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:ulearning/common/constant/constant.dart';
import 'package:ulearning/common/entities/entities.dart';

class StorageService{
  late final SharedPreferences _prefs;
  Future<StorageService> init()async{
    _prefs=await SharedPreferences.getInstance();
    return this;
  }
Future<bool> setBool(String key,bool value) async {
    return await _prefs.setBool(key, value);
}
 bool getDeviceFirstOpen(){
   return _prefs.getBool(AppConstants.STORAGE_DEVICE_OPEN_FIRST_TIME)??false;
 }
  Future<bool> setString(String key,String value) async {
    return await _prefs.setString(key, value);
  }
  String getUserToken(){
    return _prefs.getString(AppConstants.STORAGE_USER_TOKEN_KEY)??"";
  }
  bool getIsLogged(){
    return _prefs.getString(AppConstants.STORAGE_USER_TOKEN_KEY)==null?false:true;
  }
  Future<bool> remove(String key){
    return _prefs.remove(key);

  }
   UserItem getUserProfile(){
    var profileOffline=_prefs.getString(AppConstants.STORAGE_USER_PROFILE_KEY);

    return  UserItem.fromJson(jsonDecode(profileOffline!));
      


  }
}