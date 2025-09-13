import 'package:brief_up/widgets/custom_text_field.dart';
import 'package:brief_up/widgets/latest_news.dart';
import 'package:flutter/material.dart';

import '../widgets/trending_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
          child: Column(
            children: [
              CustomTextFormField(hintText: 'Search'),
              const TrendingCard(),
              LatestNews()
            ],
          ),
        ),
      ),
    );
  }
}
