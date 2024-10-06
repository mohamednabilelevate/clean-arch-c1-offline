import 'package:elevate_online_exam_c1_offline/domain/AppUser.dart';
import 'package:elevate_online_exam_c1_offline/domain/core/Result.dart';
import 'package:elevate_online_exam_c1_offline/domain/usecase/LoginUseCase.dart';
import 'package:elevate_online_exam_c1_offline/presentation/ui/login/LoginContract.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginViewModel extends Cubit<LoginScreenState>{
  LoginUseCase loginUseCase;
  LoginViewModel(this.loginUseCase):super(InitialState());

  void doIntent(Action action){
    switch (action) {

      case LoginAction():_login(action);
    }
  }
  void _login(LoginAction action)async{
    emit(LoadingState());
    var result = await loginUseCase.invoke(action.email, action.password);
    switch (result) {
      case Success<AppUser?>():{
        emit(SuccessState(result.data));
        break;
      }
      case Fail<AppUser?>():{
        emit(ErrorState(result.exception));
        break;
      }
      case Loading<AppUser?>():{
        emit(LoadingState());
        break;
      }
    }
  }
}