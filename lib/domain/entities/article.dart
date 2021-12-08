import 'package:clean_architecture/domain/entities/source.dart';
import 'package:equatable/equatable.dart';

class Article extends Equatable
{
  final int id;
  final Source source;
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishAt;
  final String content;
  const Article({
    required this.id,required this.source,required this.author,required this.title,required this.description,required this.url,required this.urlToImage,required this.publishAt,required this.content



});
  @override
  // TODO: implement stringify
  bool? get stringify => true;
  @override
  // TODO: implement props
  List<Object?> get props => [id,source,author,title,description,url,urlToImage,publishAt,content];
}
