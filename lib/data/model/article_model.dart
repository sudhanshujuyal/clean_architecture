// import 'package:clean_architecture/domain/entities/article.dart';
// import 'package:clean_architecture/domain/entities/source.dart';
//
// class ArticleModel extends Article
// {
//   const ArticleModel({required int id,required Source source,required String author,required String title,required String description,required String url,required String urlToImage,required String publishAt,required String content}):super(id: id,source: source,author: author,title: title,description: description,url: url,urlToImage: urlToImage,publishAt: publishAt,content: content);
//
//   factory ArticleModel.fromJson()
//
//
// }

import 'package:clean_architecture/data/model/source_model.dart';
import 'package:clean_architecture/domain/entities/article.dart';
 import 'package:clean_architecture/domain/entities/source.dart';

class ArticleModel extends Article {
  const ArticleModel({
    required int id,
    required Source source,
    required String author,
    required String title,
    required String description,
    required String url,
    required String urlToImage,
    required String publishAt,
    required String content,
  }) :super(id: id,source: source,author: author,title: title,description: description,url: url,urlToImage: urlToImage,publishAt: publishAt,content: content);

  factory ArticleModel.fromJson(Map<String, dynamic> map) {
    // if (map == null) {
    //   return null;
    // }

    return ArticleModel(
      id: map['id'],
      source: SourceModel.fromJson(map['source'] as Map<String, dynamic>),
      author: map['author'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
      url: map['url'] as String,
      urlToImage: map['urlToImage'] as String,
      publishAt: map['publishedAt'] as String,
      content: map['content'] as String,
    );
  }
}