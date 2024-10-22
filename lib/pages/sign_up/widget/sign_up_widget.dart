import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/common/entities/colors/color.dart';

AppBar buildAppBar() {
  return AppBar(
    title: Center(
      child: Text(
        'Sing Up',
        style: TextStyle(
            color: AppColors.primaryText,

            /// Thickness of the line
            fontSize: 16.sp,
            fontWeight: FontWeight.normal),
      ),
    ),
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(1.0),
      child: Container(
        color: AppColors.primarySecondaryBackground,
        height: 1.0,
      ),
    ),
  );
}




/// social Icons
GestureDetector reusableIcons({VoidCallback? onTap, required String iconName}) {
  return GestureDetector(
    onTap: onTap,
    child: SizedBox(
      width: 40.w,
      height: 40.w,
      child: Image.asset('assets/icons/$iconName.png'),
    ),
  );
}

Widget reusableText(String text) {
  return Container(
    margin: EdgeInsets.only(bottom: 5.h, top: 5.h),
    child: Text(
      text,
      style: TextStyle(
          color: Colors.grey.withOpacity(0.5),
          fontWeight: FontWeight.normal,
          fontSize: 14.sp),
    ),
  );
}

Widget buildTextField(String hintTExt, String textType, String iconName,void Function(String value)? onchange) {
  return Container(
    width: 325.w,
    height: 50.h,
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(15.w)),
        border: Border.all(color: AppColors.primaryFourElementText)),
    child: Row(
      children: [
        Container(
          width: 16.w,
          height: 16.h,
          child: Image.asset("assets/icons/$iconName.png"),
          margin: EdgeInsets.only(left: 17.w,),
        ),
        Container(

          width: 270.w,
          height: 50.h,
          margin: EdgeInsets.only(left: 5.w,),
          child: TextField(
            onChanged: (value)=>onchange!(value),
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              hintText: hintTExt,
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              hintStyle: const TextStyle(
                color: AppColors.primarySecondaryElementText,
              ),
            ),
            obscureText: textType == 'password' ? true : false,
            autocorrect: false,
            style: TextStyle(
              color: AppColors.primaryText,
              fontFamily: 'Avenir',
              fontWeight: FontWeight.normal,
              fontSize: 14.sp,
            ),
          ),
        ),
      ],
    ),
  );
}


Widget signupAndRegButton({required String buttonName,
  VoidCallback? onTap,
  Color? buttonColor,
  Color? buttonTextColor,
  String? buttonType,
}) {
  return  GestureDetector(
    onTap: () {
      print("Button tapped");
      if (onTap != null) {
        onTap();
      }
    },
    child: Container(
      width: 325.w,
      height: 50.h,
      margin: buttonType == 'signup'
          ? EdgeInsets.only(top: 40.h)
          : EdgeInsets.only(top: 20.h),
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(15.w),
        border: Border.all(
            color: buttonType == 'signup'
                ? Colors.transparent
                : AppColors.primaryFourElementText),
        boxShadow: [
          BoxShadow(
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 1),
            color: Colors.grey.withOpacity(0.1),
          )
        ],
      ),
      child: Center(
        child: Text(
          buttonName,
          style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.normal,
              color: buttonTextColor),
        ),
      ),
    ),
  );
}
