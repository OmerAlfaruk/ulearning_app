import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:ulearning/common/apis/user_api.dart';
import 'package:ulearning/common/constant/constant.dart';
import 'package:ulearning/common/entities/user.dart';
import 'package:ulearning/common/widgets/flutter_toast/flutter_toast.dart';
import 'package:ulearning/global.dart';

import 'bloc/sign_in_bloc.dart';

class SignInController {
  final BuildContext context;

  SignInController({required this.context});

  Future<void> handleSignIn(String type) async {

    try {
      if (type == 'email') {
        /// BlocProvider.of<SignInBloc>(context).state
        final state = context.read<SignInBloc>().state;
        String emailAddress = state.email;
        String password = state.password;
        if (emailAddress.isEmpty) {
          toastInfo(msg: "You need fill Email address");
          return;
        }
        if (password.isEmpty) {
          toastInfo(msg: 'You need to enter your password');
          return;
        }
        try {
          final credential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: emailAddress, password: password);
          if (credential.user == null) {
            toastInfo(msg: "You don't exist");
            return;
            //
          }
          if (!credential.user!.emailVerified) {
            toastInfo(msg: "You need to verify your email");
            return;

            //
          }
          var user = credential.user;
          if (user != null) {
            String? displayName = user.displayName;
            String? email = user.email;
            String? id = user.uid;
            String? photoUrl = user.photoURL;
            LoginRequestEntity loginRequestEntity=LoginRequestEntity();

            loginRequestEntity.name=displayName;
            loginRequestEntity.avatar=photoUrl;
            loginRequestEntity.email=email;
            loginRequestEntity.type=1;
            loginRequestEntity.open_id=id;
            asyncPostAllData(loginRequestEntity);
            // we got verified user from firebase
          } else {
            toastInfo(msg: 'no user');
            return;
            // we have error getting user from Firebase
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            toastInfo(msg: "No user found for that email");
          } else if (e.code == 'wrong-password') {
            toastInfo(msg: 'wrong password');
          } else if (e.code == 'invalid-email') {
            toastInfo(msg: 'Invalid email');
          }
        }
      }
    } catch (e) {
      print(e.toString());
    }
  }
Future<void> asyncPostAllData(LoginRequestEntity loginRequestEntity) async {
    EasyLoading.show(
      indicator: CircularProgressIndicator(),
      maskType: EasyLoadingMaskType.clear,
      dismissOnTap: true,

    );
    var result= await UserAPI.login(params:loginRequestEntity);
    if(result.code==200){
    try{
      Global.storageService.setString(AppConstants.STORAGE_USER_PROFILE_KEY,jsonEncode(result.data!));
      print("${result.data!.access_token}");
      Global.storageService
        .setString(AppConstants.STORAGE_USER_TOKEN_KEY, result.data!.access_token!);
      EasyLoading.dismiss();
      if(context.mounted){
      Navigator.of(context)
          .pushNamedAndRemoveUntil('/application', (route) => false);}
    }catch(e){
      toastInfo(msg: e.toString());
    }
}else{
      EasyLoading.dismiss();
      toastInfo(msg: 'Unknown error');
    }
}}
