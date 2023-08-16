import '../features/articles/data/datasources/articles_remote_datasource.dart';
import '../features/articles/data/repository/articles_repository.dart';
import '../features/articles/presentation/cubits/cubit/articles_cubit.dart';
import 'network/network_service.dart';

///Implementing
///
///`Singleton` design pattern
///
///`Flyweight` design pattern
///
///to save specific objects from recreation
class Injector {
  final _flyweightMap = <String, dynamic>{};
  static final _singleton = Injector._internal();

  Injector._internal();
  factory Injector() => _singleton;

  //===================[ExchangeRate_CUBIT]===================
  ArticlesCubit get articlesCubit => ArticlesCubit(articlesRepository);

  ArticlesRepository get articlesRepository =>
      _flyweightMap['ArticlesRepository'] ??
      ArticlesRepositoryImpl(articlesRemoteDataSource);

  ArticlesRateRemoteDataSource get articlesRemoteDataSource =>
      _flyweightMap['ArticlesRateRemoteDataSource'] ??
      ArticlesRemoteDataSourceImpl(networkService);
  //===================[Other]===================
  NetworkService get networkService =>
      _flyweightMap['networkService'] ??= NetworkServiceImpl();
}
