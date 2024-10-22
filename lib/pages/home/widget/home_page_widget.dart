import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/common/constant/constant.dart';
import 'package:ulearning/common/entities/colors/color.dart';
import 'package:ulearning/common/entities/course.dart';
import 'package:ulearning/common/widgets/base_text/base_text_widget.dart';
import 'package:ulearning/pages/home/bloc/home_page_bloc.dart';
import 'package:ulearning/pages/home/bloc/home_page_event.dart';
import 'package:ulearning/pages/home/bloc/home_page_state.dart';

AppBar buildAppBar(String avatar) {
  return AppBar(
    title: Container(
      margin: EdgeInsets.only(left: 7.w, right: 7.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 15.w,
            height: 12.h,
            child: Image.asset("assets/icons/menu.png"),
          ),
          GestureDetector(
            child: Container(
              width: 40.w,
              height: 40.h,
              decoration:  BoxDecoration(
                  image: DecorationImage(
                      image:NetworkImage("${AppConstants.SERVER_API_URL}$avatar"))),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget homePageText(String text,
    {Color color = AppColors.primaryText, double top = 20}) {
  return Container(
    margin: EdgeInsets.only(top: top),
    child: Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: 24.sp,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

Widget searchView() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        width: 280.w,
        height: 40.h,
        decoration: BoxDecoration(
            color: AppColors.primaryBackground,
            borderRadius: BorderRadius.circular(15.h),
            border: Border.all(color: AppColors.primaryFourElementText)),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 17.w),
              width: 16.w,
              height: 16.h,
              child: Image.asset("assets/icons/search.png"),
            ),
            SizedBox(
              width: 240.w,
              height: 40.h,
              child: TextField(
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(5, 5, 0, 5),
                  hintText: 'Search your course',
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  hintStyle: TextStyle(
                    color: AppColors.primarySecondaryElementText,
                  ),
                ),
                autocorrect: false,
                style: TextStyle(
                  color: AppColors.primaryText,
                  fontFamily: 'Avenir',
                  fontWeight: FontWeight.normal,
                  fontSize: 14.sp,
                ),
              ),
            )
          ],
        ),
      ),
      GestureDetector(
        child: Container(
          height: 40.h,
          width: 40.h,
          decoration: BoxDecoration(
            color: AppColors.primaryElement,
            borderRadius: BorderRadius.all(
              Radius.circular(13.w),
            ),
            border: Border.all(color: AppColors.primaryElement),
          ),
          child: Image.asset("assets/icons/options.png"),
        ),
      )
    ],
  );
}

Widget slidersView(BuildContext context,HomePageState state) {
  return Column(
    children: [
      Container(
        margin: EdgeInsets.only(top: 20.h),
        width: 375.w,
        height: 160.h,
        child: PageView(
          onPageChanged: (value){
            //print({value});
            context.read<HomePageBloc>().add(HomePageDots(value));
          },
          children: [
            _sliderContainer(path: "assets/icons/art.png"),
            _sliderContainer(path: "assets/icons/image_1.png"),
            _sliderContainer(path: "assets/icons/image_2.png"),
          ],
        ),
      ),
      DotsIndicator(
        dotsCount: 3,
        position: state.index,
        decorator: DotsDecorator(
          color: AppColors.primaryThirdElementText,
          activeColor: AppColors.primaryElement,
          size: const Size.square(5.0),
          activeSize: const Size(17.0, 5.0),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          )
        ),
      )
    ],
  );
}

Widget _sliderContainer({String path = "assets/icons/art.png"}) {
  return Container(
    width: 375.w,
    height: 160.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(
        Radius.circular(20.h),
      ),
      image: DecorationImage(
        image: AssetImage(path),
      ),
    ),
  );
}
Widget menuView(){
  return Column(
    children: [
      Container(
        width: 325.w,
        margin:EdgeInsets.only(top: 15.h) ,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            reusableText(
              text: "choose your course",
              color: AppColors.primaryText,
              fontSize: 16
            ),
            GestureDetector(
              child: reusableText(
                color: Colors.grey,
                text: 'select all',
                fontSize: 10,
                fontWeight: FontWeight.normal
              ),
            ),

          ],
        ),
      ),
      Container(
        margin: EdgeInsets.only(top: 20.w),
        child: Row(
        children: [
          reusableMenuText(
            backgroundColor: AppColors.primaryElement,
            menuText: 'All',
            textColor: AppColors.primaryElementText,
          ), reusableMenuText(
            menuText: 'Popular',
          ), reusableMenuText(
            menuText: 'Newest',

          ),
        ],
      ),)
    ],
  );
}

//menu buttons

Container reusableMenuText({String? menuText,Color backgroundColor=Colors.transparent,Color textColor=AppColors.primaryThirdElementText,Color borderColor=Colors.transparent}) {
  return Container(
    margin: EdgeInsets.only(right: 20.w),

          decoration: BoxDecoration(
            color: backgroundColor,//,
            borderRadius: BorderRadius.circular(7.w),
            border: Border.all(color: borderColor),

          ),
          padding: EdgeInsets.only(left: 15.w,right: 15.w,top: 5.h,bottom: 5.h),
          child:reusableText(text: menuText,
              color:textColor ,//AppColors.primaryElementText,
              fontWeight: FontWeight.bold,fontSize: 11),

        );
}


//course grid view
Container courseGrid(CourseItem item) {
  return Container(
    padding:EdgeInsets.all(12.w),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.w),
        image: DecorationImage(
          fit: BoxFit.fill,
          image: NetworkImage(AppConstants.SERVER_UPLOADS+item.thumbnail!),
        )
    ),
    child:  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
         item.name??'',
          maxLines: 1,
          textAlign: TextAlign.left,
          overflow: TextOverflow.fade,
          softWrap: false,
          style: TextStyle(
            color: AppColors.primaryElementText,
            fontWeight: FontWeight.bold,
            fontSize: 11.sp,

          ),
        ) ,
        SizedBox(height: 5.h,),
        Text(
          item.description??'',
          maxLines: 1,
          textAlign: TextAlign.left,
          overflow: TextOverflow.fade,
          softWrap: false,
          style: TextStyle(
            color: AppColors.primaryThirdElementText,
            fontWeight: FontWeight.normal,
            fontSize: 8.sp,

          ),
        )
      ],
    ),

  );
}