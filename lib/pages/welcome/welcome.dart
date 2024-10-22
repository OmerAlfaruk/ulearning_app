import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/common/constant/constant.dart';
import 'package:ulearning/common/entities/colors/color.dart';
import 'package:ulearning/global.dart';
import 'package:ulearning/pages/welcome/bloc/welcome_bloc.dart';

import 'bloc/welcome_event.dart';
import 'bloc/welcome_state.dart';


class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        body: BlocBuilder<WelcomeBloc, WelcomeState>(
          builder: (context, state) {
            return Container(
              margin: EdgeInsets.only(top: 34.h),
              width: 375.w,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  PageView(
                    controller: pageController,
                    onPageChanged: (index) {
                      state.page = index;
                      BlocProvider.of<WelcomeBloc>(context).add(WelcomeEvent());
                    },
                    children: [
                      _page(
                        index: 1,
                        context: context,
                        title: 'First see Learning',
                        subTitle:
                            "Forget about a for paper all knowledge in one learning",
                        buttonName: 'next',
                        imagePath: 'assets/images/reading.png',
                      ),
                      _page(
                        index: 2,
                        context: context,
                        title: 'Connect with Everyone',
                        subTitle:
                            "Always keep in touch with your friends Let's get connected! ",
                        buttonName: 'next',
                        imagePath: 'assets/images/boy.png',
                      ),
                      _page(
                        index: 3,
                        context: context,
                        title: 'Always Fascinated Learning',
                        subTitle:
                            "Anywhere anytime. the time is at our discretion so study whenever You want",
                        buttonName: 'get started',
                        imagePath: 'assets/images/man.png',
                      ),
                    ],
                  ),
                  Positioned(
                      bottom: 100.h,
                      child: DotsIndicator(
                        position: state.page,
                        dotsCount: 3,
                        decorator: DotsDecorator(
                          color: AppColors.primaryThirdElementText,
                          activeColor: AppColors.primaryElement,
                          size: Size.square(8.0),
                          activeSize: Size(18.0, 8),
                          activeShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                      ))
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _page(
      {required int index,
      required BuildContext context,
      required String buttonName,
      required String title,
      required String subTitle,
      required String imagePath}) {
    return Column(
      children: [
        SizedBox(
          width: 345.w,
          height: 345.h,
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          child: Text(
            title,
            style: TextStyle(
                color: AppColors.primaryText,
                fontSize: 24.sp,
                fontWeight: FontWeight.normal),
          ),
        ),
        Container(
          width: 375.w,
          padding: EdgeInsets.only(left: 30.w, right: 30.w),
          child: Text(
            subTitle,
            style: TextStyle(
                color: AppColors.primarySecondaryElementText,
                fontSize: 14.sp,
                fontWeight: FontWeight.normal),
          ),
        ),
        GestureDetector(
          onTap: () {
            if (index < 3) {
              pageController.animateToPage(
                  index,
                  duration: Duration(milliseconds: 500), curve: Curves.decelerate);
            } else {
              //Navigator.of(context).push(MaterialPageRoute(
                //  builder: (context) => MyHomePage(title: 'Ulearming')));
              Global.storageService.setBool(AppConstants.STORAGE_DEVICE_OPEN_FIRST_TIME, true);
              print("The value is ${Global.storageService.getDeviceFirstOpen()}");
              Navigator.of(context).pushNamedAndRemoveUntil("sign_in", (route)=>false);
            }
          },
          child: Container(
            margin: EdgeInsets.only(top: 60.h, left: 25.w, right: 25.h),
            width: 325.w,
            height: 50.h,
            child: Center(
                child: Text(
              buttonName,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.normal),
            )),
            decoration: BoxDecoration(
                color: AppColors.primaryElement,
                borderRadius: BorderRadius.all(
                  Radius.circular(15.w),
                ),
                boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.1))]),
          ),
        )
      ],
    );
  }
}
