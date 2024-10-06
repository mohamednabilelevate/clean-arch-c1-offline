import 'package:elevate_online_exam_c1_offline/data/datasource/contracts/AuthDataSource.dart';
import 'package:elevate_online_exam_c1_offline/domain/contracts/repository/AuthRepo.dart';
import 'package:elevate_online_exam_c1_offline/domain/core/Result.dart';
import 'package:elevate_online_exam_c1_offline/domain/AppUser.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRepo)
class AuthRepositoryImpl implements AuthRepo{
  AuthOfflineDataSource offlineDataSource;
  AuthOnlineDataSource onlineDataSource;

  @factoryMethod
  AuthRepositoryImpl(this.onlineDataSource,this.offlineDataSource);

  @override
  Future<Result<AppUser?>> login(String email, String password){
    return onlineDataSource.login(email, password);
  }
  
  @override
  Future<Result<AppUser?>> register(String userName, String firstName, String lastName, String email, String password, String rePassword, String phone) {
    return onlineDataSource.register(userName,firstName,lastName,email, password,rePassword,phone);
  }


}