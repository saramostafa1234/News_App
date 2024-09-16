import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:news_app_c11_mon/data/datasources/api_manager.dart';

import '../../../models/source_model.dart';

class SourcesView extends ChangeNotifier {
  List<Source> _sourcesList = [];

  List<Source> get sourcesList => _sourcesList;

  Future<void> getSourcesList(String categoryID) async {
    _sourcesList = await ApiManager.fetchSourcesList(categoryID);
    notifyListeners();
  }
}
