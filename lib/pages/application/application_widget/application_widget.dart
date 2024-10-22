
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/common/entities/colors/color.dart';
import 'package:ulearning/pages/home/home.dart';
import 'package:ulearning/pages/profile/profile.dart';

Widget buildPage(int index){
  List<Widget> widget=[
   const HomePage(),
    const Center(child: Text('Search'),),
    const Center(child: Text('Course'),),
    const Center(child: Text('chat'),),
    const ProfilePage()
  ];
return widget[index];
}

var bottomTabs=[
  BottomNavigationBarItem(
    label: "home",
    icon: SizedBox(
      height: 15.h,
      width: 15.w,
      child: Image.asset("assets/icons/home.png"),
    ),
    activeIcon: SizedBox(
      height: 15.h,
      width: 15.w,
      child: Image.asset("assets/icons/home.png",color: AppColors.primaryElement,),
    ),
  ),
  BottomNavigationBarItem(
    label: "search",
    icon: SizedBox(
      height: 15.h,
      width: 15.w,
      child: Image.asset("assets/icons/search2.png"),
    ),
    activeIcon: SizedBox(
      height: 15.h,
      width: 15.w,
      child: Image.asset("assets/icons/search2.png",color: AppColors.primaryElement,),
    ),
  ),
  BottomNavigationBarItem(
    label: "course",
    icon: SizedBox(
      height: 15.h,
      width: 15.w,
      child: Image.asset("assets/icons/play-circle1.png"),
    ),
    activeIcon: SizedBox(
      height: 15.h,
      width: 15.w,
      child: Image.asset("assets/icons/play-circle1.png",color: AppColors.primaryElement,),
    ),
  ),
  BottomNavigationBarItem(
    label: "chat",
    icon: SizedBox(
      height: 15.h,
      width: 15.w,
      child: Image.asset("assets/icons/message-circle.png"),
    ),
    activeIcon: SizedBox(
      height: 15.h,
      width: 15.w,
      child: Image.asset("assets/icons/message-circle.png",color: AppColors.primaryElement,),
    ),
  ),
  BottomNavigationBarItem(
    label: "chat",
    icon: SizedBox(
      height: 15.h,
      width: 15.w,
      child: Image.asset("assets/icons/person2.png"),
    ),
    activeIcon: SizedBox(
      height: 15.h,
      width: 15.w,
      child: Image.asset("assets/icons/person2.png",color: AppColors.primaryElement,),
    ),
  ),
];