import 'package:clean_architecture/domain/entities/article.dart';
import 'package:equatable/equatable.dart';

abstract class LocalArticleEvent extends Equatable
{
  final Article? article;
  const LocalArticleEvent({this.article});
  @override
  // TODO: implement props
  List<Object?> get props => [article];
}
class GetAllSavedArticles extends LocalArticleEvent
{
  const GetAllSavedArticles();
}
class RemoveArticles extends LocalArticleEvent
{
  const RemoveArticles(Article article):super(article: article);
}
class SavedArticles extends LocalArticleEvent
{
  const SavedArticles(Article article):super(article: article);
}