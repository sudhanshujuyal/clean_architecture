import 'package:clean_architecture/data/datasources/local/converter/source_type_converter.dart';
import 'package:clean_architecture/data/datasources/local/dao/article_dao.dart';
import 'package:clean_architecture/domain/entities/article.dart';
import 'package:floor/floor.dart';

@TypeConverters([SourceTypeConverter])
@Database(version: 1,entities: [Article])
abstract class AppDatabase extends FloorDatabase
{
  ArticleDao get articleDao;
}