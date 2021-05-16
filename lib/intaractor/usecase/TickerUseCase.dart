import 'package:playground/intaractor/repository/TickerApiRepository.dart';
import 'package:playground/intaractor/usecase/entity/Ticker.dart';

class TickerUseCase {
  final _tickerApiRepository = TickerApiRepository();

  Future<Ticker> getTicker() {
    return _tickerApiRepository.getTicker();
  }
}
