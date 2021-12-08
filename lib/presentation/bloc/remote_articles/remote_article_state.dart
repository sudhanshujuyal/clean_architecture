import 'package:clean_architecture/domain/entities/article.dart';
import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';
abstract class RemoteArticleState extends Equatable
{
  final List<Article>? articles;
  final bool? noMoreData;
  final DioError? error;
  const RemoteArticleState({this.articles,this.noMoreData, this.error});
  @override
  // TODO: implement props
  List<Object?> get props => [articles,noMoreData,error];




}
class RemoteArticleLoading extends RemoteArticleState
{
 const RemoteArticleLoading();
}
class RemoteArticlesDone extends RemoteArticleState
{
  const RemoteArticlesDone(List<Article> article, {bool? noMoreData}): super(articles: article, noMoreData: noMoreData);
}
class RemoteArticlesError extends RemoteArticleState {
  const RemoteArticlesError(DioError error) : super(error: error);
}