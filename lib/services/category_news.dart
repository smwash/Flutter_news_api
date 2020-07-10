import 'dart:convert';

import 'package:http/http.dart' as http;
import '../models/article.dart';

const apiKey = 'c9bd0360c5714bb2bfeb0d76926e782f';

class CategoryNews {
  List<Article> categoryNews = [];

  Future<void> getCategoryNews(String category) async {
    String url =
        'https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=$apiKey';

    var response = await http.get(url);
    var data = jsonDecode(response.body);

    if (data['status'] == "ok") {
      data['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          Article article = Article(
            title: element['title'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            articleUrl: element['url'],
            content: element['content'],
            blogUrl: element['url'],
            author: element['author'],
          );
          categoryNews.add(article);
        }
      });
    } else {
      print('Failed to Load News');
    }
  }
}
