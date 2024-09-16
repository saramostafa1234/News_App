import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_c11_mon/features/home/articles_manager/state.dart';
import 'package:news_app_c11_mon/models/articles_model.dart';

import '../../../data/datasources/api_manager.dart';

class ArticleCubit extends Cubit<ArticlesStates> {
  ArticleCubit() : super(LoadingArticlesStates());

  static ArticleCubit get(context) => BlocProvider.of(context);
  List<Article> _articlesList = [];

  List<Article> get articlesList => _articlesList;

  Future<void> getNewsArticlesList(String sourceID) async {
    try {
      _articlesList = await ApiManager.fetchArticalList(sourceID);
      emit(SuccessArticlesStates());
    } catch (error) {
      emit(ErrorArticlesStates());
    }
  }
}
