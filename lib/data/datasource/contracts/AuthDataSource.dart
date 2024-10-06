import 'package:elevate_online_exam_c1_offline/domain/core/Result.dart';
import 'package:elevate_online_exam_c1_offline/domain/AppUser.dart';

abstract class AuthOnlineDataSource{
  Future<Result<AppUser?>> login(String email,String password);
  Future<Result<AppUser?>> register(String userName, String firstName, String lastName, String email, String password, String rePassword, String phone);

}
abstract class AuthOfflineDataSource{
  Future<Result<AppUser?>> login(String email,String password);
}