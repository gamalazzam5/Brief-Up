import 'package:brief_up/data/news_repo.dart';
import 'package:brief_up/data/news_services.dart';
import 'package:brief_up/models/news_model.dart';
import 'package:brief_up/widgets/custom_text_field.dart';
import 'package:brief_up/widgets/latest_news.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../widgets/trending_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<NewsModel>> _futureTrendingNews;
  late Future<List<NewsModel>> _futureLatestNews;

  @override
  void initState() {
    final repo = NewsRepo(service: NewsService(dio: Dio()));
    _futureTrendingNews = repo.getNews();
    _futureLatestNews = repo.getLatestNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 24.0),
          child: Image.asset(
            "assets/images/newspaper-fill 1.png",
            height: 32,
            width: 45,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24.0),
            child: Icon(Icons.notifications_outlined, color: Colors.black),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 40, left: 24, right: 24),
        child: SingleChildScrollView(
          child: FutureBuilder<List<NewsModel>>(
            future: _futureTrendingNews,
            builder:
                (
                  BuildContext context,
                  AsyncSnapshot<List<NewsModel>> snapshot,
                ) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text("Error: ${snapshot.error}"));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text("No news available"));
                  }

                  final newsList = snapshot.data!;
                  return Column(
                    children: [
                      CustomTextFormField(hintText: 'Search'),
                      TrendingCard(newsList: newsList),
                      FutureBuilder<List<NewsModel>>(
                        future: _futureLatestNews,
                        builder:
                            (
                              BuildContext context,
                              AsyncSnapshot<List<NewsModel>> snapshot,
                            ) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              } else if (snapshot.hasError) {
                                return Center(
                                  child: Text("Error: ${snapshot.error}"),
                                );
                              } else if (!snapshot.hasData ||
                                  snapshot.data!.isEmpty) {
                                return const Center(
                                  child: Text("No news available"),
                                );
                              }

                              final newsList = snapshot.data!;
                              return LatestNews(newsList: newsList,);
                            },
                      ),
                    ],
                  );
                },
          ),
        ),
      ),
    );
  }
}
