import 'package:elevate_online_exam_c1_offline/data/datasource/contracts/AuthDataSource.dart';
import 'package:elevate_online_exam_c1_offline/domain/core/Result.dart';
import 'package:elevate_online_exam_c1_offline/domain/AppUser.dart';
import 'package:injectable/injectable.dart';

@Injectable(as:AuthOfflineDataSource)
class AuthOfflineDatasourceImpl implements AuthOfflineDataSource{
  @override
  Future<Result<AppUser?>> login(String email, String password) {
    // TODO: implement login
    throw UnimplementedError();
  }
} 