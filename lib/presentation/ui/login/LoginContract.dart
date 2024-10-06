
import 'package:elevate_online_exam_c1_offline/domain/AppUser.dart';

sealed class Action{}
class LoginAction extends Action{
  String email;
  String password;
  LoginAction(this.email,this.password);
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
