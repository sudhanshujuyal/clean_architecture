import 'package:clean_architecture/domain/usecase/get_saved_articles_usecase.dart';
import 'package:clean_architecture/domain/usecase/remove_article_usecase.dart';
import 'package:clean_architecture/domain/usecase/save_article_usecase.dart';
import 'package:clean_architecture/presentation/bloc/local_article/local_article_event.dart';
import 'package:clean_architecture/presentation/bloc/local_article/local_article_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class LocalArticlesBloc extends Bloc<LocalArticleEvent, LocalArticleState> {
  final GetSavedArticlesUseCase _getSavedArticlesUseCase;
  final SaveArticleUseCase _saveArticleUseCase;
  final RemoveArticleUseCase _removeArticleUseCase;

  LocalArticlesBloc(
      this._getSavedArticlesUseCase,
      this._saveArticleUseCase,
      this._removeArticleUseCase,
      ) : super(const LocalArticleLoading());

  @override
  Stream<LocalArticleState> mapEventToState(LocalArticleEvent event) async* {
    if (event is GetAllSavedArticles) {
      yield* _getAllSavedArticles();
    }
    if (event is RemoveArticles) {
      await _removeArticleUseCase(param: event.article!);
      yield* _getAllSavedArticles();
    }
    if (event is SavedArticles) {
      await _saveArticleUseCase(param: event.article!);
      yield* _getAllSavedArticles();
    }
  }

  Stream<LocalArticleState> _getAllSavedArticles() async* {
    final articles = await _getSavedArticlesUseCase();
    yield LocalArticleDone(articles);
  }
}