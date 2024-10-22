import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/common/constant/constant.dart';
import 'package:ulearning/common/entities/colors/color.dart';
import 'package:ulearning/common/widgets/base_text/base_text_widget.dart';
import 'package:ulearning/pages/course/course_detail/bloc/course_detail_state.dart';

AppBar buildAppbar(){
  return AppBar(
    title: reusableText(text: "Course detail"),
  );
}
Widget thumbnail(String thumbnail) {


  return Container(
    width: 325.w,
    height: 200.h,
    decoration: BoxDecoration(
      image: DecorationImage(
        fit: BoxFit.fitWidth,
        image: NetworkImage("${AppConstants.SERVER_UPLOADS}$thumbnail"),
      ),
    ),
  );
}
Widget menuView(){
  return SizedBox(
    width: 325.w,

    child: Row(
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: (){},
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 5.h),
                  decoration: BoxDecoration(
                    color: AppColors.primaryElement,
                    borderRadius: BorderRadius.circular(7.w),
                    border: Border.all(color: AppColors.primaryElement)

                  ),
                  child: reusableText(
                      text: "Author Page",
                      color: AppColors.primaryElementText,
                    fontWeight: FontWeight.normal,
                    fontSize: 10.sp
                  ),
                ),
            ),
            _iconAndNum("assets/icons/people.png", 0),
            _iconAndNum("assets/icons/star.png", 0),
          ],
        )
      ],
    ),
  );
}
Widget _iconAndNum(String iconPath,int num){
  return Container(
    margin: EdgeInsets.only(left: 30.h),
    child: Row(children: [
      Image(image: AssetImage(iconPath),
      width: 20.w,
      height: 20.h,),
      reusableText(text:num.toString(),
      color: AppColors.primaryThirdElementText,fontSize: 11.sp,fontWeight: FontWeight.normal)
    ],),

  );
}
Widget goBuyButton(String name){
  return Container(
    padding: EdgeInsets.only(top:13.h),
    width: 330,
    height: 50.h,
    decoration: BoxDecoration(
      color: AppColors.primaryElement,
      borderRadius: BorderRadius.circular(10.w),
      border: Border.all(color: AppColors.primaryElement)
    ),
    child: Text(name,textAlign: TextAlign.center,style: TextStyle(color: AppColors.primaryElementText,fontSize: 11.sp),),
  );
}
Widget descriptionText(String description) {
  return reusableText(
      text:description,
       color: AppColors.primaryThirdElementText,
      fontWeight: FontWeight.normal,
      fontSize: 11.sp);
}
Widget courseSummary(){
  return reusableText(text: "The course includes",fontSize: 16.sp);
}

Widget  courseSummaryView(BuildContext context,CourseDetailState state){
  /// Setting sections buttons

  var imageInfo=<String,String>{
    "${state.courseItem!.video_length??"0"} Hours video ":"video_detail.png",
    "Total ${state.courseItem!.lesson_num??"0"} lessons":"file_detail.png",
    "${state.courseItem!.downloadable_res??"0"} Downloadable resources":"download_detail.png",

  };

  return Column(
    children: [
      ...List.generate(imageInfo.length, (index)=>
          GestureDetector(
            onTap: (){},
            child: Container(
              margin: EdgeInsets.only(top: 15.h),
              child: Row(
                children: [
                  Container(

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.w),
                      color: AppColors.primaryElement,
                    ),

                    child: Image.asset("assets/icons/${imageInfo.values.elementAt(index)}",width: 30.w,
                      height: 30.h,),),
                  SizedBox(width: 15.w,),
                  Text(imageInfo.keys.elementAt(index),style: TextStyle(
                      color: AppColors.primarySecondaryElementText,
                      fontWeight: FontWeight.bold,
                      fontSize: 11.sp
                  ),),
                ],
              ),
            ),


          ))
    ],
  );
}
Widget courseLessonList(){
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
    width: 325.w,
    height: 80.h,
    decoration: BoxDecoration(
      color: Color.fromRGBO(255, 255, 255, 1),
      borderRadius: BorderRadius.circular(10.w),
      boxShadow: [BoxShadow(
        color: Colors.grey.withOpacity(0.1),
        spreadRadius: 2,
        blurRadius: 3,
        offset: Offset(0,1),
      )]

    ),
    child: InkWell(
      onTap: (){},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(

                width: 60.w,
                height: 60.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.w),

                    image: DecorationImage(
                      fit: BoxFit.fill,
                        image:AssetImage( 'assets/icons/image_1.png') )

              ),
              ),Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // list item title
                  listContainer(),
                  // list item description
                  listContainer(fontSize: 10,color: AppColors.primaryThirdElementText,fontWeight:FontWeight.normal),
                ],
              ), ],
          ),
          Container(
            child: Image(height: 24.h,
                width: 24.h,
                image: AssetImage('assets/icons/arrow_right.png')),
          )
        ],
      ),
    ),
  );
}

Container listContainer({double fontSize=13,Color color=AppColors.primaryText, FontWeight fontWeight=FontWeight.bold}) {
  return Container(
                  margin: EdgeInsets.only(left: 6.w),
                  width: 200.w,
                  child: Text(
                    "UI design",
                    overflow: TextOverflow.clip,
                    maxLines: 1,
                    style: TextStyle(
                      color: color,
                      fontSize: fontSize.sp,
                      fontWeight: fontWeight
                    ),
                  ),
                );
}