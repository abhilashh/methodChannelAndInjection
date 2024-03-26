// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:batterylevel/data/provider/quote_api_provider.dart' as _i7;
import 'package:batterylevel/data/repositiory/i_birdRepo.dart' as _i5;
import 'package:batterylevel/data/repositiory/impl/birdRepo.dart' as _i6;
import 'package:batterylevel/data/repositiory/quote_repository.dart' as _i8;
import 'package:batterylevel/service/services/appModule.dart' as _i9;
import 'package:batterylevel/service/services/dioService.dart' as _i4;
import 'package:batterylevel/ui/routing/router.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    gh.factory<_i3.AppRouter>(() => appModule.appRouter);
    gh.lazySingleton<_i4.DioClient>(() => _i4.DioClient());
    gh.factory<_i5.IBirdRepo>(() => _i6.BirdRepo());
    gh.singleton<_i7.QuoteApiProvider>(() => const _i7.MockQuoteApiProvider());
    gh.singleton<_i7.QuoteApiProvider>(
      () => const _i7.RealQuoteApiProvider(),
      instanceName: 'prod',
    );
    gh.factoryParam<_i8.QuoteRepository, dynamic, dynamic>((
      env,
      _,
    ) =>
        _i8.QuoteRepository(
          provider: gh<_i7.QuoteApiProvider>(instanceName: 'prod'),
          env: env,
        ));
    return this;
  }
}

class _$AppModule extends _i9.AppModule {}
