import 'package:elevate_online_exam_c1_offline/domain/AppUser.dart';
import 'package:elevate_online_exam_c1_offline/domain/core/Result.dart';
import 'package:elevate_online_exam_c1_offline/domain/usecase/LoginUseCase.dart';
import 'package:elevate_online_exam_c1_offline/presentation/ui/login/LoginContract.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginViewModel extends Bloc<LoginScreenEvent,LoginScreenState>{
  LoginUseCase loginUseCase;
  LoginViewModel(this.loginUseCase):super(InitialState()){
    on<LoginScreenEvent>((event,Emitter<LoginScreenState> emit)async{
      switch (event) {
        case LoginEvent(): await _login(event,emit);
      }
    },);
  }

  // Future<void> doEvent(LoginScreenEvent event,
  //     Emitter<LoginScreenState> emit){
  //
  // }

  Future<void> _login(LoginEvent event,Emitter<LoginScreenState> emit)async{
    emit(LoadingState());
    var result = await loginUseCase.invoke(event.email, event.password);
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