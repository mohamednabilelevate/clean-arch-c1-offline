import 'package:elevate_online_exam_c1_offline/domain/AppUser.dart';
import 'package:elevate_online_exam_c1_offline/domain/core/Result.dart';
import 'package:elevate_online_exam_c1_offline/domain/usecase/LoginUseCase.dart';
import 'package:elevate_online_exam_c1_offline/presentation/ui/login/LoginContract.dart' as Contract;
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginViewModel extends ChangeNotifier{
  LoginUseCase loginUseCase;
  LoginViewModel(this.loginUseCase):super();

  void doIntent(Contract.Action action){
    switch (action) {

      case Contract.LoginAction():_login(action);
    }
  }
  void _login(Contract.LoginAction action)async{
    notifyListeners();
    var result = await loginUseCase.invoke(action.email, action.password);
    switch (result) {
      case Success<AppUser?>():{
        notifyListeners();
        break;
      }
      case Fail<AppUser?>():{
        notifyListeners();
        break;
      }
      case Loading<AppUser?>():{
        notifyListeners();
        break;
      }
    }
  }
}