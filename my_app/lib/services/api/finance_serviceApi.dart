import 'package:dio/dio.dart';
import 'package:my_app/models/finance_model.dart';

class FinanceServiceApi {
  final Dio dio = Dio();

  Future<List<FinanceModel>> getFinance() async {
    const String apiKey =
        'apikey 0ebqUvivuBCWlaKmPoNph8:0qwjUi2zpXd2ik9attPn40';
    const String url =
        'https://api.collectapi.com/economy/currencyToAll?int=10&base=USD';

    final response = await dio.get(
      url,
      options: Options(
        headers: {'authorization': apiKey, 'content-type': 'application/json'},
      ),
    );
    final List result = response.data['result']['data'];
    return result
        .map((e) => FinanceModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
