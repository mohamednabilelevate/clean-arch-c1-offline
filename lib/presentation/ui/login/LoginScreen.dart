
import 'package:elevate_online_exam_c1_offline/core/di.dart';
import 'package:elevate_online_exam_c1_offline/domain/core/AppExceptions.dart';
import 'package:elevate_online_exam_c1_offline/presentation/ui/login/LoginContract.dart';
import 'package:elevate_online_exam_c1_offline/presentation/ui/login/LoginViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Loginscreen extends StatelessWidget {
  Loginscreen({super.key});

  LoginViewModel viewModel = getIt.get<LoginViewModel>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginViewModel>(
      create: (context) => viewModel,
      child: Scaffold(
        body: Column(
          children: [
            
            BlocConsumer<LoginScreenState>(
              listenWhen: (previous, current) {
                if(previous is LoadingState || previous is ErrorState){
                  Navigator.pop(context);
                }
                return !(current is InitialState);
              },
              buildWhen: (previous, current) {
                return current is InitialState;
              },
              listener: (context, state) {
                switch (state) {
                  case LoadingState():
                    showDialog(context: context, builder: (context) {
                      return AlertDialog(
                        content: Row(
                          children: [
                            CircularProgressIndicator(),
                            Text("Loading")
                          ],
                        ),
                      );
                    },);
                  case ErrorState():{
                    var exception = state.exception;
                    String? message = "something went wrong";
                    if(exception is NoInternetException){
                      message = "Please check internet connection";
                    }else if (exception is ServerError){
                      message = exception.serverMessage;
                    }
                    showDialog(context: context, builder: (context) {
                      return AlertDialog(
                        content: Row(
                          children: [
                            Text(message ??"")
                          ],
                        ),
                      );
                    },);
                  }
                  case SuccessState():{
                    showDialog(context: context, builder: (context) {
                      return AlertDialog(
                        content: Row(
                          children: [
                            Text(state.user?.token ?? "")
                          ],
                        ),
                      );
                    },);
                  }
                  default:{
                  }
                }
                },
              builder: (context, state){
                switch (state) {
                  case InitialState():
                  default:{
                    return LoginForm(
                        (){
                          viewModel.doIntent(LoginAction("email@elevate.com", "123456"));
                        }
                    );
                  }
                }
                
              },)
          ],
        ),
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  VoidCallback onLoginClick;
  LoginForm(this.onLoginClick);
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(),
          TextFormField(),
          ElevatedButton(onPressed: (){
            onLoginClick.call();
          }, child: Text('Login'))
        ],
      ),
    );
  }
}
