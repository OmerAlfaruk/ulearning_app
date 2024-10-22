import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning/common/constant/constant.dart';
import 'package:ulearning/common/routes/names.dart';
import 'package:ulearning/global.dart';
import 'package:ulearning/pages/application/bloc/application_bloc.dart';
import 'package:ulearning/pages/application/bloc/application_event.dart';
import 'package:ulearning/pages/home/bloc/home_page_bloc.dart';
import 'package:ulearning/pages/home/bloc/home_page_event.dart';
import '../settings/widget/settings_widget.dart';
import 'bloc/setting_bloc.dart';
import 'bloc/setting_state.dart';


class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  void removeUserData(){
    context.read<ApplicationBloc>().add(TriggerAppEvent(0));
    context.read<HomePageBloc>().add(HomePageDots(0));
    Global.storageService.remove(AppConstants.STORAGE_USER_TOKEN_KEY);
    Global.storageService.remove(AppConstants.STORAGE_USER_PROFILE_KEY);

    Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.SIGNIN,(route)=>false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        child: BlocBuilder<SettingBloc, SettingState>(
          builder: (context, state) {
            return Container(
              child: Column(
                children: [
                  settingsButton(context,removeUserData)
                ],
              ),
            );
          },
        ),
      ),
    );
  }


}
