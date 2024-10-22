import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:ulearning/common/apis/course_api.dart';
import 'package:ulearning/common/entities/course.dart';
import 'package:ulearning/common/widgets/flutter_toast/flutter_toast.dart';
import 'package:ulearning/pages/course/course_detail/bloc/course_detail_bloc.dart';
import 'package:ulearning/pages/course/course_detail/bloc/course_detail_event.dart';

class CourseDetailController {
  final BuildContext context;

  CourseDetailController({required this.context});

  void init() async {
    // Ensure you retrieve the arguments correctly
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    final int? courseId = args['id'];

    if (courseId != null) {
      // Load the data after receiving the course ID
      await asyncLoadAllData(courseId);
    } else {
      // Handle missing or incorrect ID scenario
      toastInfo(msg: 'Invalid course ID');
      print('Course ID is null or invalid');
    }
  }

  Future<void> asyncLoadAllData(int? id) async {
    CourseRequestEntity courseRequestEntity = CourseRequestEntity();
    courseRequestEntity.id = id;

    // Call the API to fetch course details
    var result = await CourseApi.courseDetail(params: courseRequestEntity);


      // If data is successfully fetched, add it to the Bloc
      if(context.mounted){
        context.read<CourseDetailBloc>().add(TriggerCourseDetail(result.data!));
        print('Course details loaded: ${result.data}');
      }

     else {
      // Handle the error
      print('context is not available');
    }
  }
  Future<void> goBuy(int? id) async {
    EasyLoading.show(
      indicator: CircularProgressIndicator(),
      maskType: EasyLoadingMaskType.clear,
      dismissOnTap: true,
    );
    CourseRequestEntity courseRequestEntity=CourseRequestEntity();
    courseRequestEntity.id=id;
    var result=await CourseApi.coursePay(params: courseRequestEntity);

    EasyLoading.dismiss();
    if(result.code==200){
      //cleaner format of url
      var url=Uri.decodeFull(result.data!);
      print('----- my returned stripe url is $url ----- ');

    }
    else{
      print('---------Failed payment---------');
    }
  }
}
