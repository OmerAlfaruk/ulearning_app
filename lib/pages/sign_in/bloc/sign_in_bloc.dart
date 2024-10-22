import 'package:bloc/bloc.dart';
import 'package:ulearning/pages/sign_in/bloc/sign_in_event.dart';
import 'package:ulearning/pages/sign_in/bloc/sign_in_state.dart';


class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInState()) {
    on<EmailEvent>(_emailEvent);
    on<PasswordEvent>(_passwordEvent);
  }
  void _emailEvent(EmailEvent event,Emitter<SignInState> emit){
   // print("my email is ${event.email}");
    emit(state.copyWith(email: event.email));
  }
  void _passwordEvent(PasswordEvent event,Emitter<SignInState> emit){
   // print("My password is ${event.password}");
    emit(state.copyWith(password: event.password));
  }
}
