import 'package:flutter/material.dart';
import 'package:news_app_api/models/article.dart';
import 'package:news_app_api/screens/article_viewer.dart';

import 'category_news_container.dart';

class NewsContainer extends StatelessWidget {
  final Article article;

  NewsContainer({this.article});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ArticleWebView(blogUrl: article.blogUrl),
          ),
        );
      },
      child: ReusableNewsContainer(article: article),
    );
  }
}
