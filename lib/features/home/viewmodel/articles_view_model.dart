import 'package:flutter/material.dart';
import 'package:news_app_c11_mon/data/datasources/api_manager.dart';

import '../../../models/articles_model.dart';

class ArticleViewModel extends ChangeNotifier {
  List<Article> _articlesList = [];

  List<Article> get articlesList => _articlesList;

  Future<void> getArticlesList(String sourcesId) async {
    _articlesList = await ApiManager.fetchArticalList(sourcesId);
    notifyListeners();
  }
}
