import 'package:flutter/material.dart';

class  LatestNews extends StatelessWidget {
  const  LatestNews({super.key});

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
            Text(
              'See all',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
       ListView.builder(
           shrinkWrap: true,
           physics: NeverScrollableScrollPhysics(),
           itemCount: 10,
           itemBuilder: (context,index){
         return  Padding(
           padding: const EdgeInsets.symmetric(vertical: 16),
           child: Row(
             children: [
               ClipRRect(
                 borderRadius: BorderRadius.circular(12),
                 child: Image.asset(
                   'assets/images/image 2.png',
                   height: 90,
                   width: 90,
                 ),
               ),
               SizedBox(width: 4),
               Expanded(
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.start,
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Text(
                       'Europe',
                       style: TextStyle(
                         fontSize: 14,
                         color: Color(0xFF4E4B66),
                       ),
                     ),
                     SizedBox(height: 8),
                     Text(
                       "Ukraine's President Zelensky to BBC: Blood money being paid",
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
         );
       })
      ],
    );
  }
}
