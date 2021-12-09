import 'package:clean_architecture/domain/entities/article.dart';
import 'package:equatable/equatable.dart';

abstract class LocalArticleState extends Equatable
{
  final List<Article>? articles;
  const LocalArticleState({this.articles});
  @override
  // TODO: implement props
  List<Object?> get props => [articles];
}
class LocalArticleLoading extends LocalArticleState
{
 const  LocalArticleLoading();
}
class LocalArticleDone extends LocalArticleState
{
  LocalArticleDone(List<Article> articles):super(articles: articles);
}

