// unify BlocProviders,routes and pages
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning/global.dart';
import 'package:ulearning/pages/application/application.dart';
import 'package:ulearning/pages/application/bloc/application_bloc.dart';
import 'package:ulearning/pages/course/course_detail/bloc/course_detail_bloc.dart';
import 'package:ulearning/pages/home/bloc/home_page_bloc.dart';
import 'package:ulearning/pages/home/home.dart';
import 'package:ulearning/pages/profile/settings/bloc/setting_bloc.dart';
import 'package:ulearning/pages/profile/settings/setting.dart';
import 'package:ulearning/pages/sign_in/bloc/sign_in_bloc.dart';
import 'package:ulearning/pages/sign_in/sign_in.dart';
import 'package:ulearning/pages/sign_up/bloc/sign_up_bloc.dart';
import 'package:ulearning/pages/sign_up/sign_up.dart';
import 'package:ulearning/pages/welcome/bloc/welcome_bloc.dart';
import 'package:ulearning/pages/welcome/welcome.dart';

import '../../pages/course/course_detail/course_detail.dart';
import 'names.dart';

class AppPages {
  static List<PageEntity> routes() {
    return  [
      PageEntity(
        route: AppRoutes.INITIAL,
        page: const WelcomeScreen(),
        bloc: BlocProvider(
          create: (_) => WelcomeBloc(),
        ),
      ),

      PageEntity(
        route: AppRoutes.SIGNIN,
        page: const SignIn(),
        bloc: BlocProvider(
          create: (_) => SignInBloc(),
        ),
      ),

      PageEntity(
        route: AppRoutes.SIGNUP,
        page: const SignUp(),
        bloc: BlocProvider(
          create: (_) => SignUpBloc(),
        ),
      ),
      PageEntity(
        route: AppRoutes.APPLICATION,
        page: const ApplicationPage(),
        bloc: BlocProvider(
          create: (_) => ApplicationBloc(),
        ),
      ),
      PageEntity(
        route: AppRoutes.HOME_PAGE,
        page: const HomePage(),
        bloc: BlocProvider(
          create: (_) => HomePageBloc(),
        ),
      ),
      PageEntity(
        route: AppRoutes.SETTINGS_PAGE,
        page: const SettingPage(),
        bloc: BlocProvider(
          create: (_) => SettingBloc(),
        ),
      ),PageEntity(
        route: AppRoutes.COURSE_DETAILS,
        page: const CourseDetails(),
        bloc: BlocProvider(
          create: (_) => CourseDetailBloc(),
        ),
      ),


    ];
  }

  //return all the bloc providers

  static List<dynamic> allBlocProviders(BuildContext context){
    List<dynamic> blocProviders=<dynamic>[];
    for(var bloc in routes()){
      blocProviders.add(bloc.bloc);

    }
    return blocProviders;
  }
  /// model that covers entire screen as we click on navigator object
  static MaterialPageRoute generateRoutSettings(RouteSettings settings){
    if(settings.name!=null){
      // check for route name matching when navigator gets triggered
      var result=routes().where((element)=>element.route==settings.name);
      if(result.isNotEmpty){
        bool deviceFirstOpen=Global.storageService.getDeviceFirstOpen();

        if(result.first.route==AppRoutes.INITIAL&&deviceFirstOpen){

          bool isLoggedIn=Global.storageService.getIsLogged();

          if(isLoggedIn){
            return MaterialPageRoute(builder: (_)=>const ApplicationPage(),settings: settings);


          }
          return MaterialPageRoute(builder: (_)=>const SignIn(),settings: settings);
        }
        return  MaterialPageRoute(builder: (_)=>result.first.page,settings: settings);
      }

    }
    return MaterialPageRoute(builder: (_)=>const SignIn(),settings: settings);
  }
}

class PageEntity {
  String route;
  Widget page;
  dynamic bloc;

  PageEntity({required this.route, required this.page, this.bloc});
}