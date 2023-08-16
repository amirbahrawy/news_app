import '../../../../constants/constants.dart';
import '../../../../core/enums/status_enum.dart';
import '../../../../core/exceptions/request_exception.dart';
import '../../../../core/network/api_endpoint.dart';
import '../../../../core/network/network_service.dart';
import '../models/article.dart';

abstract class ArticlesRateRemoteDataSource {
  Future<List<Article>> getArticles();
}

class ArticlesRemoteDataSourceImpl implements ArticlesRateRemoteDataSource {
  final NetworkService _networkService;

  ArticlesRemoteDataSourceImpl(this._networkService);

  @override
  Future<List<Article>> getArticles() async {
    const url = ApiEndPoint.GET_ARTICLES;

    final nextWebParm = {
      'source': 'the-next-web',
      'apiKey': API_KEY,
    };
    final associatedParm = {
      'source': 'the-next-web',
      'apiKey': API_KEY,
    };

    final nextWebArticles = await _networkService
        .get(url, queryParameters: nextWebParm)
        .then((response) {
      //handle error changes based on the api and backend
      final status = response.data['status'];
      if (status == Status.error.name) {
        throw RequestException(response.data['message'] ??
            'Connection Error ${response.statusCode}');
      }
      if (status == Status.ok.name) {
        return (response.data['articles'] as List)
            .map((e) => Article.fromMap(e))
            .toList();
      } else {
        throw RequestException('Connection Error ${response.statusCode}');
      }
    });

    final associatedArticles = await _networkService
        .get(url, queryParameters: associatedParm)
        .then((response) {
      //handle error changes based on the api and backend
      final status = response.data['status'];
      if (status == Status.error.name) {
        throw RequestException(response.data['message'] ??
            'Connection Error ${response.statusCode}');
      }
      if (status == Status.ok.name) {
        return (response.data['articles'] as List)
            .map((e) => Article.fromMap(e))
            .toList();
      } else {
        throw RequestException('Connection Error ${response.statusCode}');
      }
    });
    return [...nextWebArticles, ...associatedArticles];
  }
}
