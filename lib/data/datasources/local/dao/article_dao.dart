import 'package:clean_architecture/domain/entities/article.dart';
import 'package:floor/floor.dart';
import 'package:clean_architecture/core/utils/constants.dart';

@dao
abstract class ArticleDao
{
@Query('Select * From $kArticlesTableName')
  Future<List<Article>> getAllArticles();
@Insert(onConflict:OnConflictStrategy.replace)
  Future<void> insertArticle(Article article);
@delete
  Future<void> deleteArticle(Article article);
}