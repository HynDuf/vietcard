import 'package:flutter/cupertino.dart';
import 'package:vietcard/entity/card.dart';

enum ResultType {
  userDeckResult,
  publicDeckResult,
  cardResult,
}

class SearchResult {
  final ResultType type;
  final dynamic data;

  SearchResult(this.type, this.data);
}

class FlashcardSearch {
  final Flashcard card;
  final RichText searchSentence;

  FlashcardSearch(this.card, this.searchSentence);
}