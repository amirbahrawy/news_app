import '../datasources/articles_remote_datasource.dart';
import '../models/article.dart';

abstract class ArticlesRepository {
  Future<List<Article>> getArticles();
}

class ArticlesRepositoryImpl implements ArticlesRepository {
  final ArticlesRateRemoteDataSource _exchangeRateRemoteDataSource;

  ArticlesRepositoryImpl(this._exchangeRateRemoteDataSource);

  @override
  Future<List<Article>> getArticles() async {
    return await _exchangeRateRemoteDataSource.getArticles();
  }
}
