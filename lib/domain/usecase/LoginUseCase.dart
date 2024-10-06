import 'package:elevate_online_exam_c1_offline/domain/AppUser.dart';
import 'package:elevate_online_exam_c1_offline/domain/contracts/repository/AuthRepo.dart';
import 'package:elevate_online_exam_c1_offline/domain/core/Result.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginUseCase{
  AuthRepo authRepo;
  LoginUseCase(this.authRepo);
  Future<Result<AppUser?>>invoke(String email,String password){
    return authRepo.login(email, password);
  }
}