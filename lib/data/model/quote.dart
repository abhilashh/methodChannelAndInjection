
import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';
part 'quote.g.dart';

@immutable
@JsonSerializable()
class Quote {
  final String quote;
  final String author;
  final String lang;
  final List<String> tags;

  Quote({required this.quote, required this.author, required this.lang, required this.tags});

  factory Quote.fromJson(Map<String, dynamic> json) =>
      _$QuoteFromJson(json);

  Map<String, dynamic> toJson() => _$QuoteToJson(this);
}

@JsonSerializable()
class QuoteList {
  final List<Quote> quotes;

  QuoteList({required this.quotes});

  factory QuoteList.fromJson(Map<String, dynamic> json) =>
      _$QuoteListFromJson(json);

  Map<String, dynamic> toJson() => _$QuoteListToJson(this);
}