import 'package:http/src/response.dart';

import '../base_reepository.dart';

class LocalDataSource extends BaseRepository{
  @override
  Future<Response> getNewsBySource(String sourceId) {
    // TODO: implement getNewsBySource
    throw UnimplementedError();
  }

  @override
  Future<Response> getSources(String categoryId) {
    // TODO: implement getSources
    throw UnimplementedError();
  }

  @override
  Future<Response> getNewsBySearch(String text) {
    // TODO: implement getNewsBySearch
    throw UnimplementedError();
  }
}