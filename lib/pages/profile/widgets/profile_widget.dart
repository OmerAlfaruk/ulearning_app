import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/common/entities/colors/color.dart';
import 'package:ulearning/common/routes/routes.dart';
import 'package:ulearning/common/widgets/base_text/base_text_widget.dart';
/// Profile App bar
AppBar buildAppBar(){
  return AppBar(
title: Container(
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      SizedBox(
        width: 18.w,
        height: 12.h,
        child: Image.asset("assets/icons/menu.png"),
      ),
      reusableText(text: "Profile"),
      SizedBox(
        width: 24.w,
        height: 24.h,
        child: Image.asset("assets/icons/more-vertical.png"),
      )
    ],
  ),
),
  );
}
/// Profile icon and Edit Button
Widget profileIconAndEditButton() {
  return Container(
    width: 80.w,
    height: 80.h,
    padding: EdgeInsets.only(right: 6.w),
    alignment: Alignment.bottomRight,

    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20.w),
      image: DecorationImage(image: AssetImage("assets/icons/headpic.png"),),

    ),
    child: Image(width: 25.w,
      height: 25.h,
      image: AssetImage("assets/icons/edit_3.png"),),
  );
}

/// Setting sections buttons

var imageInfo=<String,String>{
  "Settings":"settings.png",
  "payment details":"credit-card.png",
  "Achievement":"award.png",
  "Love":"heart(1).png",
  "Learning Reminders":"cube.png",

};
Widget buildListView(BuildContext context){
  return Column(
    children: [
      ...List.generate(imageInfo.length, (index)=>
      GestureDetector(
        onTap: ()=>Navigator.of(context).pushNamed(AppRoutes.SETTINGS_PAGE),
        child: Container(
          margin: EdgeInsets.only(bottom: 15.h),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(5.w),
                  width: 40.w,
                  height: 40.h,
                  child: Image.asset("assets/icons/${imageInfo.values.elementAt(index)}",),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.w),
                color: AppColors.primaryElement,
              ),),
              SizedBox(width: 15.w,),
              Text(imageInfo.keys.elementAt(index),style: TextStyle(
                  color: AppColors.primaryText,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp
              ),),
            ],
          ),
        ),


      ))
    ],
  );
}
