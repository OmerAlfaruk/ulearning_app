import 'package:bloc/bloc.dart';

import 'course_detail_event.dart';
import 'course_detail_state.dart';


class CourseDetailBloc extends Bloc<CourseDetailEvent, CourseDetailState> {
  CourseDetailBloc() : super(const CourseDetailState()) {
    on<TriggerCourseDetail>(_triggerCourseDetail);
  }

 void _triggerCourseDetail(TriggerCourseDetail event,Emitter<CourseDetailState> emit){

    emit(state.copyWith(courseItem: event.courseItem));
  }
}
