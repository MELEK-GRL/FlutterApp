import 'package:dio/dio.dart';
import 'package:my_app/models/movieImdb_model.dart';

class MovieimdbServiceApi {
  final Dio dio = Dio();

  Future<List<MovieImdbModel>> getMovieImdb() async {
    const String apiKey =
        'apikey 0ebqUvivuBCWlaKmPoNph8:0qwjUi2zpXd2ik9attPn40';
    const String url =
        'https://api.collectapi.com/imdb/imdbSearchByName?query=inception';

    final response = await dio.get(
      url,
      options: Options(
        headers: {
          'authorization': apiKey,
          'content-type': 'content-type: application/json',
        },
      ),
    );

    final List result = response.data['result'];
    return result.map((e) => MovieImdbModel.fromJson(e)).toList();
  }
}
