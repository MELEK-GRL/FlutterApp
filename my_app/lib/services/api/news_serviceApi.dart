import 'package:dio/dio.dart';
import 'package:my_app/models/news_model.dart';

class NewsServiceApi {
  final Dio dio = Dio();

  Future<List<NewsModel>> getNews() async {
    const String apiKey =
        'apikey 0ebqUvivuBCWlaKmPoNph8:0qwjUi2zpXd2ik9attPn40';
    const String url =
        'https://api.collectapi.com/news/getNews?country=tr&tag=general';

    final response = await dio.get(
      url,
      options: Options(
        headers: {'authorization': apiKey, 'content-type': 'application/json'},
      ),
    );

    final List result = response.data['result'];

    // debugPrint(const JsonEncoder.withIndent('  ').convert(result));
    return result.map((e) => NewsModel.fromJson(e)).toList();
  }
}
