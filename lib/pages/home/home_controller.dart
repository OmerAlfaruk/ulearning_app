import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning/common/apis/course_api.dart';
import 'package:ulearning/common/entities/entities.dart';
import 'package:ulearning/global.dart';
import 'package:ulearning/pages/home/bloc/home_page_bloc.dart';
import 'package:ulearning/pages/home/bloc/home_page_event.dart';

class HomeController{

  late BuildContext context;
  UserItem userProfile=Global.storageService.getUserProfile();

  static final  HomeController _singleton= HomeController._external();

  HomeController._external();
  //make sure you have original only one instance
  factory HomeController({required BuildContext context}){
    _singleton.context=context;
    return _singleton;
  }
  Future<void> init() async{
    //make sure that the user logged in and then make an api call
    if(Global.storageService.getUserToken().isNotEmpty){
      var result=await CourseApi.courseList();
      print("The result is ${result.data![0]}");
      if(result.code==200){
        if(context.mounted){
          context.read<HomePageBloc>().add(HomePageCourseItem(result.data!));}
      }
      else{
        print(result.code);
      }
    }

  }

}