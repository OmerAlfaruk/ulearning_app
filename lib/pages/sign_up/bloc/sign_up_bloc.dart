import 'package:bloc/bloc.dart';
import 'package:ulearning/pages/sign_up/bloc/sign_up_event.dart';
import 'package:ulearning/pages/sign_up/bloc/sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(const SignUpState()) {
    on<UserNameEvent>(_userNameEvent);

    on<EmailEvent>(_emailEvent);

    on<PasswordEvent>(_passwordEvent);

    on<RePasswordEvent>(_repassEvent);
  }

  void _userNameEvent(UserNameEvent event, Emitter<SignUpState> emit) {
    //print("${event.userName}");
    emit(state.copyWith(userName: event.userName));
  }

  void _emailEvent(EmailEvent event, Emitter<SignUpState> emit) {
    //print("${event.email}");
    emit(state.copyWith(email: event.email));
  }

  void _passwordEvent(PasswordEvent event, Emitter<SignUpState> emit) {
    //print("${event.password}");
    emit(state.copyWith(password: event.password));
  }

  void _repassEvent(RePasswordEvent event, Emitter<SignUpState> emit) {
    //print("${event.rePassword}");
    emit(state.copyWith(rePassword: event.rePassword));
  }
}
