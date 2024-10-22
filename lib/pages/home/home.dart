import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/common/entities/colors/color.dart';
import 'package:ulearning/common/routes/names.dart';
import 'package:ulearning/pages/home/home_controller.dart';
import 'package:ulearning/pages/home/widget/home_page_widget.dart';
import 'package:ulearning/common/entities/entities.dart';
import 'bloc/home_page_bloc.dart';
import 'bloc/home_page_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late UserItem userProfile;

  @override
  void initState() {
    super.initState();
// _homeController = HomeController(context: context);
// _homeController.init();

  }
  @override
  void didChangeDependencies(){
    super.didChangeDependencies;
    userProfile=HomeController(context: context).userProfile;
  }

  @override
  Widget build(BuildContext context) {
    return userProfile!=null?Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(userProfile!.avatar.toString()),
      body: BlocBuilder<HomePageBloc, HomePageState>(
        builder: (context, state) {
          // Check if courseItem is empty before accessing it
          if (state.courseItem.isEmpty) {
            HomeController(context: context).init();
            print("...............course is empty................");
            // Safely access the first item
          } else {
            // Handle the case where the course list is not empty
            print("............courses are available................");


          }
          return Container(
            margin: EdgeInsets.symmetric(vertical: 0, horizontal: 20.w),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: homePageText("Hello",
                      top: 20.h, color: AppColors.primaryThirdElementText),
                ),
                SliverToBoxAdapter(
                  child: homePageText(
                    userProfile!.name!,
                    top: 5.h,
                    color: AppColors.primaryText,
                  ),
                ),
                SliverPadding(padding: EdgeInsets.only(top: 20.h)),
                SliverToBoxAdapter(child: searchView()),
                SliverToBoxAdapter(child: slidersView(context, state)),
                SliverToBoxAdapter(child: menuView()),
                SliverPadding(
                  padding:
                  EdgeInsets.symmetric(horizontal: 0.w, vertical: 18.h),
                  sliver: SliverGrid(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 15,
                        crossAxisSpacing: 15,
                        childAspectRatio: 1.6

                    ),
                    delegate: SliverChildBuilderDelegate(
                        childCount: state.courseItem.length,
                            (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: (){
                              Navigator.of(context).pushNamed(AppRoutes.COURSE_DETAILS,arguments: {
                                "id":state.courseItem.elementAt(index).id
                              });
                            },
                            child: courseGrid(state.courseItem[index]),
                          );
                        }),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    ):Container();
  }


}