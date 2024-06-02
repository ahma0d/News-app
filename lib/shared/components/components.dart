import 'package:flutter/material.dart';

Widget buildArticleItem (article,context)=> Padding(
  padding: const EdgeInsets.all(20.0),
  child: Row(
    children: [
      Container(
        width: 120.0,
        height: 120.0,
        decoration: BoxDecoration(
          borderRadius:BorderRadius.circular(10.0),
          image: DecorationImage(
            image:NetworkImage('${article['urlToImage']}'),
            fit: BoxFit.cover,
          ),
        ),

      ),
      const SizedBox(
        width: 20.0,
      ),
      Expanded(
        child: Container(
          height: 120.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(

                child: Text(
                  '${article['title']}',
                  maxLines:3,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyText1,
//const TextStyle(
//                     fontSize: 18.0,
//                     fontWeight: FontWeight.w600,
//
//                   ),
                ),
              ),
              Text(
                '${article['publishedAt']}',
                style: const TextStyle(
                  color: Colors.grey,

                ),

              ),
            ],
          ),
        ),
      ),

    ],
  ),
);
