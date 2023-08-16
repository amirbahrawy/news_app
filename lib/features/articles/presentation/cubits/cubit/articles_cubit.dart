import 'dart:developer';

import '../../../../../core/abstract/base_cubit.dart';
import '../../../../../core/exceptions/redundant_request_exception.dart';
import '../../../data/repository/articles_repository.dart';
import 'articles_state.dart';

class ArticlesCubit extends BaseCubit<ArticlesState> {
  ArticlesCubit(
    this._articlesRepository,
  ) : super(const ArticlesState());

  final ArticlesRepository _articlesRepository;

  Future<void> loadArticles({bool refresh = false}) async {
    try {
      if (!refresh) emit(state.copyWith(status: ArticlesStateStatus.loading));
      final articles = await _articlesRepository.getArticles();
      emit(state.copyWith(
        status: ArticlesStateStatus.loaded,
        articles: articles,
      ));
    } on RedundantRequestException catch (e) {
      log(e.toString());
    } catch (e) {
      log(e.toString());
      emit(
        state.copyWith(
          status: ArticlesStateStatus.error,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> refresh() => loadArticles(refresh: true);
}
