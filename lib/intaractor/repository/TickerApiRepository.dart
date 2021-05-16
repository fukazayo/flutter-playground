import 'package:playground/intaractor/datastore/webapi/ApiClient.dart';
import 'package:playground/intaractor/usecase/entity/Ticker.dart';

class TickerApiRepository {
  final _apiClient = ApiClient.getClient();

  Future<Ticker> getTicker() async {
    return await _apiClient.getTicker().then((value) {
      return Ticker(
          last: value.last,
          bid: value.bid,
          ask: value.ask,
          high: value.high,
          low: value.low,
          volume: value.volume,
          date: value.timestamp);
    });
  }
}
