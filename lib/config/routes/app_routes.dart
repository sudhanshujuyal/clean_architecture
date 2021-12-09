import 'package:clean_architecture/domain/entities/article.dart';
import 'package:clean_architecture/presentation/view/article_detail_view.dart';
import 'package:clean_architecture/presentation/view/breaking_news_view.dart';
import 'package:clean_architecture/presentation/view/saved_article_views.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Route? onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute(const BreakingNewsView());
        break;

      case '/ArticleDetailsView':
        return _materialRoute(ArticleDetailsView(article: settings.arguments as Article));
        break;

      case '/SavedArticlesView':
        return _materialRoute(const SavedArticlesView());
        break;
      default:
        return null;
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}