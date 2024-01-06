import 'dart:convert';
import 'package:simple_news_app/models/breaking_news_model.dart';
import 'package:simple_news_app/utils/api_constants.dart';
import 'package:http/http.dart' as http;

class BreakNewsService {
  List<NewsArticle> newsList = [];
  bool isLoading = true;

  Future<List> getBreakingNews() async {
    isLoading = true;
    String url = '${ApiUtils.baseUrl}?country=in&apiKey=${ApiUtils.apiKey}';
    var uri = Uri.parse(url);
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      List articles = data['articles'];
      List<NewsArticle> newArticles =
          articles.map((article) => NewsArticle.fromJson(article)).toList();
      newsList.addAll(newArticles);
      print('--------------------------?????????????????$newArticles');
      return newsList;
      // breakingNewsPage++;
    } else {
      return [];
    }
  }
}
