import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning/common/constant/constant.dart';
import 'package:ulearning/common/widgets/flutter_toast/flutter_toast.dart';
import 'package:ulearning/pages/sign_up/bloc/sign_up_bloc.dart';

class SignUpController {
  final BuildContext context;

  const SignUpController({required this.context});

  Future<void> handleEmailSignUp() async {
    final state = context.read<SignUpBloc>().state;
    String userName = state.userName;
    String email = state.email;
    String password = state.password;
    String rePassword = state.rePassword;

    if (userName.isEmpty) {
      toastInfo(msg: 'User name can not be empty');
      return;
    }
    if (email.isEmpty) {
      toastInfo(msg: 'User name can not be empty');
      return;
    }
    if (password.isEmpty) {
      toastInfo(msg: 'User name can not be empty');
      return;
    }
    if (rePassword.isEmpty) {
      toastInfo(msg: 'User name can not be empty');
      return;
    }
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      if(credential.user!=null){
        await credential.user?.sendEmailVerification();
        await credential.user?.updateDisplayName(userName);
        String photoUrl="uploads/default.png";
        await credential.user?.updatePhotoURL(photoUrl);
        toastInfo(msg: 'An email is sent to your registered email. please verify');
        Navigator.of(context).pop();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        toastInfo(msg: 'The password provided is to weak');
      }
      if (e.code == 'email-already-in-use') {
        toastInfo(msg: 'The email already in use');
      }
      if (e.code == 'invalid-email') {
        toastInfo(msg: 'Your email is invalid');
      }
    }
  }
}
