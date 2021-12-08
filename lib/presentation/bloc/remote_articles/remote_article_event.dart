import 'package:equatable/equatable.dart';

abstract class RemoteArticleEvent extends Equatable
{
  const RemoteArticleEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class GetArticles extends RemoteArticleEvent
{
  const GetArticles();
}