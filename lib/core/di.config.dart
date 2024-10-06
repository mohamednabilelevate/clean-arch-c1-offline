// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../data/api/ApiManager.dart' as _i539;
import '../data/datasource/contracts/AuthDataSource.dart' as _i908;
import '../data/datasource/impl/AuthOfflineDatasourceImpl.dart' as _i233;
import '../data/datasource/impl/AuthOnlineDatasourceImpl.dart' as _i664;
import '../data/repository/AuthRepository.dart' as _i387;
import '../domain/contracts/repository/AuthRepo.dart' as _i689;
import '../domain/usecase/LoginUseCase.dart' as _i1;
import '../presentation/ui/login/LoginViewModel.dart' as _i15;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i539.ApiManager>(() => _i539.ApiManager());
    gh.factory<_i908.AuthOfflineDataSource>(
        () => _i233.AuthOfflineDatasourceImpl());
    gh.factory<_i908.AuthOnlineDataSource>(
        () => _i664.AuthOnlineDatasourceImpl(gh<_i539.ApiManager>()));
    gh.factory<_i689.AuthRepo>(() => _i387.AuthRepositoryImpl(
          gh<_i908.AuthOnlineDataSource>(),
          gh<_i908.AuthOfflineDataSource>(),
        ));
    gh.factory<_i1.LoginUseCase>(() => _i1.LoginUseCase(gh<_i689.AuthRepo>()));
    gh.factory<_i15.LoginViewModel>(
        () => _i15.LoginViewModel(gh<_i1.LoginUseCase>()));
    return this;
  }
}
