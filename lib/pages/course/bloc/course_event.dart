import 'package:ulearning/common/entities/course.dart';

abstract class CourseEvent {

  const CourseEvent();
}
class TriggerCourse extends CourseEvent{

  const TriggerCourse(this.courseItem):super();
  final CourseItem courseItem;
}
