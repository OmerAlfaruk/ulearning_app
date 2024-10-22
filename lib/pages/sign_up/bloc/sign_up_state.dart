
 class SignUpState {
 final String userName;
 final String email;
 final String password;
 final String rePassword;
const SignUpState({this.userName='',this.email='',this.password='',this.rePassword=''});

SignUpState copyWith({String? userName,String? email,String?password,String?rePassword}){
 return SignUpState(userName:userName??this.userName, email:email??this.email, password:password??this.password, rePassword:rePassword??this.userName);
 }
 }
//thread safe

