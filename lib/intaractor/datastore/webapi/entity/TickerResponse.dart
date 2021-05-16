import 'package:json_annotation/json_annotation.dart';

part 'TickerResponse.g.dart';

@JsonSerializable()
class TickerResponse {
  double last;
  double bid;
  double ask;
  double high;
  double low;
  double volume;
  double timestamp;

  TickerResponse(
      {required this.last,
      required this.bid,
      required this.ask,
      required this.high,
      required this.low,
      required this.volume,
      required this.timestamp});

  factory TickerResponse.fromJson(Map<String, dynamic> json) =>
      _$TickerResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TickerResponseToJson(this);
}
