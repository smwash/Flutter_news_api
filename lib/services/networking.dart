import 'dart:convert';

import 'package:http/http.dart' as http;
import '../models/article.dart';

class NetworkHelper {
  List<Article> news = [];

  Future<void> getNews() async {
    String url =
        'https://newsapi.org/v2/top-headlines?country=us&apiKey=$apiKey';

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
          news.add(article);
        }
      });
    } else {
      print('Failed to Load News');
    }
  }
}
