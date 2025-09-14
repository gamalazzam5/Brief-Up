import 'package:flutter/material.dart';

import '../models/news_model.dart';
import '../screens/news_info.dart';
import '../screens/trending_screen.dart';

class TrendingCard extends StatelessWidget {
  final List<NewsModel> newsList;

  const TrendingCard({super.key, required this.newsList});

  @override
  Widget build(BuildContext context) {
    if (newsList.isEmpty) {
      return const SizedBox.shrink();
    }

    final firstNews = newsList.first;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Trending",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              TextButton(
                child: Text(
                  "See all",
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TrendingScreen(newsList: newsList),
                    ),
                  );
                },
              ),
            ],
          ),
          SizedBox(height: 24),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NewsInfoScreen(news:firstNews,)),
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: firstNews.imageUrl.isNotEmpty
                      ? Image.network(firstNews.imageUrl)
                      : const Icon(Icons.image, size: 200),
                ),

                SizedBox(height: 8),
                Text(
                  firstNews.title,
                  style: TextStyle(fontSize: 14, color: Color(0xFF4E4B66)),
                ),
                SizedBox(height: 4),
                Text(
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  firstNews.description,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
