import 'package:flutter/material.dart';
import 'package:news_app_api/models/article.dart';
import 'package:news_app_api/services/networking.dart';
import 'package:news_app_api/widgets/newsContainer.dart';
import 'package:news_app_api/widgets/richtext.dart';
import 'package:news_app_api/widgets/tabBarContainer.dart';

import 'category_screen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  NetworkHelper _networkHelper = NetworkHelper();
  bool _isLoading = true;
  int _isSelected = 0;

  List<Article> newsList = List<Article>();

  @override
  void initState() {
    super.initState();
    getNews();
  }

  getNews() async {
    await _networkHelper.getNews();
    newsList = _networkHelper.news;
    setState(() {
      _isLoading = false;
    });
  }

  List<String> _categories = [
    'Business',
    'Entertainment',
    'Health',
    'Science',
    'Sports'
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black),
        leading: Icon(Icons.short_text),
        title: RichTextContainer(),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Icon(Icons.add_alert),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Icon(Icons.search),
          ),
        ],
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: size.height * 0.08,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: _categories.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 8.0,
                              horizontal: 10.0,
                            ),
                            child: GestureDetector(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    _categories[index],
                                    style: TextStyle(
                                        fontSize: 17.0,
                                        color: _isSelected == index
                                            ? Colors.black
                                            : Colors.black54,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.007,
                                  ),
                                  Container(
                                    height: size.height * 0.005,
                                    width: size.width * 0.08,
                                    decoration: BoxDecoration(
                                      color: _isSelected == index
                                          ? Colors.black87
                                          : Colors.transparent,
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                  ),
                                ],
                              ),
                              onTap: () {
                                Article myArticle = Article();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CategoryNewsPage(
                                      category: _categories[index],
                                      article: myArticle,
                                    ),
                                  ),
                                );
                                setState(() {
                                  _isSelected = index;
                                });
                              },
                            ),
                          );
                        }),
                  ),
                  Container(
                    child: ListView.builder(
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        itemCount: newsList.length,
                        itemBuilder: (context, index) {
                          Article article = newsList[index];
                          return NewsContainer(article: article);
                        }),
                  ),
                ],
              ),
            ),
    );
  }
}
