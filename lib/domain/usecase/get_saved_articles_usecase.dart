import 'package:clean_architecture/core/usecase/usecase.dart';
import 'package:clean_architecture/domain/entities/article.dart';
import 'package:clean_architecture/domain/repositories/articles_repository.dart';

class GetSavedArticlesUseCase implements UseCase<List<Article>,void>
{
  final ArticleRepository _articleRepository;
  GetSavedArticlesUseCase(this._articleRepository);
  @override
  Future<List<Article>> call({void param})
  {
    return _articleRepository.getSavedArticle();
  }

}