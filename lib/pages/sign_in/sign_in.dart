import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/common/entities/colors/color.dart';
import 'package:ulearning/pages/sign_in/bloc/sign_in_event.dart';
import 'package:ulearning/pages/sign_in/sign_in_controller.dart';
import 'package:ulearning/pages/sign_in/widget/sign_in_widget.dart';

import 'bloc/sign_in_bloc.dart';
import 'bloc/sign_in_state.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: buildAppBar(),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildThirdPartyLoginWidget(),
                    Center(
                        child: reusableText(
                            "Or use your email account to login")),
                    Container(
                      margin: EdgeInsets.only(top: 36.h),
                      padding: EdgeInsets.only(left: 25.w, right: 25.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          reusableText('Email'),
                          buildTextField(
                              'Enter Your email address', 'email', 'user', (value){
                            context.read<SignInBloc>().add(EmailEvent(value));
                          }),
                          reusableText('Password'),
                          buildTextField(
                              'Enter Your Password', 'password', 'lock',
                              (value){
                                context.read<SignInBloc>().add(PasswordEvent(value));
                              }

                          ),
                          forgotPassword(),
                          loginAndRegButton(
                              onTap: () async {
                                print("Button tapped");
                                await SignInController(context: context).handleSignIn('email');
                              },
                              buttonName: 'Login',
                              buttonColor: AppColors.primaryElement,
                              buttonTextColor: AppColors.primaryBackground,
                              buttonType: 'login'),
                          loginAndRegButton(
                            onTap: (){
                              Navigator.pushNamed(context,
                              '/sign_up');
                            },
                              buttonName: 'Register',
                              buttonColor: AppColors.primaryBackground,
                              buttonTextColor: AppColors.primaryText),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
