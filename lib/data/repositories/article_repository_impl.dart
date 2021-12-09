
import 'dart:io';

import 'package:clean_architecture/data/datasources/local/app_database.dart';
import 'package:dio/dio.dart';

import '../../core/params/article_request.dart';
import '../../core/resources/data_state.dart';
import '../../domain/entities/article.dart';
import '../../domain/repositories/articles_repository.dart';
import '../datasources/remote/news_api_service.dart';

class ArticlesRepositoryImpl implements ArticleRepository {
  final NewsApiService _newsApiService;
  final AppDatabase _appDatabase;

  const ArticlesRepositoryImpl(this._newsApiService,this._appDatabase);

  @override
  Future<DataState<List<Article>>> getBreakingNewsArticles(
      ArticlesRequestParams params,
      ) async {
    try {
      final httpResponse = await _newsApiService.getBreakingNewsArticles(
        apiKey: params.apiKey!,
        country: params.country!,
        category: params.category!,
        page: params.page!,
        pageSize: params.pageSize!,
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data.articles);
      }
      return DataFailed(
        DioError(
          error: httpResponse.response.statusMessage,
          response: httpResponse.response,
          request: httpResponse.response.request,
          type: DioErrorType.RESPONSE,
        ),
      );
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<List<Article>> getSavedArticle()
  {
    return _appDatabase.articleDao.getAllArticles();
    // TODO: implement
  }

  @override
  Future<void> removeArticle(Article article)
  {
    return _appDatabase.articleDao.deleteArticle(article);

    // TODO: implement removeArticle
    throw UnimplementedError();
  }

  @override
  Future<void> saveArticle(Article article)
  {
    return _appDatabase.articleDao.insertArticle(article);
  }
}