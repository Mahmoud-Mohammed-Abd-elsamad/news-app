import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

import '../../models/news_model.dart';
import '../../repositories/base_reepository.dart';

part 'search_screen_state.dart';

class SearchScreenCubit extends Cubit<SearchScreenState> {

  BaseRepository baseRepository;

  SearchScreenCubit({required this.baseRepository}) : super(SearchScreenInitial());

  List<Articles> listOfSearchData=[];

  Future<void> getNewsBySearch(String text) async {

    emit(SearchScreenShowLoading());

   var response = await baseRepository.getNewsBySearch(text);

    if (response.statusCode == 200) {
      emit(SearchScreenSuccess());

      NewsModel newsModel = NewsModel.fromJson(jsonDecode(response.body));
       listOfSearchData = newsModel.articles ??[];
    } else {
      emit(SearchScreenFailure("checking yor network failed"));
    }
  }
}
