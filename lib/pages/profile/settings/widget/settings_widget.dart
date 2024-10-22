import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/common/constant/constant.dart';
import 'package:ulearning/common/entities/colors/color.dart';
import 'package:ulearning/common/routes/names.dart';
import 'package:ulearning/common/widgets/base_text/base_text_widget.dart';
import 'package:ulearning/global.dart';

AppBar buildAppBar(){
  return AppBar(
    title: Container(
      child: Container(
        child: Center(child: reusableText(text: "Settings"),)),
      ),
    );

}


//Logout



Widget settingsButton(BuildContext context,void Function()? func) {
  return GestureDetector(
    onTap: (){
      showDialog(context: context, builder: (BuildContext context){
        return AlertDialog(
          title: Text("Confirm Logout"),
          content:Text("Confirm Logout"),
          actions: [
            TextButton(onPressed: ()=>Navigator.of(context).pop(), child: Text("Cancel"),),
            TextButton(onPressed: func,
                child: Text("Confirm"))
          ],
        );
      });
    },
    child: Container(
      height: 100.h,
      decoration: const BoxDecoration(

          image: DecorationImage(image:AssetImage ("assets/icons/Logout.png",),
              fit: BoxFit.fitHeight
          )
      ),
    ),
  );
}