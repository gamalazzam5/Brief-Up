import 'package:flutter/material.dart';

class TrendingCard extends StatelessWidget {
  const TrendingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Trending",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text("See all", style: TextStyle(fontSize: 14,color: Colors.grey)),
            ],
          ),
          SizedBox(height: 24),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset('assets/images/image 1.png'),
          ),
          SizedBox(height: 8),
          Text(
            'Europe',
            style: TextStyle(fontSize: 14, color: Color(0xFF4E4B66)),
          ),
          SizedBox(height: 4,),
          Text(
            maxLines: 2,
            overflow:TextOverflow.ellipsis ,
            'Russian warship: Moskva sinks in Black Sea',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,

            ),
          ),
        ],
      ),
    );
  }
}
