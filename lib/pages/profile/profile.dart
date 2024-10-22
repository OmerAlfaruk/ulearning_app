import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/pages/profile/widgets/profile_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(

      child: Scaffold(
        backgroundColor: Colors.white,

        appBar: buildAppBar(),
        body: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                profileIconAndEditButton(),
                SizedBox(height: 10.h,),
                Text("omer"),
                SizedBox(height: 15.h,),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: buildListView(context),
                ),
              ],
            ),
          ),

        ),
      
      ),
    );
  }


}
