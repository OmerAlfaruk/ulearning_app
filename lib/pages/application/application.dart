import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/common/entities/colors/color.dart';
import 'package:ulearning/pages/application/application_widget/application_widget.dart';
import 'package:ulearning/pages/application/bloc/application_event.dart';
import 'bloc/application_bloc.dart';
import 'bloc/application_state.dart';


class ApplicationPage extends StatefulWidget {
  const ApplicationPage({super.key});
  @override
  State<ApplicationPage> createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ApplicationBloc, ApplicationState>(builder: (context, state) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: buildPage(state.index),
          bottomNavigationBar: Container(
            width: 375.w,
            height: 58.h,
            decoration: BoxDecoration(
                color: AppColors.primaryElement,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20.h),topRight: Radius.circular(20.h)),
              boxShadow: [BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                blurRadius: 1,
                spreadRadius: 1,
              )]
            ),
            child: BottomNavigationBar(
              onTap: (value) {
                context.read<ApplicationBloc>().add(TriggerAppEvent(value));
              },

              currentIndex: state.index,
              elevation: 0,
              type: BottomNavigationBarType.fixed,
              showUnselectedLabels: false,
              showSelectedLabels: false,
              selectedItemColor: AppColors.primaryText,
              unselectedItemColor: AppColors.primaryFourElementText,
              items:bottomTabs,
            ),
          ),
        ),
      ),
    );
  },
);
  }
}
