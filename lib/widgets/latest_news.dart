import 'package:brief_up/models/news_model.dart';
import 'package:brief_up/screens/latest_news_screen.dart';
import 'package:brief_up/screens/news_info.dart';
import 'package:flutter/material.dart';

class  LatestNews extends StatelessWidget {
  final List<NewsModel> newsList;
  const  LatestNews({super.key, required this.newsList});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Latest',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextButton( child: Text(
              'See all',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder:(context)=>LatestNewsScreen(newsList: newsList)));
            },),
          ],
        ),
       ListView.builder(
           shrinkWrap: true,
           physics: NeverScrollableScrollPhysics(),
           itemCount: 10,
           itemBuilder: (context,index){
             final news = newsList[index];
         return  Padding(
           padding: const EdgeInsets.symmetric(vertical: 16),
           child: GestureDetector(
             onTap: (){
               Navigator.of(context).push(MaterialPageRoute(builder: (context)=>NewsInfoScreen(news: news,)));
             },
             child: Row(
               children: [
                 ClipRRect(
                   borderRadius: BorderRadius.circular(12),
                   child: news.imageUrl.isNotEmpty? Image.network(
                     news.imageUrl,
                     height: 90,
                     width: 90,
                   ):Image.asset('assets/images/image 2.png',height: 90,width: 90,),
                 ),
                 SizedBox(width: 4),
                 Expanded(
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.start,
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text(
                         news.title,
                         style: TextStyle(
                           fontSize: 14,
                           color: Color(0xFF4E4B66),
                         ),
                       ),
                       SizedBox(height: 8),
                       Text(
                         news.description,
                         style: TextStyle(
                           fontSize: 16,
                           fontWeight: FontWeight.w600,
                         ),
                         maxLines: 2,
                         overflow: TextOverflow.ellipsis,
                       ),
                     ],
                   ),
                 ),
               ],
             ),
           ),
         );
       })
      ],
    );
  }
}
