import 'package:http/http.dart' as http;
import 'package:http/src/response.dart';

import '../../shared/component/const.dart';
import '../base_reepository.dart';

class  RemoteDataSource extends BaseRepository{
  @override
  Future<Response> getNewsBySource(String sourceId)async {
    Uri url = Uri.parse(
        "${Const.BASE_URL}${Const.GET_NEWS_BY_SOURCES_END_BOINT}?apiKey=${Const.PRIMARY_Key}&sources=$sourceId");
     http.Response response = await http.get(url);
    return response ;
  }

  @override
  Future<Response> getSources(String categoryId) {
    Uri url = Uri.parse(
        "${Const.BASE_URL}${Const.GET_SOURCESS_END_POINT}?apiKey=${Const.PRIMARY_Key}&category=$categoryId");

    return http.get(url);
  }

  @override
  Future<Response> getNewsBySearch(String text) async{
    Uri url = Uri.https("newsapi.org", "/v2/everything",
        {"apiKey": "173d65527b794f47bf16ad7adfe292fc", "q":text});
    http.Response response = await http.get(url);
    return response;
  }

}