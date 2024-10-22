
import 'package:ulearning/common/entities/course.dart';

abstract class HomePageEvent {
  const HomePageEvent();
}
class HomePageDots extends HomePageEvent{
  final int index;
  HomePageDots(this.index);
}
class HomePageCourseItem extends HomePageEvent{
  final List<CourseItem> courseItem;
  HomePageCourseItem(this.courseItem);

}
