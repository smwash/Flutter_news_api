import 'package:flutter/material.dart';
import 'package:news_app_api/models/article.dart';
import 'package:news_app_api/screens/article_viewer.dart';
import 'package:news_app_api/services/category_news.dart';
import 'package:news_app_api/widgets/category_news_container.dart';
import 'package:news_app_api/widgets/newsContainer.dart';
import 'package:news_app_api/widgets/richtext.dart';

class CategoryNewsPage extends StatefulWidget {
  final String category;
  final Article article;

  const CategoryNewsPage({Key key, this.category, this.article})
      : super(key: key);
  @override
  _CategoryNewsPageState createState() => _CategoryNewsPageState();
}

class _CategoryNewsPageState extends State<CategoryNewsPage> {
  CategoryNews _categoryNews = CategoryNews();

  List<Article> articles = [];

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getCategoryNews();
  }

  getCategoryNews() async {
    await _categoryNews.getCategoryNews(widget.category.toLowerCase());
    articles = _categoryNews.categoryNews;
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black),
        title: RichTextContainer(),
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemCount: articles.length,
              itemBuilder: (context, index) {
                Article categoryArticles = articles[index];

                return GestureDetector(
                  child: ReusableNewsContainer(article: categoryArticles),
                  // onTap: () {
                  //   Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => ArticleWebView(blogUrl: ),
                  //     ),
                  //   );
                  // },
                );
              },
            ),
    );
  }
}
