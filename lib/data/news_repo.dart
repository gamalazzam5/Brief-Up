import 'package:brief_up/data/news_services.dart';
import 'package:brief_up/models/news_model.dart';
import 'package:dio/dio.dart';

class NewsRepo {
  final NewsService service;

  NewsRepo({required this.service});

  Future<List<NewsModel>> getNews() async {
    final Response response = await service.getTrendingNews();
    final data = response.data;
    List<NewsModel> newsList = [];
    for (var news in data['articles']) {
      newsList.add(NewsModel.fromJson(news));
    }
    return newsList;
  }
  Future<List<NewsModel>> getLatestNews() async {
    final Response response = await service.getLatestNews();
    final data = response.data;
    List<NewsModel> newsList = [];
    for (var news in data['articles']) {
      newsList.add(NewsModel.fromJson(news));
    }
    return newsList;
  }
}
