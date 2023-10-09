import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../models/sources_model.dart';
import '../../models/news_model.dart';
import '../../repositories/base_reepository.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {

  BaseRepository baseRepository;

  HomeCubit({required this.baseRepository}) : super(HomeInitial());

  List<Sources> sourcesList = [];
  List<Articles> articalsList = [];

  Future<void> getSources(String categoryId) async {
    emit(HomeSowLoading());
   await baseRepository.getSources(categoryId)
    .then((value) {
      var response = value;
      if (response.statusCode == 200) {
        emit(HomeGetSourcesSuccess());
        SourcesModel sourcesModel =
            SourcesModel.fromJson(jsonDecode(response.body));
        sourcesList = sourcesModel.sources!;

      }
    }).catchError((onError) {
      emit(HomeGetSourcesFailure(onError.toString()));
    });
  }

  Future<void> getNewsBySource(String sourceId) async {
    await baseRepository.getNewsBySource(sourceId).then((response) {
      emit(HomeSuccessGetNewsBySource());
      NewsModel newsModel = NewsModel.fromJson(jsonDecode(response.body));
      articalsList = newsModel.articles ?? [];

    }).catchError((onError) {
      emit(HomeFailureGetNewsBySource(onError));
    });
  }
}
