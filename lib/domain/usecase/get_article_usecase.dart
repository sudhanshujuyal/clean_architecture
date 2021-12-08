import 'package:clean_architecture/core/params/article_request.dart';
import 'package:clean_architecture/core/resources/data_state.dart';
import 'package:clean_architecture/core/usecase/usecase.dart';
import 'package:clean_architecture/domain/entities/article.dart';
import 'package:clean_architecture/domain/repositories/articles_repository.dart';

class GetArticleUseCase implements UseCase<DataState<List<Article>>,ArticlesRequestParams>
{
  final ArticleRepository _articleRepository;
    const GetArticleUseCase(this._articleRepository);

  @override
  Future<DataState<List<Article>>> call({required ArticlesRequestParams param}) {
    // TODO: implement call
    return _articleRepository.getBreakingNewsArticles(param);
  }

}
