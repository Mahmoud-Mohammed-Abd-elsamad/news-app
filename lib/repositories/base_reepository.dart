import 'package:http/http.dart';

abstract class BaseRepository{

  Future<Response> getSources(String categoryId);

  Future<Response> getNewsBySource(String sourceId);

  Future<Response> getNewsBySearch(String text);

}