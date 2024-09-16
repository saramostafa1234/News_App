import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_c11_mon/data/datasources/api_manager.dart';
import 'package:news_app_c11_mon/features/home/source_manager/states.dart';

import '../../../models/source_model.dart';

class SourceCubit extends Cubit<SourcesStates> {
  SourceCubit() : super(LoadingSourcesState());

  static SourceCubit get(context) => BlocProvider.of(context);
  List<Source> _sourcesList = [];

  List<Source> get sourcesList => _sourcesList;

  Future<void> getNewsSourcesList(String categoryID) async {
    try {
      _sourcesList = await ApiManager.fetchSourcesList(categoryID);
      emit(SuccessSourcesState());
    } catch (error) {
      emit(ErrorSourcesState());
    }
  }
}
