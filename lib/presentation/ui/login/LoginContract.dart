
import 'package:elevate_online_exam_c1_offline/domain/AppUser.dart';

sealed class LoginScreenEvent{}
class LoginEvent extends LoginScreenEvent{
  String email;
  String password;
  LoginEvent(this.email,this.password);
}

sealed class LoginScreenState{}
class InitialState extends LoginScreenState{

}
class LoadingState extends LoginScreenState{

}
class ErrorState extends LoginScreenState{
  Exception? exception;
  ErrorState(this.exception);
}
class SuccessState extends LoginScreenState{
  AppUser? user;
  SuccessState(this.user);
}
