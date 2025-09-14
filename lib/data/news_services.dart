import 'package:dio/dio.dart';

class NewsService {
  final Dio dio;
  static const String trendingUrl = 'https://newsapi.org/v2/everything?q=trending&apiKey=8443ed09d67241bea75d7090a9ebea5e';
  static const String latestUrl = 'https://newsapi.org/v2/everything?q=latest&apiKey=8443ed09d67241bea75d7090a9ebea5e';

  NewsService({required this.dio});
Future <Response> getTrendingNews() async {
  return dio.get(trendingUrl);
}
Future<Response> getLatestNews() async{
  return dio.get(latestUrl);
}
}