import 'package:clean_architecture/core/usecase/usecase.dart';
import 'package:clean_architecture/domain/entities/article.dart';
import 'package:clean_architecture/domain/repositories/articles_repository.dart';

class SaveArticleUseCase implements UseCase<void ,Article>
{
  final ArticleRepository _articleRepository;
  SaveArticleUseCase(this._articleRepository);

  @override
  Future<void> call({ Article? param})
  {
    return _articleRepository.saveArticle(param!);
  }
}