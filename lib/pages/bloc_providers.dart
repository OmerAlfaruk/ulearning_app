import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning/pages/home/bloc/home_page_bloc.dart';

import 'package:ulearning/pages/sign_in/bloc/sign_in_bloc.dart';
import 'package:ulearning/pages/sign_up/bloc/sign_up_bloc.dart';
import 'package:ulearning/pages/welcome/bloc/welcome_bloc.dart';

class AppBlocProviders{
  static get allBlocProviders=>[
    BlocProvider(
      create: (context) => WelcomeBloc(),
    ),
    // BlocProvider(
    //   create: (context) => AppBlocs(),
    // ),
    BlocProvider(
      create: (context) => SignInBloc(),
    ),
    BlocProvider(
      create: (context) => SignUpBloc(),
    ),  BlocProvider(
      create: (context) => HomePageBloc(),
    ),
  ];
}