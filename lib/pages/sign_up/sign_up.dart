import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/common/entities/colors/color.dart';
import 'package:ulearning/pages/sign_up/bloc/sign_up_event.dart';
import 'package:ulearning/pages/sign_up/sign_up_controller.dart';
import 'package:ulearning/pages/sign_up/widget/sign_up_widget.dart';

import 'bloc/sign_up_bloc.dart';
import 'bloc/sign_up_state.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(
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
                    Center(
                        child:
                            reusableText("Enter your detail and free Sign up")),
                    Container(
                      margin: EdgeInsets.only(top: 60.h),
                      padding: EdgeInsets.only(left: 25.w, right: 25.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          reusableText('Username'),
                          buildTextField('Enter your username', 'name', 'user',
                              (value) {
                            context
                                .read<SignUpBloc>()
                                .add(UserNameEvent(value));
                          }),
                          reusableText('Email'),
                          buildTextField('Enter Your Email', 'email', 'user',
                              (value) {
                            context.read<SignUpBloc>().add(EmailEvent(value));
                          }),
                          reusableText('Password'),
                          buildTextField(
                              'Enter Your Password', 'password', 'lock',
                              (value) {
                            context
                                .read<SignUpBloc>()
                                .add(PasswordEvent(value));
                          }),
                          reusableText('Confirm Password'),
                          buildTextField(
                              'Confirm Your Password', 'password', 'lock',
                              (value) {
                            context
                                .read<SignUpBloc>()
                                .add(RePasswordEvent(value));
                          }),
                          reusableText(
                              'By creating account and agree with terms and conditions'),
                          signupAndRegButton(
                              onTap:
                                  SignUpController(context: context).handleEmailSignUp,
                              buttonName: 'Sign Up',
                              buttonColor: AppColors.primaryElement,
                              buttonTextColor: AppColors.primaryBackground,
                              buttonType: 'signup'),
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
