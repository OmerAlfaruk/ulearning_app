import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/common/widgets/base_text/base_text_widget.dart';
import 'package:ulearning/pages/course/course_detail/bloc/course_detail_bloc.dart';
import 'package:ulearning/pages/course/course_detail/bloc/course_detail_state.dart';
import 'package:ulearning/pages/course/course_detail/course_detail_controller.dart';
import 'package:ulearning/pages/course/course_detail/widget/course_detail_widget.dart';

class CourseDetails extends StatefulWidget {
  const CourseDetails({super.key});

  @override
  State<CourseDetails> createState() => _CourseDetailsState();
}

class _CourseDetailsState extends State<CourseDetails> {
  late CourseDetailController _courseDetailController;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _courseDetailController = CourseDetailController(context: context);
    _courseDetailController.init();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CourseDetailBloc, CourseDetailState>(
      builder: (context, state) {
        if(state.courseItem==null){
          return Center(child: CircularProgressIndicator(
            backgroundColor: Colors.blue,
          ));
        }
        print('----my items ${state.courseItem!.description.toString()}');
        return Container(
          color: Colors.white,
          child: SafeArea(
            child: Scaffold(
                backgroundColor: Colors.white,
                appBar: buildAppbar(),
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding:
                        EdgeInsets.symmetric(vertical: 15.h, horizontal: 25.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // cover photo
                            thumbnail(state.courseItem!.thumbnail.toString()),
                            SizedBox(
                              height: 15.h,
                            ),
                            // three buttons or menus
                            menuView(),
                            SizedBox(
                              height: 15.h,
                            ),
                            // course description title
                            reusableText(text: "Course Description"),
                            SizedBox(
                              height: 15.h,
                            ),
                            // course description
                            descriptionText(state.courseItem!.description.toString()),
                            SizedBox(
                              height: 20.h,
                            ),
                            // go buy button
                            GestureDetector(
                              onTap: ()=>_courseDetailController.goBuy(state.courseItem!.id),

                                child: goBuyButton('Go Buy')),
                            SizedBox(
                              height: 20.h,
                            ),
                            //course summary title
                            courseSummary(),
                            //course summary title
                            courseSummaryView(context,state),
                            SizedBox(
                              height: 20.h,
                            ),
                            // course lesson title
                            reusableText(text: "Lesson List"),
                            //course lesson List
                            courseLessonList(),

                          ],
                        ),
                      ),
                    ],
                  ),
                )),
          ),
        );
      },
    );
  }


}
