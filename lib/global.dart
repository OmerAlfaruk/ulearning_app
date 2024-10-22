import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:ulearning/common/routes/bloc_observer.dart';
import 'package:ulearning/common/service/storage_service.dart';
import 'package:ulearning/firebase_options.dart';

class Global{
  static late StorageService storageService;
  static Future init() async{
    WidgetsFlutterBinding.ensureInitialized();
Bloc.observer=MyGlobalObserver();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform
    );
    storageService=await StorageService().init();
  }

}