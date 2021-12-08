import 'package:clean_architecture/core/params/article_request.dart';
import 'package:clean_architecture/core/resources/data_state.dart';
import 'package:clean_architecture/domain/entities/article.dart';
import 'package:clean_architecture/domain/usecase/get_article_usecase.dart';
import 'package:clean_architecture/presentation/bloc/remote_articles/remote_article_event.dart';
import 'package:clean_architecture/presentation/bloc/remote_articles/remote_article_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clean_architecture/core/bloc/bloc_with_state.dart';

class RemoteArticlesBloc extends BlocWithState<RemoteArticleEvent, RemoteArticleState> {
  final GetArticleUseCase _getArticlesUseCase;

  RemoteArticlesBloc(this._getArticlesUseCase) : super( RemoteArticleLoading());

  final List<Article> _articles = [];
  int _page = 1;
  static const int _pageSize = 20;

  @override
  Stream<RemoteArticleState> mapEventToState(RemoteArticleEvent event) async* {
    if (event is GetArticles) yield* _getBreakingNewsArticle(event);
  }

  Stream<RemoteArticleState> _getBreakingNewsArticle(RemoteArticleEvent event) async* {
    // yield* runBlocProcess(() async* {
    yield* runBlocProcess(() async* {
      final dataState = await _getArticlesUseCase(param: ArticlesRequestParams(page: _page));

      if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
        final articles = dataState.data;
        final noMoreData = articles!.length < _pageSize;
        _articles.addAll(articles);
        _page++;

        yield RemoteArticlesDone(_articles, noMoreData: noMoreData);
      }
      if (dataState is DataFailed) {
        yield RemoteArticlesError(dataState.error!);
      }
    });

    // }

  }


}