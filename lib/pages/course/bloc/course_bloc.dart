import 'package:bloc/bloc.dart';

import 'course_event.dart';
import 'course_state.dart';


class CourseBloc extends Bloc<CourseEvent, CourseState> {
  CourseBloc() : super(const CourseState()) {
    on<TriggerCourse>(_triggerCourse);
  }

 void _triggerCourse(TriggerCourse event,Emitter<CourseState> emit){

    emit(state.copyWith(courseItem: event.courseItem));
  }
}
