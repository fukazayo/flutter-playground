import 'dart:async';

import 'package:playground/intaractor/usecase/TickerUseCase.dart';
import 'package:playground/intaractor/usecase/entity/Ticker.dart';

class MainBloc {
  final _tickerUseCase = TickerUseCase();

  final _getTickerController = StreamController<void>();
  final _tickerController = StreamController<Ticker>();

  // Input
  StreamSink<void> get getTicker => _getTickerController.sink;

  // Output
  Stream<Ticker> get ticker => _tickerController.stream;

  MainBloc() {
    _getTickerController.stream.listen((_) => _getTicker());
  }

  void _getTicker() {
    _tickerUseCase.getTicker().then((value) {
      _tickerController.sink.add(value);
    });
  }

  void dispose() {
    _getTickerController.close();
    _tickerController.close();
  }
}
