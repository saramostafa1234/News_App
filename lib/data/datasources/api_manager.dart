import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app_c11_mon/core/config/constants.dart';
import 'package:news_app_c11_mon/models/articles_model.dart';
import 'package:news_app_c11_mon/models/source_model.dart';

class ApiManager {
  static Future<List<Source>> fetchSourcesList(String categoryID) async {
    //https://newsapi.org/v2/top-headlines/sources?category=business&apiKey=888abf028279430899b944e0dfdcc588
    var url = Uri.https(
      Constants.domain,
      "/v2/top-headlines/sources",
      {
        "apikey": Constants.apikey,
        "category": categoryID,
      },
    );
    final response = await http.get(url);
    if (response.statusCode == 200) {
      //we got the response object
      //parsing
      Map<String, dynamic> data = jsonDecode(response.body);
      SourcesModel sourcesModel = SourcesModel.fromJson(data);
      return sourcesModel.sources;
    } else
      throw Exception("Faild to get sources list..");
  }

  static Future<List<Article>> fetchArticalList(String sourcesID) async {
    var url = Uri.https(
      Constants.domain,
      "/v2/top-headlines",
      {
        "apikey": Constants.apikey,
        "sources": sourcesID,
      },
    );
    final response = await http.get(url);
    if (response.statusCode == 200) {
      //we got the response object
      //parsing
      Map<String, dynamic> data = jsonDecode(response.body);
      ArticleModel articlesModel = ArticleModel.fromJson(data);
      return articlesModel.articles;
    } else
      throw Exception("Faild to get sources list..");
  }
}
