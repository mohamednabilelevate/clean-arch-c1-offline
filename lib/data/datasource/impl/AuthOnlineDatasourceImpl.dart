import 'package:elevate_online_exam_c1_offline/data/api/ApiManager.dart';
import 'package:elevate_online_exam_c1_offline/data/api/model/request/RegisterRequest.dart';
import 'package:elevate_online_exam_c1_offline/data/core/apiExtensions.dart';
import 'package:elevate_online_exam_c1_offline/data/datasource/contracts/AuthDataSource.dart';
import 'package:elevate_online_exam_c1_offline/domain/core/Result.dart';
import 'package:elevate_online_exam_c1_offline/domain/AppUser.dart';
import 'package:injectable/injectable.dart';

@Injectable(as:AuthOnlineDataSource)
class AuthOnlineDatasourceImpl implements AuthOnlineDataSource{
  ApiManager apiManager;
  AuthOnlineDatasourceImpl(this.apiManager);

  @override
  Future<Result<AppUser?>> login(String email, String password)async{
    return executeApi<AppUser?>(()async{
     var result =  await apiManager.login(email, password);
      return Success(result.user?.toAppUser());
    },);
  }


 @override
  Future<Result<AppUser?>> register(String userName, String firstName, String lastName, String email, String password, String rePassword, String phone) {
    return executeApi<AppUser>(()async{
      var requestBody = RegisterRequest(
        userName: userName,
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password,
        rePassword: rePassword,
          phone: phone
      );
      var result =  await apiManager.register(requestBody);
      return Success(result.user?.toAppUser());
    },);
  }
  
} 