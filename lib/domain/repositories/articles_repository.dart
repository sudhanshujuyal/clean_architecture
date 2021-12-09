import 'package:clean_architecture/core/params/article_request.dart';
import 'package:clean_architecture/core/resources/data_state.dart';
import 'package:clean_architecture/domain/entities/article.dart';

abstract class ArticleRepository
{
  Future<DataState<List<Article>>> getBreakingNewsArticles(ArticlesRequestParams params);
  Future<List<Article>> getSavedArticle();
  Future<void> saveArticle(Article article);
  Future<void> removeArticle(Article article);
}