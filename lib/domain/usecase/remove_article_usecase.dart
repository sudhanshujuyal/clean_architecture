import 'package:clean_architecture/core/usecase/usecase.dart';
import 'package:clean_architecture/domain/entities/article.dart';
import 'package:clean_architecture/domain/repositories/articles_repository.dart';

class RemoveArticleUseCase implements UseCase<void,Article>
{
  final ArticleRepository _articleRepository;
  RemoveArticleUseCase(this._articleRepository);

  @override
  Future<void> call({required Article param})
  {
    return _articleRepository.removeArticle(param);

  }

}