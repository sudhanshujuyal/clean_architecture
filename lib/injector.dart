import 'package:clean_architecture/data/datasources/remote/news_api_service.dart';
import 'package:clean_architecture/domain/repositories/articles_repository.dart';
import 'package:clean_architecture/domain/usecase/get_article_usecase.dart';
import 'package:clean_architecture/presentation/bloc/local_article/local_article_bloc.dart';
import 'package:clean_architecture/presentation/bloc/remote_articles/remote_article_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

import 'data/repositories/article_repository_impl.dart';
final injector=GetIt.instance;
Future<void> initializeDepenedencies() async{
  injector.registerSingleton<Dio>(Dio());
  
  injector.registerSingleton<NewsApiService>(NewsApiService(injector()));
  injector.registerSingleton<ArticleRepository>(ArticlesRepositoryImpl(injector(),injector()));
  injector.registerSingleton<GetArticleUseCase>(GetArticleUseCase(injector()));
  injector.registerSingleton<RemoteArticlesBloc>(RemoteArticlesBloc(injector()));
  injector.registerFactory<RemoteArticlesBloc>(() => RemoteArticlesBloc(injector()));
  injector.registerFactory<LocalArticlesBloc>(() => LocalArticlesBloc(injector(),injector(),injector()));

}