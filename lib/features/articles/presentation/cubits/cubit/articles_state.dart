// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';

import '../../../data/models/article.dart';

enum ArticlesStateStatus {
  initial,
  loading,
  loaded,
  error,
}

extension ArticlesStateX on ArticlesState {
  bool get isInitial => status == ArticlesStateStatus.initial;
  bool get isLoading => status == ArticlesStateStatus.loading;
  bool get isLoaded => status == ArticlesStateStatus.loaded;
  bool get isError => status == ArticlesStateStatus.error;
}

@immutable
class ArticlesState {
  final ArticlesStateStatus status;
  final String? errorMessage;
  final List<Article>? articles;
  const ArticlesState({
    this.status = ArticlesStateStatus.initial,
    this.errorMessage,
    this.articles,
  });

  @override
  bool operator ==(covariant ArticlesState other) {
    if (identical(this, other)) return true;

    return other.status == status &&
        other.errorMessage == errorMessage &&
        listEquals(other.articles, articles);
  }

  @override
  int get hashCode =>
      status.hashCode ^ errorMessage.hashCode ^ articles.hashCode;

  ArticlesState copyWith({
    ArticlesStateStatus? status,
    String? errorMessage,
    List<Article>? articles,
  }) {
    return ArticlesState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      articles: articles ?? this.articles,
    );
  }

  @override
  String toString() =>
      'ArticlesState(status: $status, errorMessage: $errorMessage, articles: $articles)';
}
